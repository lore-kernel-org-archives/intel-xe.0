Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0810CC71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 02:48:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD37510E57D;
	Tue,  8 Jul 2025 02:48:53 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F1D10E57D;
 Tue,  8 Jul 2025 02:48:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3548991298964523606=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/pat=3A_Use_XE=5FWA_?=
 =?utf-8?q?in_xe=5Fpat=5Finit=5Fearly?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ashutosh Dixit" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 02:48:52 -0000
Message-ID: <175194293221.141890.9470444943814398514@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707222111.3214505-1-ashutosh.dixit@intel.com>
In-Reply-To: <20250707222111.3214505-1-ashutosh.dixit@intel.com>
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

--===============3548991298964523606==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pat: Use XE_WA in xe_pat_init_early
URL   : https://patchwork.freedesktop.org/series/151299/
State : failure

== Summary ==

CI Bug Log - changes from xe-3367-02069d358330d2c30eb66590736f360964d88612_FULL -> xe-pw-151299v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-151299v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-151299v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-151299v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible.html

  
#### Warnings ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [SKIP][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [PASS][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26], [PASS][27], [PASS][28]) ([Intel XE#378]) -> ([ABORT][29], [ABORT][30], [ABORT][31], [ABORT][32], [ABORT][33], [ABORT][34], [ABORT][35], [ABORT][36], [ABORT][37], [ABORT][38], [ABORT][39], [ABORT][40], [ABORT][41], [ABORT][42], [ABORT][43], [ABORT][44], [ABORT][45], [ABORT][46], [ABORT][47], [ABORT][48], [ABORT][49], [ABORT][50], [ABORT][51], [ABORT][52])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-6/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-6/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-4/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-6/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-6/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-6/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-7/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-7/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-5/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-5/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-3/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-3/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-7/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-3/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-4/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-4/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-5/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-5/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-7/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-3/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-3/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-3/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-1/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-4/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-4/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-4/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-2/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-2/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-1/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-1/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-7/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-7/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-7/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-7/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-5/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-5/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59], [PASS][60], [PASS][61], [PASS][62], [PASS][63], [PASS][64], [PASS][65], [PASS][66], [PASS][67], [PASS][68], [PASS][69], [PASS][70], [SKIP][71], [PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77]) ([Intel XE#2457]) -> ([ABORT][78], [ABORT][79], [ABORT][80], [ABORT][81], [ABORT][82], [ABORT][83], [ABORT][84], [ABORT][85], [ABORT][86], [ABORT][87], [ABORT][88], [ABORT][89], [ABORT][90], [ABORT][91], [ABORT][92], [ABORT][93], [ABORT][94], [ABORT][95], [ABORT][96])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-1/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-3/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-3/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-1/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-1/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-6/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-2/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-6/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-6/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-5/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-2/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-7/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-7/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-8/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-8/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-7/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-8/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-1/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-1/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-4/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-4/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-4/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-5/igt@xe_module_load@load.html

  
New tests
---------

  New tests have been introduced between xe-3367-02069d358330d2c30eb66590736f360964d88612_FULL and xe-pw-151299v1_FULL:

### New IGT tests (1) ###

  * igt@kms_flip@blocking-wf_vblank@d-hdmi-a2:
    - Statuses : 1 pass(s)
    - Exec time: [4.33] s

  

