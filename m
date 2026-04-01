Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E483D35159
	for <intel-xe@archiver.kernel.org>; Wed,  1 Apr 2026 08:20:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B7B310F01F;
	Wed,  1 Apr 2026 08:20:36 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF20910F016;
 Wed,  1 Apr 2026 08:20:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7704877079893797478=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dmc=3A_Reduce_wake?=
 =?utf-8?q?lock_hold_time?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dibin Moolakadan Subrahmanian" <dibin.moolakadan.subrahmanian@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Apr 2026 08:20:34 -0000
Message-ID: <177503163476.421728.11914205367531919865@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260401073159.3227703-1-dibin.moolakadan.subrahmanian@intel.com>
In-Reply-To: <20260401073159.3227703-1-dibin.moolakadan.subrahmanian@intel.com>
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

--===============7704877079893797478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dmc: Reduce wakelock hold time
URL   : https://patchwork.freedesktop.org/series/164218/
State : success

== Summary ==

CI Bug Log - changes from xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f_BAT -> xe-pw-164218v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 14)
------------------------------

  Additional (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-164218v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2] ([Intel XE#7483])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@xe_evict@evict-small-external-cm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][3] ([Intel XE#261] / [Intel XE#5564] / [Intel XE#688]) +9 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - bat-adlp-vm:        NOTRUN -> [SKIP][4] ([Intel XE#5563] / [Intel XE#688])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-adlp-vm:        NOTRUN -> [SKIP][5] ([Intel XE#288] / [Intel XE#5561]) +32 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-adlp-vm:        NOTRUN -> [SKIP][6] ([Intel XE#2229] / [Intel XE#5488])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-adlp-vm:        NOTRUN -> [SKIP][7] ([Intel XE#1008] / [Intel XE#5591])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xe2:
    - bat-adlp-vm:        NOTRUN -> [SKIP][8] ([Intel XE#977])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-adlp-vm:        NOTRUN -> [SKIP][9] ([Intel XE#2838] / [Intel XE#979])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-adlp-vm:        NOTRUN -> [SKIP][10] ([Intel XE#979])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][11] -> [TIMEOUT][12] ([Intel XE#6506])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [DMESG-WARN][13] ([Intel XE#7483]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Warnings ####

  * igt@xe_pat@pat-index-xehpc:
    - bat-ptl-vm:         [SKIP][15] ([Intel XE#5777]) -> [SKIP][16] ([Intel XE#5777] / [Intel XE#7590])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-1:          [SKIP][17] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][18] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-2:          [SKIP][19] ([Intel XE#1420]) -> [SKIP][20] ([Intel XE#1420] / [Intel XE#7590])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-2:          [SKIP][21] ([Intel XE#7247]) -> [SKIP][22] ([Intel XE#7247] / [Intel XE#7590])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-bmg-1:          [SKIP][23] ([Intel XE#1420]) -> [SKIP][24] ([Intel XE#1420] / [Intel XE#7590])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html
    - bat-lnl-2:          [SKIP][25] ([Intel XE#1420] / [Intel XE#2838]) -> [SKIP][26] ([Intel XE#1420] / [Intel XE#2838] / [Intel XE#7590])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-2:          [SKIP][27] ([Intel XE#5777]) -> [SKIP][28] ([Intel XE#5777] / [Intel XE#7590])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html
    - bat-wcl-1:          [SKIP][29] ([Intel XE#7247]) -> [SKIP][30] ([Intel XE#7247] / [Intel XE#7590])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html
    - bat-ptl-1:          [SKIP][31] ([Intel XE#5777]) -> [SKIP][32] ([Intel XE#5777] / [Intel XE#7590])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-bmg-2:          [SKIP][33] ([Intel XE#2245]) -> [SKIP][34] ([Intel XE#2245] / [Intel XE#7590])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html
    - bat-bmg-1:          [SKIP][35] ([Intel XE#2245]) -> [SKIP][36] ([Intel XE#2245] / [Intel XE#7590])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-2:          [SKIP][37] ([Intel XE#977]) -> [SKIP][38] ([Intel XE#7590] / [Intel XE#977])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-1:          [SKIP][39] ([Intel XE#7242]) -> [SKIP][40] ([Intel XE#7242] / [Intel XE#7590])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-vm:         [SKIP][41] ([Intel XE#5771]) -> [SKIP][42] ([Intel XE#5771] / [Intel XE#7590])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html
    - bat-wcl-2:          [SKIP][43] ([Intel XE#7242]) -> [SKIP][44] ([Intel XE#7242] / [Intel XE#7590])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-2/igt@xe_pat@pat-index-xelp.html
    - bat-lnl-1:          [SKIP][45] ([Intel XE#977]) -> [SKIP][46] ([Intel XE#7590] / [Intel XE#977])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-2:          [SKIP][47] ([Intel XE#5771]) -> [SKIP][48] ([Intel XE#5771] / [Intel XE#7590])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-2/igt@xe_pat@pat-index-xelp.html
    - bat-ptl-1:          [SKIP][49] ([Intel XE#5771]) -> [SKIP][50] ([Intel XE#5771] / [Intel XE#7590])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-1/igt@xe_pat@pat-index-xelp.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-ptl-1:          [SKIP][51] ([Intel XE#5780]) -> [SKIP][52] ([Intel XE#5780] / [Intel XE#7590])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-vm:         [SKIP][53] ([Intel XE#5780]) -> [SKIP][54] ([Intel XE#5780] / [Intel XE#7590])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-1:          [SKIP][55] ([Intel XE#979]) -> [SKIP][56] ([Intel XE#7590] / [Intel XE#979])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-2:          [SKIP][57] ([Intel XE#2236]) -> [SKIP][58] ([Intel XE#2236] / [Intel XE#7590])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-2:          [SKIP][59] ([Intel XE#7248]) -> [SKIP][60] ([Intel XE#7248] / [Intel XE#7590])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-bmg-1:          [SKIP][61] ([Intel XE#2236]) -> [SKIP][62] ([Intel XE#2236] / [Intel XE#7590])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html
    - bat-lnl-2:          [SKIP][63] ([Intel XE#2236] / [Intel XE#979]) -> [SKIP][64] ([Intel XE#2236] / [Intel XE#7590] / [Intel XE#979])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-ptl-2:          [SKIP][65] ([Intel XE#5780]) -> [SKIP][66] ([Intel XE#5780] / [Intel XE#7590])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html
    - bat-wcl-1:          [SKIP][67] ([Intel XE#7248]) -> [SKIP][68] ([Intel XE#7248] / [Intel XE#7590])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#5488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5563]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563
  [Intel XE#5564]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564
  [Intel XE#5591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591
  [Intel XE#5771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#7242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242
  [Intel XE#7247]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247
  [Intel XE#7248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248
  [Intel XE#7483]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f -> xe-pw-164218v1

  IGT_8839: 8839
  xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f: e024431a4dc3a2cc320e6093dd95d0c5d0e2935f
  xe-pw-164218v1: 164218v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/index.html

--===============7704877079893797478==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <title>Project List - Patchwork</title>
  <style id="css-table-select" type="text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>drm/i915/dmc: Reduce wakelock hold time</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164218/">https://patchwork.freedesktop.org/series/164218/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f_BAT -&gt; xe-pw-164218v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 14)</h2>
<p>Additional (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164218v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5564">Intel XE#5564</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5563">Intel XE#5563</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5488">Intel XE#5488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5591">Intel XE#5591</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-adlp-vm:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7483">Intel XE#7483</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-vm/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7247">Intel XE#7247</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-vm/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7242">Intel XE#7242</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-2/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5771">Intel XE#5771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-ptl-vm:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-vm/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-bmg-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-lnl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-ptl-2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5780">Intel XE#5780</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164218v1/bat-wcl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7248">Intel XE#7248</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f -&gt; xe-pw-164218v1</li>
</ul>
<p>IGT_8839: 8839<br />
  xe-4830-e024431a4dc3a2cc320e6093dd95d0c5d0e2935f: e024431a4dc3a2cc320e6093dd95d0c5d0e2935f<br />
  xe-pw-164218v1: 164218v1</p>

</body>
</html>

--===============7704877079893797478==--