Known issues
------------

  Here are the changes found in xe-pw-151299v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     NOTRUN -> [FAIL][97] ([Intel XE#4208])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@core_getversion@all-cards.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     [PASS][98] -> [SKIP][99] ([Intel XE#2134])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@fbdev@eof.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@fbdev@eof.html

  * igt@fbdev@read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#2134])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@fbdev@read.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#4208] / [Intel XE#4618]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#1124]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#367]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][105] -> [SKIP][106] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#455] / [Intel XE#787]) +36 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#787]) +244 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#3442])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#4416]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_hpd@vga-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#373]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-after-hibernate.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][112] -> [SKIP][113] ([Intel XE#4208] / [i915#2575]) +61 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#4494])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:
    - shard-adlp:         [PASS][115] -> [DMESG-WARN][116] ([Intel XE#4543])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][117] -> [DMESG-WARN][118] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][119] -> [DMESG-FAIL][120] ([Intel XE#4543]) +1 other test dmesg-fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][121] -> [FAIL][122] ([Intel XE#1874]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#651]) +5 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#653]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2925])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#4208] / [i915#2575]) +70 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#5020])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1489]) +3 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2351] / [Intel XE#4208]) +23 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#3414]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][132] -> [FAIL][133] ([Intel XE#2883]) +1 other test fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-435/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#455]) +8 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine_class_compute.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][136] ([Intel XE#1126])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eu_stall@non-blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#5419])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_eu_stall@non-blocking-read.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][138] ([Intel XE#4837]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#4208]) +324 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][140] -> [SKIP][141] ([Intel XE#1392])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#288]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#4915]) +65 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#255])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html

  * igt@xe_module_load@reload:
    - shard-dg2-set2:     [PASS][145] -> [FAIL][146] ([Intel XE#4208]) +1 other test fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_module_load@reload.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_module_load@reload.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][147] ([Intel XE#1173])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#944])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][149] -> [SKIP][150] ([Intel XE#4208]) +147 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#2134]) -> [PASS][152] +1 other test pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@fbdev@write.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@fbdev@write.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#4208] / [i915#2575]) -> [PASS][154] +136 other tests pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][155] ([Intel XE#3908]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-dg2-set2:     [INCOMPLETE][157] -> [PASS][158] +1 other test pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][159] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][160] +1 other test pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:
    - shard-adlp:         [DMESG-FAIL][161] ([Intel XE#4543]) -> [PASS][162] +1 other test pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][164] +17 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][165] ([Intel XE#2883]) -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-8/igt@kms_setmode@basic.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-1/igt@kms_setmode@basic.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#4208]) -> [PASS][168] +278 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exec_balancer@once-parallel-rebind.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#1392]) -> [PASS][170] +4 other tests pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#623]) -> [SKIP][172] ([Intel XE#4208] / [i915#2575])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][174] ([Intel XE#316]) +2 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#316]) -> [SKIP][176] ([Intel XE#4208])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#4208]) -> [SKIP][178] ([Intel XE#316])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#316]) -> [SKIP][180] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [INCOMPLETE][181] -> [SKIP][182] ([Intel XE#4208])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#1124]) -> [SKIP][184] ([Intel XE#4208]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#607]) -> [SKIP][186] ([Intel XE#2351] / [Intel XE#4208])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][188] ([Intel XE#1124]) +5 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][190] ([Intel XE#619])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#1124]) -> [SKIP][192] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4208]) -> [SKIP][194] ([Intel XE#1124]) +7 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#2191]) -> [SKIP][196] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208] / [i915#2575]) -> [SKIP][198] ([Intel XE#2191]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#4208] / [i915#2575]) -> [SKIP][200] ([Intel XE#367]) +2 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#367]) -> [SKIP][202] ([Intel XE#4208] / [i915#2575])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][204] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][206] ([Intel XE#4208]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][208] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#3442]) -> [SKIP][210] ([Intel XE#4208])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#3862]) -> [SKIP][212] ([Intel XE#4208])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#4208]) -> [SKIP][214] ([Intel XE#2907])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2907]) -> [SKIP][216] ([Intel XE#4208])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#4208]) -> [SKIP][218] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#306]) -> [SKIP][220] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208] / [i915#2575]) -> [SKIP][222] ([Intel XE#306])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_chamelium_color@ctm-green-to-red.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#373]) -> [SKIP][224] ([Intel XE#4208] / [i915#2575]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#4208] / [i915#2575]) -> [SKIP][226] ([Intel XE#373]) +14 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4208] / [i915#2575]) -> [SKIP][228] ([Intel XE#307]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_content_protection@dp-mst-type-1.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][229] ([Intel XE#1178]) -> [SKIP][230] ([Intel XE#4208] / [i915#2575])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_content_protection@srm.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#308]) -> [SKIP][232] ([Intel XE#4208] / [i915#2575])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#4208] / [i915#2575]) -> [SKIP][234] ([Intel XE#308]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#455]) -> [SKIP][236] ([Intel XE#4208] / [i915#2575]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#323]) -> [SKIP][238] ([Intel XE#4208] / [i915#2575])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208]) -> [SKIP][240] ([Intel XE#4356])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_dp_link_training@uhbr-mst.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#455]) -> [SKIP][242] ([Intel XE#2351] / [Intel XE#4208])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4208]) -> [SKIP][244] ([Intel XE#4422])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#703]) -> [SKIP][246] ([Intel XE#4208] / [i915#2575])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208] / [i915#2575]) -> [SKIP][248] ([Intel XE#1138])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#1135]) -> [SKIP][250] ([Intel XE#4208] / [i915#2575])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][252] ([Intel XE#455]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#455]) -> [SKIP][254] ([Intel XE#4208]) +2 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208]) -> [SKIP][256] ([Intel XE#651]) +32 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#651]) -> [SKIP][258] ([Intel XE#4208]) +18 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#651]) -> [SKIP][260] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][262] ([Intel XE#658])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][264] ([Intel XE#651]) +10 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#653]) -> [SKIP][266] ([Intel XE#4208]) +17 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#653]) -> [SKIP][268] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208]) -> [SKIP][270] ([Intel XE#455]) +3 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#4208]) -> [SKIP][272] ([Intel XE#1158])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][274] ([Intel XE#653]) +8 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#4208]) -> [SKIP][276] ([Intel XE#653]) +33 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#4208]) -> [SKIP][278] ([Intel XE#346]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_joiner@basic-big-joiner.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#5021]) -> [SKIP][280] ([Intel XE#4208] / [i915#2575])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#870]) -> [SKIP][282] ([Intel XE#4208])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2938]) -> [SKIP][284] ([Intel XE#4208])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_pm_backlight@brightness-with-dpms.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#870]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_pm_backlight@fade.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#4208]) -> [SKIP][288] ([Intel XE#1129])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_pm_dc@dc5-psr.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#4208]) -> [SKIP][290] ([Intel XE#908])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#4208]) -> [SKIP][292] ([Intel XE#1489]) +10 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#1489]) -> [SKIP][294] ([Intel XE#4208]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1122]) -> [SKIP][296] ([Intel XE#4208])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208]) -> [SKIP][298] ([Intel XE#1122]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_psr2_su@page_flip-p010.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][300] ([Intel XE#4208]) +6 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#4208]) -> [SKIP][302] ([Intel XE#2850] / [Intel XE#929]) +16 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][304] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_psr@psr-dpms.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][306] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_psr@psr-primary-page-flip.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#4208] / [i915#2575]) -> [SKIP][308] ([Intel XE#1127])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#3414]) -> [SKIP][310] ([Intel XE#4208] / [i915#2575])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#1127]) -> [SKIP][312] ([Intel XE#4208] / [i915#2575])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#4208] / [i915#2575]) -> [SKIP][314] ([Intel XE#3414])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208] / [i915#2575]) -> [SKIP][316] ([Intel XE#1500])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#4208] / [i915#2575]) -> [SKIP][318] ([Intel XE#455]) +10 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_vrr@flipline.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#4208]) -> [SKIP][320] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_compute_preempt@compute-preempt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#4208]) -> [SKIP][322] ([Intel XE#5249])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_configfs@survivability-mode.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_configfs@survivability-mode.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#4208]) -> [SKIP][324] ([Intel XE#1123])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfd.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#5419]) -> [SKIP][326] ([Intel XE#4208])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#4208]) -> [SKIP][328] ([Intel XE#5419])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_eu_stall@invalid-event-report-count.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#4837]) -> [SKIP][330] ([Intel XE#4208]) +9 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#4208]) -> [SKIP][332] ([Intel XE#4837]) +17 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#4208]) -> [SKIP][334] ([Intel XE#4518])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_eudebug_sriov@deny-eudebug.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#4208]) -> [SKIP][336] ([Intel XE#1392]) +4 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#288]) -> [SKIP][338] ([Intel XE#4208]) +13 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_exec_fault_mode@many-basic.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#4208]) -> [SKIP][340] ([Intel XE#288]) +36 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#4208]) -> [SKIP][342] ([Intel XE#2360])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#2360]) -> [SKIP][344] ([Intel XE#4208]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#4208]) -> [SKIP][346] ([Intel XE#4915]) +367 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#4915]) -> [SKIP][348] ([Intel XE#4208]) +194 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [ABORT][349] ([Intel XE#4917]) -> [SKIP][350] ([Intel XE#4208])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][352] ([Intel XE#4208]) +3 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_oa@non-privileged-access-vaddr.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@oa-unit-exclusive-stream-sample-oa:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#4208]) -> [SKIP][354] ([Intel XE#2541] / [Intel XE#3573]) +10 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html

  * igt@xe_oa@syncs-syncobj-none:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][356] ([Intel XE#4208])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_oa@syncs-syncobj-none.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_oa@syncs-syncobj-none.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#4208]) -> [SKIP][358] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_oa@syncs-userptr-wait-cfg.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#977]) -> [SKIP][360] ([Intel XE#4208])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_pat@pat-index-xe2.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][362] ([Intel XE#1173])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_peer2peer@write.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#4208]) -> [SKIP][364] ([Intel XE#2284] / [Intel XE#366])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pm@d3cold-basic.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][366] ([Intel XE#4208])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_pm@d3cold-mmap-system.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#2284]) -> [SKIP][368] ([Intel XE#4208])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#4208]) -> [SKIP][370] ([Intel XE#4650])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pmu@fn-engine-activity-load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#4208]) -> [SKIP][372] ([Intel XE#4733]) +3 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#4733]) -> [SKIP][374] ([Intel XE#4208])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#944]) -> [SKIP][376] ([Intel XE#4208]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_query@multigpu-query-topology.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_query@multigpu-query-topology.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208]) -> [SKIP][378] ([Intel XE#944]) +3 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#4208]) -> [SKIP][380] ([Intel XE#4814])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#4208]) -> [SKIP][382] ([Intel XE#4821])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_spin_batch@spin-mem-copy.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#4208]) -> [SKIP][384] ([Intel XE#4130]) +1 other test skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#4208]) -> [SKIP][386] ([Intel XE#3342])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_sriov_flr@flr-each-isolation.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4351]) -> [SKIP][388] ([Intel XE#4208])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_sriov_scheduling@equal-throughput.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_sriov_scheduling@equal-throughput.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5249
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3367-02069d358330d2c30eb66590736f360964d88612 -> xe-pw-151299v1

  IGT_8445: 8445
  xe-3367-02069d358330d2c30eb66590736f360964d88612: 02069d358330d2c30eb66590736f360964d88612
  xe-pw-151299v1: 151299v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/index.html

--===============3548991298964523606==
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
<tr><td><b>Series:</b></td><td>drm/xe/pat: Use XE_WA in xe_pat_init_early</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/151299/">https://patchwork.freedesktop.org/series/151299/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-151299v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151299v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3367-02069d358330d2c30eb66590736f36096=
4d88612_FULL -&gt; xe-pw-151299v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-151299v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-151299v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1512=
99v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-rmfb-interruptible:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-2/igt@kms_flip@flip-v=
s-rmfb-interruptible.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-l=
nl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/sha=
rd-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612=
/shard-lnl-6/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d8=
8612/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f3609=
64d88612/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f=
360964d88612/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590=
736f360964d88612/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb6=
6590736f360964d88612/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c3=
0eb66590736f360964d88612/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330=
d2c30eb66590736f360964d88612/shard-lnl-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d35=
8330d2c30eb66590736f360964d88612/shard-lnl-1/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-0206=
9d358330d2c30eb66590736f360964d88612/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-=
02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-3/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-3/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-lnl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-=
lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d8861=
2/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl=
-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-3/igt@xe_module_load@load.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51299v1/shard-lnl-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-1/igt@xe_mo=
dule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151299v1/shard-lnl-4/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shar=
d-lnl-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-4/igt@xe_module_load@lo=
ad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151299v1/shard-lnl-4/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-2/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151299v1/shard-lnl-2/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299=
v1/shard-lnl-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_=
load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_load@load.html">ABORT</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl=
-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-6/igt@xe_module_load@load.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51299v1/shard-lnl-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-1/igt@xe_mo=
dule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-151299v1/shard-lnl-7/igt@xe_module_load@load.html">ABORT</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shar=
d-lnl-7/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-7/igt@xe_module_load@lo=
ad.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151299v1/shard-lnl-7/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-lnl-5/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-151299v1/shard-lnl-5/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299=
v1/shard-lnl-5/igt@xe_module_load@load.html">ABORT</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/sha=
rd-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612=
/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d8=
8612/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f3609=
64d88612/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f=
360964d88612/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590=
736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb6=
6590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c3=
0eb66590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d358330=
d2c30eb66590736f360964d88612/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-02069d35=
8330d2c30eb66590736f360964d88612/shard-bmg-6/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-0206=
9d358330d2c30eb66590736f360964d88612/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3367-=
02069d358330d2c30eb66590736f360964d88612/shard-bmg-8/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3367-02069d358330d2c30eb66590736f360964d88612/sh=
ard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-2=
/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-6/igt@xe_module_load@load.html=
">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
299v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-3/igt@xe_modu=
le_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-151299v1/shard-bmg-3/igt@xe_module_load@load.html">ABORT</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-=
bmg-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-2/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151299v1/shard-bmg-7/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-7/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-151299v1/shard-bmg-8/igt@xe_module_load@load.html">ABORT=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/s=
hard-bmg-8/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-7/igt@xe_module_load=
@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-151299v1/shard-bmg-8/igt@xe_module_load@load.html">ABORT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-1/i=
gt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-151299v1/shard-bmg-1/igt@xe_module_load@load.html">=
ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15129=
9v1/shard-bmg-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bmg-4/igt@xe_module=
_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-151299v1/shard-bmg-4/igt@xe_module_load@load.html">ABORT</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-bm=
g-5/igt@xe_module_load@load.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3367-02069d358330d2c30eb665907=
36f360964d88612_FULL and xe-pw-151299v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_flip@blocking-wf_vblank@d-hdmi-a2:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [4.33] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-151299v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@core_getversion@all-cards.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@fbdev@=
eof.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-151299v1/shard-dg2-463/igt@fbdev@eof.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@fbdev@read.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel =
XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@intel_=
sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-d=
g2-436/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4618">Intel XE#4618</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_ccs@bad-rotation-90-y-t=
iled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +36 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +244 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-a=
fter-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issu=
es/2575">i915#2575</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-2/igt@kms_fli=
p@flip-vs-rmfb-interruptible@d-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-2/igt@kms_f=
lip@flip-vs-rmfb-interruptible@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-1/igt@kms_fli=
p@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-9/igt@km=
s_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#295=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173=
">Intel XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">=
Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_lease@invalid-create-le=
ases.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) +70 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-pr=
imary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_rotation_crc@bad-tiling=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-435/igt@kms_se=
tmode@basic@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_setmode@bas=
ic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram@engine-drm_xe_engine=
_class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_compute_preempt@compute-=
preempt-many-all-ram@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_copy_basic@mem-set-linea=
r-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_eu_stall@non-blocking-re=
ad.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_eudebug@basic-vm-access-=
parameters.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_exec_balancer@twice-virt=
ual-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +324 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-433/igt@xe_exec_fault_mode@many-exe=
cqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_exec_system_allocator@th=
reads-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_huc_copy@huc_copy.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
5">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_mod=
ule_load@reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_module_load@reload.html"=
>FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_query@multigpu-query-hwc=
onfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_vm@=
large-split-binds-536870912.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_vm@large-spl=
it-binds-536870912.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +147 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@fbdev@=
write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@fbdev@write.html">PASS<=
/a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_atomic_transition@modeset-trans=
ition-nonblocking-fencing.html">PASS</a> +136 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-1/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/=
shard-adlp-9/igt@kms_atomic_transition@plane-toggle-modeset-transition.html=
">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-435/igt@kms_cu=
rsor_crc@cursor-suspend.html">INCOMPLETE</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_cursor_cr=
c@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-8/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-151299v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.=
html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-x-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-151299v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-x-to-x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primsc=
rn-cur-indfb-move.html">PASS</a> +17 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-adlp-8/igt@kms_set=
mode@basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-adlp-1/igt@kms_setmode@basic.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exe=
c_balancer@once-parallel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/=
igt@xe_exec_balancer@once-parallel-rebind.html">PASS</a> +278 other tests p=
ass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg=
2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +4 ot=
her tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-=
463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bi=
g_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard=
-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_bi=
g_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_=
big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@=
kms_big_fb@x-tiled-16bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@kms=
_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">INCOMPLETE</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-d=
g2-436/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@k=
ms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2=
-436/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/sh=
ard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151299v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Int=
el XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-151299v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/=
shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151299v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-3=
840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_bw=
@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
99v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_bw=
@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-43=
6/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_cc=
s@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
299v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_cc=
s@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299=
v1/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299=
v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2=
-436/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/=
shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">=
Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435=
/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436=
/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-=
435/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ch=
amelium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cham=
elium_color@ctm-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ch=
amelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/sh=
ard-dg2-435/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ch=
amelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-43=
6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435=
/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +14 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/sh=
ard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_co=
ntent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
299v1/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/30=
8">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/=
shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
99v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_=
feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-=
dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">In=
tel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-32bpp-yftileccs-downscaling.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-151299v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32b=
pp-ytilercccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
99v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299=
v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51299v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/s=
hard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#65=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p=
-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151=
299v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/=
igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/=
igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-151299v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primsc=
rn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/=
igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +33 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_jo=
iner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_joi=
ner@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/346">Intel XE#346</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms=
_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_pm=
_backlight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_pm_backli=
ght@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@kms_pm_dc@deep-=
pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ps=
r2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151299v1/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-conti=
nuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ps=
r2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1512=
99v1/shard-dg2-436/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous=
-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@km=
s_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2=
-463/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@=
kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)=
 +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2=
-435/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929<=
/a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
51299v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-=
dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard=
-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
151299v1/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i=
915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-151299v1/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-ch=
amelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@=
xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_c=
onfigfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5249">Intel XE#5249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_cop=
y_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@=
xe_copy_basic@mem-copy-linear-0xfd.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_eu_=
stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_e=
u_stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-4=
36/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_eud=
ebug_online@resume-dss.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +17 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_eud=
ebug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_eu=
debug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-151299v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm=
-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_exe=
c_fault_mode@many-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_exec=
_fault_mode@many-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +13 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shar=
d-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Int=
el XE#288</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/s=
hard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
60">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg=
2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151299v1/shard-dg2-432/igt@xe_exec_system_allocator@threa=
ds-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) +367 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +194 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-433/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v=
1/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_oa@=
non-privileged-access-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard=
-dg2-436/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-exclusive-stream-sample-oa:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_oa@=
oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-43=
5/igt@xe_oa@oa-unit-exclusive-stream-sample-oa.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-none:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_oa@=
syncs-syncobj-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/=
shard-dg2-436/igt@xe_oa@syncs-syncobj-none.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-466/igt@xe_oa@=
syncs-userptr-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-463/igt@xe_pat@pat-index=
-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe=
_peer2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_pm@d3cold-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_pm@=
d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pmu=
@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_p=
mu@fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_pxp=
@display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_pxp@displa=
y-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-464/igt@xe_pxp=
@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-=
dg2-436/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/igt@xe_q=
uery@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-4=
35/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-432/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_spi=
n_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-464/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_sri=
ov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2=
-435/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#413=
0</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-436/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-435/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3367-02069d358330d2c30eb66590736f360964d88612/shard-dg2-434/igt@xe_sri=
ov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151299v1/shard-dg2-436/=
igt@xe_sriov_scheduling@equal-throughput.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3367-02069d358330d2c30eb66590736f360964d88612 -&gt; xe-pw-151=
299v1</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3367-02069d358330d2c30eb66590736f360964d88612: 02069d358330d2c30eb6659=
0736f360964d88612<br />
  xe-pw-151299v1: 151299v1</p>

</body>
</html>

--===============3548991298964523606==--
