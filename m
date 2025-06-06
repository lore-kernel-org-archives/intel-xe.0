Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 756A4C61CE8
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 09:53:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3667E10EA21;
	Fri,  6 Jun 2025 09:53:12 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A83610EA21;
 Fri,  6 Jun 2025 09:53:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1312408436361101146=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Fixes_for_VF_GuC_version_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 09:53:10 -0000
Message-ID: <174920359026.55357.7292248387055208773@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250603235432.720833-6-daniele.ceraolospurio@intel.com>
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

--===============1312408436361101146==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fixes for VF GuC version (rev3)
URL   : https://patchwork.freedesktop.org/series/149613/
State : failure

== Summary ==

CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_FULL -> xe-pw-149613v3_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149613v3_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149613v3_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149613v3_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - shard-dg2-set2:     [PASS][1] -> ([FAIL][2], [PASS][3])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exec_balancer@once-cm-parallel-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_balancer@once-cm-parallel-rebind.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_balancer@once-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-dg2-set2:     [PASS][4] -> ([PASS][5], [DMESG-WARN][6])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_threads@threads-bal-shared-vm-basic:
    - shard-dg2-set2:     [PASS][7] -> ([PASS][8], [DMESG-FAIL][9]) +1 other test ( 1 dmesg-fail, 1 pass )
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_threads@threads-bal-shared-vm-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_threads@threads-bal-shared-vm-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-dg2-set2:     [PASS][10] -> ([ABORT][11], [PASS][12])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [PASS][13] -> ([PASS][14], [ABORT][15]) +1 other test ( 1 abort, 1 pass )
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-dg2-set2:     [PASS][16] -> ([TIMEOUT][17], [PASS][18])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
New tests
---------

  New tests have been introduced between xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11_FULL and xe-pw-149613v3_FULL:

### New IGT tests (1) ###

  * igt@kms_sequence:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-149613v3_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][19] -> ([FAIL][20], [PASS][21]) ([Intel XE#827])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][22] -> ([FAIL][23], [PASS][24]) ([Intel XE#3718] / [Intel XE#827]) +1 other test ( 1 fail, 1 pass )
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#827])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#3767]) +31 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][27] -> ([DMESG-WARN][28], [PASS][29]) ([Intel XE#3428]) +1 other test ( 1 dmesg-warn, 1 pass )
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][30] -> ([DMESG-WARN][31], [PASS][32]) ([Intel XE#4543])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#664])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#619])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1407])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1124]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> ([SKIP][37], [SKIP][38]) ([Intel XE#316])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][39] -> ([SKIP][40], [PASS][41]) ([Intel XE#4947]) +3 other tests ( 1 pass, 1 skip )
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][42] -> ([DMESG-FAIL][43], [DMESG-FAIL][44]) ([Intel XE#4543])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][45] -> [DMESG-FAIL][46] ([Intel XE#4543])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1124]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#1124])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][49] -> ([PASS][50], [SKIP][51]) ([Intel XE#2314] / [Intel XE#2894])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][52] -> ([SKIP][53], [SKIP][54]) ([Intel XE#2314] / [Intel XE#2894])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#2191])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1512])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#367])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][60], [SKIP][61]) ([Intel XE#455] / [Intel XE#787]) +3 other tests ( 2 skip )
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-436/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2887]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#787]) +17 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> ([SKIP][64], [SKIP][65]) ([Intel XE#3442])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#3432])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#787]) +104 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> ([SKIP][69], [SKIP][70]) ([Intel XE#787]) +27 other tests ( 2 skip )
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][71] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][72] ([Intel XE#3113])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> ([SKIP][75], [SKIP][76]) ([Intel XE#2652] / [Intel XE#787]) +7 other tests ( 2 skip )
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#4416]) +3 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#373]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#373])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_chamelium_hpd@vga-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#373]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#307])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@lic-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#5176])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][83], [FAIL][84]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-3/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> ([FAIL][85], [FAIL][86]) ([Intel XE#1188])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_content_protection@uevent@pipe-a-dp-2.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#455]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#2321]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][89] -> [DMESG-WARN][90] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][91] -> ([PASS][92], [SKIP][93]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-2/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#309])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][95] -> ([SKIP][96], [SKIP][97]) ([Intel XE#4208] / [i915#2575]) +21 other tests ( 2 skip )
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#309])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2291])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [PASS][101] -> ([SKIP][102], [SKIP][103]) ([Intel XE#2291])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [PASS][104] -> ([SKIP][105], [SKIP][106]) ([Intel XE#1340])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][107] -> ([PASS][108], [SKIP][109]) ([Intel XE#3009])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_dp_aux_dev.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_dp_aux_dev.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_draw_crc@fill-fb:
    - shard-dg2-set2:     [PASS][110] -> ([SKIP][111], [SKIP][112]) ([Intel XE#2351] / [Intel XE#4208]) +1 other test ( 2 skip )
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_draw_crc@fill-fb.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_draw_crc@fill-fb.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_draw_crc@fill-fb.html
    - shard-adlp:         [PASS][113] -> ([PASS][114], [SKIP][115]) ([Intel XE#2351] / [Intel XE#4947])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_draw_crc@fill-fb.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_draw_crc@fill-fb.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_draw_crc@fill-fb.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#2244])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#4422])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#702])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#1135])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1421]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#310]) +1 other test skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][122] -> ([SKIP][123], [SKIP][124]) ([Intel XE#2316])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-bmg:          [PASS][125] -> ([PASS][126], [SKIP][127]) ([Intel XE#2316]) +6 other tests ( 1 pass, 1 skip )
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][128] -> [FAIL][129] ([Intel XE#301])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([FAIL][130], [FAIL][131]) ([Intel XE#3321])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> ([PASS][132], [FAIL][133]) ([Intel XE#3321]) +2 other tests ( 1 fail, 1 pass )
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a2-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][134] ([Intel XE#301])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a2-dp2.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][135] -> [SKIP][136] ([Intel XE#2316]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          [PASS][137] -> [FAIL][138] ([Intel XE#886]) +1 other test fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-6/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][139] ([Intel XE#301]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][140] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [PASS][141] -> ([PASS][142], [INCOMPLETE][143]) ([Intel XE#2049] / [Intel XE#2597])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          NOTRUN -> ([INCOMPLETE][144], [PASS][145]) ([Intel XE#2049] / [Intel XE#2597]) +1 other test ( 1 incomplete, 1 pass )
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-dg2-set2:     [PASS][146] -> [INCOMPLETE][147] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][148] ([Intel XE#2049] / [Intel XE#2597])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-bmg:          [PASS][149] -> ([PASS][150], [FAIL][151]) ([Intel XE#2882]) +2 other tests ( 1 fail, 1 pass )
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@plain-flip-ts-check.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][152] ([Intel XE#1401]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][153] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][154] -> ([PASS][155], [DMESG-FAIL][156]) ([Intel XE#4543])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#651]) +5 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         NOTRUN -> ([SKIP][158], [SKIP][159]) ([Intel XE#651])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#651]) +3 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#656]) +6 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][162] ([Intel XE#656]) +12 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#651]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#653]) +3 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:
    - shard-adlp:         NOTRUN -> ([SKIP][165], [SKIP][166]) ([Intel XE#653])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#653]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> ([SKIP][168], [SKIP][169]) ([Intel XE#656])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][170] -> ([SKIP][171], [PASS][172]) ([Intel XE#1503])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_hdr@invalid-metadata-sizes.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#2927])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-adlp:         [PASS][174] -> ([SKIP][175], [PASS][176]) ([Intel XE#4950]) +18 other tests ( 1 pass, 1 skip )
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_lease@setcrtc-implicit-plane.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_lease@setcrtc-implicit-plane.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][177] ([Intel XE#616]) +2 other tests fail
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#599]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][179] -> [SKIP][180] ([Intel XE#4596])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#5020])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#2763]) +3 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_plane_scaling@planes-downscale-factor-0-5.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#1122])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-adlp:         [PASS][184] -> ([PASS][185], [SKIP][186]) ([Intel XE#4962])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_pm_rpm@legacy-planes.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_pm_rpm@legacy-planes.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#1489])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          NOTRUN -> [SKIP][188] ([Intel XE#2893] / [Intel XE#4608])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#4608]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#1489]) +1 other test skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][191] ([Intel XE#2893]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> ([SKIP][192], [SKIP][193]) ([Intel XE#1489])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][194] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][195] ([Intel XE#4609]) +1 other test skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#1406]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_psr@pr-basic.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][197] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#3414] / [Intel XE#3904])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_sequence@queue-idle:
    - shard-bmg:          [PASS][199] -> ([PASS][200], [FAIL][201]) ([Intel XE#4783]) +1 other test ( 1 fail, 1 pass )
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_sequence@queue-idle.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_sequence@queue-idle.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_sequence@queue-idle.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][202] ([Intel XE#2883]) +3 other tests fail
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][203] -> ([PASS][204], [SKIP][205]) ([Intel XE#1435])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_setmode@invalid-clone-single-crtc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][206] ([Intel XE#362])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@wait-forked-hang@pipe-a-dp-2:
    - shard-bmg:          [PASS][207] -> ([FAIL][208], [PASS][209]) ([Intel XE#4892]) +1 other test ( 1 fail, 1 pass )
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_vblank@wait-forked-hang@pipe-a-dp-2.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_vblank@wait-forked-hang@pipe-a-dp-2.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_vblank@wait-forked-hang@pipe-a-dp-2.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> ([SKIP][210], [SKIP][211]) ([Intel XE#1499])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-adlp:         NOTRUN -> [SKIP][212] ([Intel XE#455]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_vrr@negative-basic.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][213] ([Intel XE#5084])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@non-blocking-re-enable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#4497])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_eu_stall@non-blocking-re-enable.html

  * igt@xe_eudebug@basic-client-th:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#4837])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_eudebug@basic-client-th.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-adlp:         NOTRUN -> [SKIP][216] ([Intel XE#4837]) +3 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-lnl:          NOTRUN -> [SKIP][217] ([Intel XE#4837]) +3 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#688]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][219] ([Intel XE#688])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     [PASS][220] -> ([SKIP][221], [SKIP][222]) ([Intel XE#4208]) +45 other tests ( 2 skip )
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_exec_balancer@once-parallel-rebind.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [PASS][223] -> ([SKIP][224], [PASS][225]) ([Intel XE#1392]) +4 other tests ( 1 pass, 1 skip )
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-434/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#1392]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-adlp:         NOTRUN -> ([SKIP][227], [SKIP][228]) ([Intel XE#1392])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][229] ([Intel XE#1392]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> ([SKIP][230], [SKIP][231]) ([Intel XE#2322])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-dg2-set2:     [PASS][232] -> [SKIP][233] ([Intel XE#1392]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#288]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-basic-imm.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][235] ([Intel XE#288]) +5 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [PASS][236] -> ([DMESG-WARN][237], [PASS][238]) ([Intel XE#3876])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exec_reset@parallel-gt-reset.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge:
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#4943]) +8 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_exec_system_allocator@many-large-mmap-new-huge.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][240] ([Intel XE#4943])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@many-large-mmap-remap-ro:
    - shard-adlp:         NOTRUN -> ([SKIP][241], [SKIP][242]) ([Intel XE#4915]) +5 other tests ( 2 skip )
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@xe_exec_system_allocator@many-large-mmap-remap-ro.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_system_allocator@many-large-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@once-mmap-file-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#4915]) +59 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_exec_system_allocator@once-mmap-file-nomemset.html

  * igt@xe_exec_system_allocator@once-new-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][244] ([Intel XE#4915]) +19 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_system_allocator@once-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][245] -> ([FAIL][246], [FAIL][247]) ([Intel XE#5018])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][248] -> ([FAIL][249], [PASS][250]) ([Intel XE#5018])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][251] ([Intel XE#512])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-lnl:          NOTRUN -> [SKIP][252] ([Intel XE#378])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_module_load@force-load.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][253] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-lnl:          NOTRUN -> [SKIP][254] ([Intel XE#1948])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][255] -> ([DMESG-WARN][256], [PASS][257]) ([Intel XE#2953] / [Intel XE#4173]) +4 other tests ( 1 dmesg-warn, 1 pass )
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][258] -> ([PASS][259], [ABORT][260]) ([Intel XE#1794]) +1 other test ( 1 abort, 1 pass )
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-6/igt@xe_pm@s4-mocs.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-4/igt@xe_pm@s4-mocs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][261] -> ([ABORT][262], [PASS][263]) ([Intel XE#1794])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-adlp:         NOTRUN -> [SKIP][264] ([Intel XE#4733])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-adlp:         NOTRUN -> [SKIP][265] ([Intel XE#4814])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_render_copy@render-stress-4-copies.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][266] ([Intel XE#4351])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_sriov_scheduling@equal-throughput.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][267] -> ([SKIP][268], [PASS][269]) ([Intel XE#4945]) +32 other tests ( 1 pass, 1 skip )
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_wedged@basic-wedged.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_wedged@basic-wedged.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][270] ([Intel XE#3428]) -> ([PASS][271], [PASS][272]) +7 other tests ( 2 pass )
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][273] ([Intel XE#4543]) -> ([PASS][274], [PASS][275])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][276] -> ([PASS][277], [PASS][278]) +1 other test ( 2 pass )
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][279] ([Intel XE#2705] / [Intel XE#4212]) -> [PASS][280]
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][281] ([Intel XE#2291]) -> ([PASS][282], [PASS][283]) +5 other tests ( 2 pass )
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][284] ([Intel XE#2882]) -> [PASS][285] +4 other tests pass
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][286] ([Intel XE#2316]) -> ([PASS][287], [PASS][288]) +6 other tests ( 2 pass )
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2:
    - shard-bmg:          [FAIL][289] ([Intel XE#2882]) -> ([PASS][290], [PASS][291]) +2 other tests ( 2 pass )
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][292] ([Intel XE#301]) -> [PASS][293] +3 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [FAIL][294] ([Intel XE#886]) -> ([PASS][295], [PASS][296]) +4 other tests ( 2 pass )
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-1/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [FAIL][297] ([Intel XE#3149] / [Intel XE#886]) -> ([PASS][298], [PASS][299])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:
    - shard-adlp:         [DMESG-FAIL][300] ([Intel XE#4543]) -> ([PASS][301], [PASS][302])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][303] ([Intel XE#1503]) -> ([PASS][304], [PASS][305]) +1 other test ( 2 pass )
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][306] ([Intel XE#3012]) -> ([PASS][307], [PASS][308]) +1 other test ( 2 pass )
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:
    - shard-adlp:         [ABORT][309] ([Intel XE#2953]) -> ([PASS][310], [PASS][311]) +1 other test ( 2 pass )
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html

  * igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][312] ([Intel XE#2953] / [Intel XE#4173]) -> ([PASS][313], [PASS][314]) +4 other tests ( 2 pass )
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][315] ([Intel XE#1435]) -> ([PASS][316], [PASS][317])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][318] ([Intel XE#1392]) -> [PASS][319] +1 other test pass
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1392]) -> ([PASS][321], [PASS][322]) +1 other test ( 2 pass )
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:
    - shard-bmg:          [DMESG-WARN][323] ([Intel XE#3428]) -> [PASS][324]
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][325] ([Intel XE#1794]) -> [PASS][326]
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [FAIL][327] ([Intel XE#911]) -> ([FAIL][328], [PASS][329]) ([Intel XE#911]) +3 other tests ( 1 fail, 1 pass )
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][330] ([Intel XE#4543] / [Intel XE#4626]) -> ([DMESG-FAIL][331], [DMESG-FAIL][332]) ([Intel XE#4543])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_async_flips@crc-atomic.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_async_flips@crc-atomic.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][333] ([Intel XE#4626]) -> ([FAIL][334], [FAIL][335]) ([Intel XE#3884])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][336] ([Intel XE#3884]) -> ([PASS][337], [FAIL][338]) ([Intel XE#3884])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-adlp:         [DMESG-WARN][339] ([Intel XE#4543]) -> ([DMESG-WARN][340], [PASS][341]) ([Intel XE#4543])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_async_flips@invalid-async-flip.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_async_flips@invalid-async-flip.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1124]) -> ([SKIP][343], [SKIP][344]) ([Intel XE#4208])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
    - shard-adlp:         [SKIP][345] ([Intel XE#1124]) -> ([SKIP][346], [SKIP][347]) ([Intel XE#1124] / [Intel XE#4947])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [SKIP][348] ([Intel XE#1124]) -> ([SKIP][349], [SKIP][350]) ([Intel XE#1124] / [Intel XE#2351] / [Intel XE#4947]) +1 other test ( 2 skip )
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1124]) -> ([SKIP][352], [SKIP][353]) ([Intel XE#2351] / [Intel XE#4208])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][354] ([Intel XE#2314] / [Intel XE#2894]) -> ([PASS][355], [SKIP][356]) ([Intel XE#2314] / [Intel XE#2894])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         [SKIP][357] ([Intel XE#2191]) -> ([SKIP][358], [SKIP][359]) ([Intel XE#2191] / [Intel XE#4950])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][361], [SKIP][362]) ([Intel XE#4208]) +1 other test ( 2 skip )
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][363] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][364], [SKIP][365]) ([Intel XE#455] / [Intel XE#4947] / [Intel XE#787]) +4 other tests ( 2 skip )
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#455] / [Intel XE#787]) -> ([SKIP][367], [SKIP][368]) ([Intel XE#2351] / [Intel XE#4208])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][369] ([Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][370] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][371] ([Intel XE#2705] / [Intel XE#4212]) -> ([INCOMPLETE][372], [INCOMPLETE][373]) ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         [SKIP][374] ([Intel XE#306]) -> ([SKIP][375], [SKIP][376]) ([Intel XE#306] / [Intel XE#4950])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_chamelium_color@ctm-max.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_chamelium_color@ctm-max.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_chamelium_color@ctm-max.html
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#306]) -> ([SKIP][378], [SKIP][379]) ([Intel XE#4208] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_chamelium_color@ctm-max.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#373]) -> ([SKIP][381], [SKIP][382]) ([Intel XE#4208] / [i915#2575]) +1 other test ( 2 skip )
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_chamelium_frames@dp-crc-multiple.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_frames@hdmi-crc-planes-random:
    - shard-adlp:         [SKIP][383] ([Intel XE#373]) -> ([SKIP][384], [SKIP][385]) ([Intel XE#373] / [Intel XE#4950]) +1 other test ( 2 skip )
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_chamelium_frames@hdmi-crc-planes-random.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_chamelium_frames@hdmi-crc-planes-random.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][386] ([Intel XE#1178]) -> ([SKIP][387], [SKIP][388]) ([Intel XE#2341])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_content_protection@atomic.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_content_protection@atomic.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][389] ([Intel XE#1178]) -> [SKIP][390] ([Intel XE#2341])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][391] ([Intel XE#2341]) -> ([FAIL][392], [FAIL][393]) ([Intel XE#1178]) +1 other test ( 2 fail )
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_content_protection@srm.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_content_protection@srm.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [SKIP][394] ([Intel XE#2341]) -> ([FAIL][395], [FAIL][396]) ([Intel XE#1188])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_content_protection@uevent.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_content_protection@uevent.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][397] ([Intel XE#2291]) -> ([PASS][398], [SKIP][399]) ([Intel XE#2291]) +4 other tests ( 1 pass, 1 skip )
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#455]) -> ([SKIP][401], [SKIP][402]) ([Intel XE#2351] / [Intel XE#4208])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_dsc@dsc-with-formats.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html
    - shard-adlp:         [SKIP][403] ([Intel XE#455]) -> ([SKIP][404], [SKIP][405]) ([Intel XE#2351] / [Intel XE#455] / [Intel XE#4947])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_dsc@dsc-with-formats.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_dsc@dsc-with-formats.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [SKIP][406] ([Intel XE#2316]) -> ([PASS][407], [SKIP][408]) ([Intel XE#2316]) +4 other tests ( 1 pass, 1 skip )
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][409] ([Intel XE#2316]) -> ([FAIL][410], [FAIL][411]) ([Intel XE#3321])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][412] ([Intel XE#2882]) -> ([PASS][413], [FAIL][414]) ([Intel XE#2882]) +1 other test ( 1 fail, 1 pass )
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][415] ([Intel XE#301]) -> ([PASS][416], [FAIL][417]) ([Intel XE#301])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-adlp:         [SKIP][418] ([Intel XE#455]) -> ([SKIP][419], [SKIP][420]) ([Intel XE#455] / [Intel XE#4947])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          [ABORT][421] ([Intel XE#4760]) -> [SKIP][422] ([Intel XE#1397] / [Intel XE#1745])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [ABORT][423] ([Intel XE#4760]) -> [SKIP][424] ([Intel XE#1397])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [DMESG-FAIL][425] ([Intel XE#4543]) -> ([DMESG-FAIL][426], [PASS][427]) ([Intel XE#4543])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][428] ([Intel XE#2311]) -> ([SKIP][429], [SKIP][430]) ([Intel XE#2312]) +8 other tests ( 2 skip )
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][431] ([Intel XE#2311]) -> ([SKIP][432], [SKIP][433]) ([Intel XE#2311] / [Intel XE#2312]) +12 other tests ( 2 skip )
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][434] ([Intel XE#2312]) -> ([SKIP][435], [SKIP][436]) ([Intel XE#2311]) +18 other tests ( 2 skip )
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][437] ([Intel XE#2312]) -> ([SKIP][438], [SKIP][439]) ([Intel XE#2311] / [Intel XE#2312]) +10 other tests ( 2 skip )
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][440] ([Intel XE#2311]) -> [SKIP][441] ([Intel XE#2312]) +3 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#651]) -> ([SKIP][443], [SKIP][444]) ([Intel XE#4208]) +5 other tests ( 2 skip )
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][445] ([Intel XE#2312]) -> ([SKIP][446], [SKIP][447]) ([Intel XE#2312] / [Intel XE#4141]) +4 other tests ( 2 skip )
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][448] ([Intel XE#4141]) -> [SKIP][449] ([Intel XE#2312]) +2 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][450] ([Intel XE#2312]) -> ([SKIP][451], [SKIP][452]) ([Intel XE#4141]) +4 other tests ( 2 skip )
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][453] ([Intel XE#4141]) -> ([SKIP][454], [SKIP][455]) ([Intel XE#2312]) +2 other tests ( 2 skip )
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][456] ([Intel XE#4141]) -> ([SKIP][457], [SKIP][458]) ([Intel XE#2312] / [Intel XE#4141]) +7 other tests ( 2 skip )
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][459] ([Intel XE#651]) -> ([SKIP][460], [SKIP][461]) ([Intel XE#4947] / [Intel XE#651]) +5 other tests ( 2 skip )
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#651]) -> ([SKIP][463], [SKIP][464]) ([Intel XE#2351] / [Intel XE#4208]) +1 other test ( 2 skip )
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#653]) -> ([SKIP][466], [SKIP][467]) ([Intel XE#4208]) +5 other tests ( 2 skip )
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][468] ([Intel XE#656]) -> ([SKIP][469], [SKIP][470]) ([Intel XE#4947] / [Intel XE#656]) +4 other tests ( 2 skip )
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#653]) -> ([SKIP][472], [SKIP][473]) ([Intel XE#2351] / [Intel XE#4208])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][474] ([Intel XE#2312]) -> ([SKIP][475], [SKIP][476]) ([Intel XE#2313]) +17 other tests ( 2 skip )
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][477] ([Intel XE#2313]) -> [SKIP][478] ([Intel XE#2312]) +4 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][479] ([Intel XE#2313]) -> ([SKIP][480], [SKIP][481]) ([Intel XE#2312]) +5 other tests ( 2 skip )
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][482] ([Intel XE#2312]) -> ([SKIP][483], [SKIP][484]) ([Intel XE#2312] / [Intel XE#2313]) +10 other tests ( 2 skip )
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][485] ([Intel XE#2313]) -> ([SKIP][486], [SKIP][487]) ([Intel XE#2312] / [Intel XE#2313]) +13 other tests ( 2 skip )
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         [SKIP][488] ([Intel XE#653]) -> ([SKIP][489], [SKIP][490]) ([Intel XE#4947] / [Intel XE#653]) +4 other tests ( 2 skip )
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-adlp:         [SKIP][491] ([Intel XE#455]) -> ([SKIP][492], [SKIP][493]) ([Intel XE#455] / [Intel XE#4950])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_hdr@static-toggle.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_hdr@static-toggle.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-adlp:         [SKIP][494] ([Intel XE#2925]) -> ([SKIP][495], [SKIP][496]) ([Intel XE#2925] / [Intel XE#4947])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#2925]) -> ([SKIP][498], [SKIP][499]) ([Intel XE#4208])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         [INCOMPLETE][500] ([Intel XE#1035]) -> ([SKIP][501], [INCOMPLETE][502]) ([Intel XE#1035] / [Intel XE#4950])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_plane@pixel-format.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_plane@pixel-format.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_plane@pixel-format.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][503] ([Intel XE#5021]) -> ([SKIP][504], [SKIP][505]) ([Intel XE#4596] / [Intel XE#5021])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [FAIL][506] ([Intel XE#3325]) -> ([SKIP][507], [SKIP][508]) ([Intel XE#734])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_pm_dc@dc9-dpms.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_pm_dc@dc9-dpms.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         [SKIP][509] ([Intel XE#1489]) -> ([SKIP][510], [SKIP][511]) ([Intel XE#1489] / [Intel XE#4947]) +1 other test ( 2 skip )
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][512] ([Intel XE#1489]) -> ([SKIP][513], [SKIP][514]) ([Intel XE#4208]) +1 other test ( 2 skip )
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-dpms:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][516], [SKIP][517]) ([Intel XE#4208]) +2 other tests ( 2 skip )
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_psr@fbc-pr-dpms.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][519], [SKIP][520]) ([Intel XE#2351] / [Intel XE#4208])
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@psr-primary-blt:
    - shard-adlp:         [SKIP][521] ([Intel XE#2850] / [Intel XE#929]) -> ([SKIP][522], [SKIP][523]) ([Intel XE#2850] / [Intel XE#4947] / [Intel XE#929]) +3 other tests ( 2 skip )
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_psr@psr-primary-blt.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_psr@psr-primary-blt.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_psr@psr-primary-blt.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][524] ([Intel XE#1435]) -> ([PASS][525], [SKIP][526]) ([Intel XE#1435])
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setmode@clone-exclusive-crtc.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][527] ([Intel XE#1499]) -> ([SKIP][528], [PASS][529]) ([Intel XE#1499])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_vrr@negative-basic.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-multicopy-inplace:
    - shard-adlp:         [SKIP][530] ([Intel XE#455] / [Intel XE#488]) -> ([SKIP][531], [SKIP][532]) ([Intel XE#455] / [Intel XE#488] / [Intel XE#4945])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_ccs@block-multicopy-inplace.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_ccs@block-multicopy-inplace.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_ccs@block-multicopy-inplace.html

  * igt@xe_eudebug_online@single-step:
    - shard-adlp:         [SKIP][533] ([Intel XE#4837]) -> ([SKIP][534], [SKIP][535]) ([Intel XE#4837] / [Intel XE#4945])
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_eudebug_online@single-step.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_eudebug_online@single-step.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_eudebug_online@single-step.html
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#4837]) -> ([SKIP][537], [SKIP][538]) ([Intel XE#4208])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_eudebug_online@single-step.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_eudebug_online@single-step.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-adlp:         [SKIP][539] ([Intel XE#4519]) -> ([SKIP][540], [SKIP][541]) ([Intel XE#4519] / [Intel XE#4945])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_eudebug_sriov@deny-sriov.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_eudebug_sriov@deny-sriov.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     [SKIP][542] ([Intel XE#4518]) -> ([SKIP][543], [SKIP][544]) ([Intel XE#4208])
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_eudebug_sriov@deny-sriov.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-adlp:         [SKIP][545] ([Intel XE#261] / [Intel XE#688]) -> ([SKIP][546], [SKIP][547]) ([Intel XE#261] / [Intel XE#4945] / [Intel XE#688])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_evict@evict-large-external-cm.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_evict@evict-large-external-cm.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-adlp:         [SKIP][548] ([Intel XE#1392]) -> ([SKIP][549], [SKIP][550]) ([Intel XE#1392] / [Intel XE#4945]) +1 other test ( 2 skip )
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#1392]) -> ([PASS][552], [SKIP][553]) ([Intel XE#1392]) +1 other test ( 1 pass, 1 skip )
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-invalid-userptr-fault:
    - shard-adlp:         [SKIP][554] ([Intel XE#288]) -> ([SKIP][555], [SKIP][556]) ([Intel XE#288] / [Intel XE#4945]) +5 other tests ( 2 skip )
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-rebind:
    - shard-dg2-set2:     [SKIP][557] ([Intel XE#288]) -> ([SKIP][558], [SKIP][559]) ([Intel XE#4208]) +5 other tests ( 2 skip )
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_exec_fault_mode@once-rebind.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_exec_fault_mode@once-rebind.html

  * igt@xe_exec_system_allocator@many-new-race:
    - shard-dg2-set2:     [SKIP][560] ([Intel XE#4915]) -> ([SKIP][561], [SKIP][562]) ([Intel XE#4208]) +52 other tests ( 2 skip )
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_exec_system_allocator@many-new-race.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_exec_system_allocator@many-new-race.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_exec_system_allocator@many-new-race.html

  * igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault:
    - shard-adlp:         [SKIP][563] ([Intel XE#4915]) -> ([SKIP][564], [SKIP][565]) ([Intel XE#4915] / [Intel XE#4945]) +52 other tests ( 2 skip )
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][566] ([Intel XE#5165]) -> ([FAIL][567], [PASS][568]) ([Intel XE#5165])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-adlp:         [INCOMPLETE][569] ([Intel XE#4911]) -> ([TIMEOUT][570], [INCOMPLETE][571]) ([Intel XE#4911])
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([DMESG-WARN][572], [SKIP][573]) ([Intel XE#2457] / [Intel XE#3428]) -> ([SKIP][574], [SKIP][575]) ([Intel XE#2457])
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_module_load@load.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@xe_module_load@load.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@xe_module_load@load.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@xe_module_load@load.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][576] ([Intel XE#4501]) -> ([SKIP][577], [SKIP][578]) ([Intel XE#4208])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_oa@buffer-size.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_oa@buffer-size.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_oa@buffer-size.html
    - shard-adlp:         [SKIP][579] ([Intel XE#4501]) -> ([SKIP][580], [SKIP][581]) ([Intel XE#4501] / [Intel XE#4945])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_oa@buffer-size.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_oa@buffer-size.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_oa@buffer-size.html

  * igt@xe_oa@mmio-triggered-reports-read:
    - shard-adlp:         [SKIP][582] ([Intel XE#5103]) -> ([SKIP][583], [SKIP][584]) ([Intel XE#4945] / [Intel XE#5103])
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_oa@mmio-triggered-reports-read.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_oa@mmio-triggered-reports-read.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_oa@mmio-triggered-reports-read.html
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#5103]) -> ([SKIP][586], [SKIP][587]) ([Intel XE#4208])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_oa@mmio-triggered-reports-read.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_oa@mmio-triggered-reports-read.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_oa@mmio-triggered-reports-read.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         [SKIP][588] ([Intel XE#2541] / [Intel XE#3573]) -> ([SKIP][589], [SKIP][590]) ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4945])
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_oa@unprivileged-single-ctx-counters.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_oa@unprivileged-single-ctx-counters.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_oa@unprivileged-single-ctx-counters.html
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#2541] / [Intel XE#3573]) -> ([SKIP][592], [SKIP][593]) ([Intel XE#4208])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_oa@unprivileged-single-ctx-counters.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_oa@unprivileged-single-ctx-counters.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][594] ([Intel XE#1794]) -> ([PASS][595], [ABORT][596]) ([Intel XE#1794])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#944]) -> ([SKIP][598], [SKIP][599]) ([Intel XE#4208])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_query@multigpu-query-mem-usage.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         [SKIP][600] ([Intel XE#944]) -> ([SKIP][601], [SKIP][602]) ([Intel XE#4945] / [Intel XE#944])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_query@multigpu-query-mem-usage.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_query@multigpu-query-mem-usage.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_query@multigpu-query-mem-usage.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3325
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4783
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4892
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5084
  [Intel XE#5103]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5103
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5165]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5165
  [Intel XE#5176]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5176
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -> xe-pw-149613v3

  IGT_8396: 8396
  xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f01d4964a1657117f11
  xe-pw-149613v3: 149613v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/index.html

--===============1312408436361101146==
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
<tr><td><b>Series:</b></td><td>Fixes for VF GuC version (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/149613/">https://patchwork.freedesktop.org/series/149613/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149613v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149613v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3195-9becf23dcd5721a2ddb80f01d4964a165=
7117f11_FULL -&gt; xe-pw-149613v3_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149613v3_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-149613v3_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1496=
13v3_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exe=
c_balancer@once-cm-parallel-rebind.html">PASS</a> -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec=
_balancer@once-cm-parallel-rebind.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_balanc=
er@once-cm-parallel-rebind.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null-rebind.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-d=
g2-463/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14961=
3v3/shard-dg2-466/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-r=
ebind.html">DMESG-WARN</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exe=
c_threads@threads-bal-shared-vm-basic.html">PASS</a> -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_e=
xec_threads@threads-bal-shared-vm-basic.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_=
threads@threads-bal-shared-vm-basic.html">DMESG-FAIL</a>) +1 other test ( 1=
 dmesg-fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/sha=
rd-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_in=
it.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-dg2-463/igt@xe_fault_injection@inject-fault-probe-functi=
on-xe_guc_log_init.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-=
all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-bmg-6/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a>) +=
1 other test ( 1 abort, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_spi=
n_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt=
@xe_spin_batch@spin-fixed-duration-with-preempter.html">TIMEOUT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463=
/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3195-9becf23dcd5721a2ddb80f01d=
4964a1657117f11_FULL and xe-pw-149613v3_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_sequence:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149613v3_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_asyn=
c_flips@alternate-sync-async-flip.html">PASS</a> -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_async_=
flips@alternate-sync-async-flip.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_async_flips@al=
ternate-sync-async-flip.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-b=
mg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14961=
3v3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a=
-dp-2.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3718">Intel XE#3718</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/827">Intel XE#827</a>) +1 other test ( 1 fail, 1 p=
ass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_async_flips@alternate-syn=
c-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-a=
-hdmi-a-6-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_async_flips@async-flip-=
with-page-flip-events-tiled-atomic@pipe-a-hdmi-a-6-4-rc-ccs-cc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">In=
tel XE#3767</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-3.html">PASS</a> -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_async=
_flips@crc-atomic@pipe-d-hdmi-a-3.html">DMESG-WARN</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_async_=
flips@crc-atomic@pipe-d-hdmi-a-3.html">PASS</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) +1 other tes=
t ( 1 dmesg-warn, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-d-hdmi-a-1.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/i=
gt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1.html">DMESG-WARN</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-d-hdmi-a-1.html">PASS</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_async_flips@test-cursor.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@linear-8bpp-rota=
te-270.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149613v3/shard-adlp-9/igt@kms_big_fb@linear-8bpp-rotate-270.html">SK=
IP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316=
">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@x-tile=
d-8bpp-rotate-0.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_big_fb@x-tiled-8bpp-rotate-0.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4947">Intel XE#4947</a>) +3 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-ad=
lp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">D=
MESG-FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-as=
ync-flip.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-a=
dlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_big_fb@y-tiled-8bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1=
/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel =
XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6=
/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a>) (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel =
XE#2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_bw@connected-linear-tilin=
g-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@kms_ccs@bad-rotation-90-y-=
tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-436/igt@kms_ccs@bad-rotat=
ion-90-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a>) (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) +3 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_ccs@ccs-on-another-bo-4-t=
iled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_ccs@crc-primary-basic-y-=
tiled-gen12-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_ccs@crc-primary-suspend=
-4-tiled-lnl-ccs.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-ti=
led-lnl-ccs.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +104 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-=
basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-436/igt@kms_c=
cs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">I=
ntel XE#787</a>) +27 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113"=
>Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-d-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs@pipe-c-dp-2.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-=
tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_chamelium_audio@dp-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_chamelium_frames@hdmi-c=
rc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_chamelium_hpd@vga-hpd-fa=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5176">Intel XE#5176</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_content_protection@lic-t=
ype-0@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149613v3/shard-bmg-3/igt@kms_content_protection@lic-type-=
0@pipe-a-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_content_protection@ueven=
t@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a=
-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_cursor_crc@cursor-rando=
m-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding=
-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1/igt@kms_c=
ursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Inte=
l XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-3/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-2/igt@kms_=
cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_cu=
rsor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 =
other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_cursor_legacy@2x-long-non=
blocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_cu=
rsor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/=
igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-=
435/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-=
/issues/2575">i915#2575</a>) +21 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_cursor_legacy@cursora-vs=
-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/sh=
ard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">PASS</a> -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_cursor=
_legacy@cursorb-vs-flipa-legacy.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_cursor_legacy@=
cursorb-vs-flipa-legacy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_dither@fb-8bpc-=
vs-panel-6bpc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1340">Intel XE#1340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/i=
gt@kms_dp_aux_dev.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@fill-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_dr=
aw_crc@fill-fb.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_draw_crc@fill-fb.html">=
SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613=
v3/shard-dg2-435/igt@kms_draw_crc@fill-fb.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +1 other test ( 2 skip )</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_dra=
w_crc@fill-fb.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_draw_crc@fill-fb.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3=
/shard-adlp-3/igt@kms_draw_crc@fill-fb.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#49=
47</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking=
-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9613v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a>) (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-dpms-on-nop.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_flip@2x-flip-vs-=
dpms-on-nop.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
316">Intel XE#2316</a>) +6 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@=
kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-=
vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_flip@2x-fl=
ip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a2-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@bd-hdmi-a2-dp2.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/s=
hard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-6/igt@kms=
_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +=
1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vbla=
nk@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vbla=
nk@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@kms_fl=
ip@flip-vs-suspend.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_flip@flip-vs-suspen=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Inte=
l XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_flip@flip-vs-suspend-int=
erruptible.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_flip@flip-vs-suspend-interrup=
tible.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test ( 1 incompl=
ete, 1 pass )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-=
dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_flip=
@plain-flip-ts-check.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_flip@plain-flip-ts-=
check.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149613v3/shard-bmg-4/igt@kms_flip@plain-flip-ts-check.html">FAIL</a>)=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Inte=
l XE#2882</a>) +2 other tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#=
1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adl=
p-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.=
html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuf=
fer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a>) (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
psr-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fb=
cpsr-modesetfrombusy.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
psr-modesetfrombusy.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_frontbuffer_tracking@ps=
r-1p-offscren-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@ps=
r-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@kms_frontbuffer_=
tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_hdr@invalid-metad=
ata-sizes.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes.html">PAS=
S</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503=
">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_joiner@invalid-modeset-u=
ltra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_lea=
se@setcrtc-implicit-plane.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_lease@setcrtc=
-implicit-plane.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_lease@setcrtc-implicit-plane.=
html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4950">Intel XE#4950</a>) +18 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_plane_lowres@tiling-4.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/599">Intel XE#599</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_plane_scaling@planes-down=
scale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_pm_=
rpm@legacy-planes.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_pm_rpm@legacy-planes.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-adlp-3/igt@kms_pm_rpm@legacy-planes.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_psr2_sf@pr-overlay-plane=
-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-pla=
ne-update-sf-dmg-area.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_psr@fbc-pr-sprite-plane-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-blt@e=
dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_psr@pr-basic.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">In=
tel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">=
Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_sequ=
ence@queue-idle.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_sequence@queue-idle.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1496=
13v3/shard-bmg-4/igt@kms_sequence@queue-idle.html">FAIL</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4783">Intel XE#4783</a>) =
+1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hd=
mi-a-6.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2883">Intel XE#2883</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_setmode@in=
valid-clone-single-crtc.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_setmode@invalid-clone-=
single-crtc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-hang@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_vbla=
nk@wait-forked-hang@pipe-a-dp-2.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_vblank@w=
ait-forked-hang@pipe-a-dp-2.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_vblank@wait-forked=
-hang@pipe-a-dp-2.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4892">Intel XE#4892</a>) +1 other test ( 1 fail, 1 p=
ass )</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_vrr@flip-basic-fastset.h=
tml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-bmg-5/igt@kms_vrr@flip-basic-fastset.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@kms_vrr@negative-basic.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
55">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_configfs@survivability-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5084">Intel XE#5084</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@non-blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_eu_stall@non-blocking-re=
-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client-th:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_eudebug@basic-client-th.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_eudebug@basic-vm-bind-ufe=
nce.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_eudebug_online@writes-cach=
ing-sram-bb-sram-target-sram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_evict@evict-beng-large-mul=
ti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_evict_ccs@evict-overcommi=
t-simple.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_exe=
c_balancer@once-parallel-rebind.html">PASS</a> -&gt; (<a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_exec_ba=
lancer@once-parallel-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_exec_balancer@onc=
e-parallel-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +45 other tests ( 2 skip )<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-466/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.h=
tml">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149613v3/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many=
-vm-bindexecqueue-userptr-invalidate.html">SKIP</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-434/igt@xe_exec_bas=
ic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">=
PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
392">Intel XE#1392</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE=
#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-null.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_basic@multigpu-m=
any-execqueues-many-vm-null.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exe=
c-basic-defer-bind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@xe_exec_basic@multigpu-no-ex=
ec-null-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149613v3/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null=
-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec=
_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-ba=
sic-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-436/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_reset@pa=
rallel-gt-reset.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@xe_exec_reset@parallel-gt-=
reset.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_exec_system_allocator@many=
-large-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@xe_exec_system_allocator@many=
-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-remap-ro:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@xe_exec_system_allocator@ma=
ny-large-mmap-remap-ro.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_system_allocator@m=
any-large-mmap-remap-ro.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-file-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_exec_system_allocator@onc=
e-mmap-file-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-new-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-432/igt@xe_exec_system_allocator@on=
ce-new-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4915">Intel XE#4915</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149613v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm=
-many-large-execqueues-new-bo-map-nomemset.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-6/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomems=
et.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PAS=
S</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
613v3/shard-lnl-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large=
-new-bo-map-nomemset.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-6/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_mmap@small-bar.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">In=
tel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_module_load@force-load.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_oa@privileged-forked-acce=
ss-vaddr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_pm@d3hot-mmap-vram.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/194=
8">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-1/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_pm@s2idle-vm-bi=
nd-unbind-all.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-a=
ll.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +4 other tests ( 1 dmesg-war=
n, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-6/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149613v3/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-2/ig=
t@xe_pm@s4-mocs.html">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test ( 1 abort, 1 p=
ass )</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@xe_pm@s=
4-multiple-execs.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149613v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.ht=
ml">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-adlp-3/igt@xe_pm@s4-multiple-execs.html">PASS</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_pxp@pxp-termination-key-u=
pdate-post-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_render_copy@render-stress=
-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_sriov_scheduling@equal-thr=
oughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_wedg=
ed@basic-wedged.html">PASS</a> -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_wedged@basic-wedged.html=
">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1496=
13v3/shard-adlp-4/igt@xe_wedged@basic-wedged.html">PASS</a>) (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
+32 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_asyn=
c_flips@crc@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/=
igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_async_=
flips@crc@pipe-d-hdmi-a-3.html">PASS</a>) +7 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
613v3/shard-adlp-1/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-adlp-8/igt@kms_async_flips@invalid-async-flip@pipe-b-hdmi-a-1=
.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">DMESG-FAIL</a>=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3=
/shard-bmg-8/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-=
dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149613v3/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-trans=
ition@pipe-a-dp-2.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-c-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel X=
E#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149613v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-rc-ccs-cc@pipe-c-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">PASS</a>) +5 other tests ( 2 pa=
ss )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-5/igt@kms_flip=
@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg=
-3/igt@kms_flip@2x-blocking-wf_vblank@ac-dp2-hdmi-a3.html">PASS</a> +4 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bm=
g-8/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/=
igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a>) +6 other =
tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible@c-dp2.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v=
3/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c-dp2.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@c=
-dp2.html">PASS</a>) +2 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-433/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/sha=
rd-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PA=
SS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip=
@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-1/igt@k=
ms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip@pla=
in-flip-fb-recreate@a-edp1.html">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@kms_flip=
@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3=
/shard-lnl-3/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
lnl-8/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-x.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-=
a-1-y-to-x.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pip=
e-d-hdmi-a-1-y-to-x.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_hdr@invalid-hd=
r.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a>) +1 other tes=
t ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-=
3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/ig=
t@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a>) +1 other test=
 ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lea=
se@lease-unleased-crtc@pipe-a-hdmi-a-1.html">ABORT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
adlp-9/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adl=
p-3/igt@kms_lease@lease-unleased-crtc@pipe-a-hdmi-a-1.html">PASS</a>) +1 ot=
her test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_lea=
se@lease-unleased-crtc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-adlp-3/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-adlp-9/igt@kms_lease@lease-unleased-crtc@pipe-b-hdmi-a-1.ht=
ml">PASS</a>) +4 other tests ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-b=
mg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-=
5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard=
-dg2-463/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-user=
ptr-rebind.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149613v3/shard-dg2-463/igt@xe_exec_basic@multigpu-no-exec-bindex=
ecqueue-userptr-rebind.html">PASS</a>) +1 other test ( 2 pass )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_exec_=
system_allocator@many-large-mmap-mlock-nomemset.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#34=
28</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9613v3/shard-bmg-1/igt@xe_exec_system_allocator@many-large-mmap-mlock-nomem=
set.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-6/igt@xe_pm@s4-vm=
-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-6/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-even=
ts-linear@pipe-c-edp-1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149613v3/shard-lnl-4/igt@kms_async_flips@async-flip-=
with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 ot=
her tests ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
adlp-1/igt@kms_async_flips@crc-atomic.html">DMESG-FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms_a=
sync_flips@crc-atomic.html">DMESG-FAIL</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shar=
d-adlp-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp=
-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp=
-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/i=
gt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_asy=
nc_flips@invalid-async-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-1=
/igt@kms_async_flips@invalid-async-flip.html">DMESG-WARN</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8/igt@kms=
_async_flips@invalid-async-flip.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/=
igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_big_=
fb@yf-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big=
_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@=
kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@yf=
-tiled-8bpp-rotate-270.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1=
124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-18=
0-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_big_fb@yf-tiled-max-hw-stride-64=
bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#=
1124</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-=
180-async-flip.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride=
-64bpp-rotate-180-async-flip.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2160=
x1440p.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149613v3/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-2=
160x1440p.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_bw@=
connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-adlp-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html"=
>SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14961=
3v3/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2191">Intel XE#2191</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_cc=
s@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
dg2-433/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@=
kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other =
test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_ccs=
@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14961=
3v3/shard-adlp-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-adlp-4/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a=
>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4947">Intel XE#4947</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_cc=
s@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14961=
3v3/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SK=
IP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3=
/shard-dg2-435/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE=
#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel X=
E#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel=
 XE#4212</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149613v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-=
cc.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-149613v3/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-=
ccs-cc.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#=
4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_cha=
melium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_chamel=
ium_color@ctm-max.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_chamelium_color@ctm-max.htm=
l">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/306">Intel XE#306</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4950">Intel XE#4950</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ch=
amelium_color@ctm-max.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; (<a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_cham=
elium_color@ctm-max.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_chamelium_color@ctm-max.=
html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ch=
amelium_frames@dp-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt=
@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_chamel=
ium_frames@dp-crc-multiple.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 o=
ther test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-planes-random:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_cha=
melium_frames@hdmi-crc-planes-random.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-=
3/igt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/i=
gt@kms_chamelium_frames@hdmi-crc-planes-random.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel=
 XE#4950</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_cont=
ent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_content_protection@atomi=
c.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-5/igt@kms_content=
_protection@srm.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_content_protection@srm.html">F=
AIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
78">Intel XE#1178</a>) +1 other test ( 2 fail )</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_cont=
ent_protection@uevent.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_content_protection@ueven=
t.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; (<a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8=
/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@km=
s_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 o=
ther tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ds=
c@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_dsc@dsc=
-with-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_dsc@dsc-with-formats.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_dsc=
@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_dsc@dsc-w=
ith-formats.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_dsc@dsc-with-formats.html">SKIP</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">I=
ntel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-bmg-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14961=
3v3/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2316">Intel XE#2316</a>) +4 other tests ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard=
-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel=
 XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_flip=
@flip-vs-absolute-wf_vblank-interruptible@a-dp2.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>=
) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v=
3/shard-bmg-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a-dp2.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-bmg-5/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@a=
-dp2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2882">Intel XE#2882</a>) +1 other test ( 1 fail, 1 pass )</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/sha=
rd-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">=
FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3=
01">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4ti=
le-downscaling.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4ti=
le-to-32bpp-4tile-downscaling.html">SKIP</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE=
#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xti=
le-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode=
.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4760">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-3/igt@kms_fli=
p_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-8=
/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-2/igt@kms=
_flip_tiling@flip-change-tiling.html">PASS</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/s=
hard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v=
3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2312">Intel XE#2312</a>) +8 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-=
primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
 +12 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-ind=
fb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149613v3/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pr=
imscrn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests =
( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE=
#2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-=
scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)=
 +10 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1496=
13v3/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt=
; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shar=
d-dg2-433/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/sh=
ard-dg2-435/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKI=
P</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208=
">Intel XE#4208</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indf=
b-pgflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests ( 2=
 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1496=
13v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indf=
b-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scn=
dscrn-pri-indfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests (=
 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb=
-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scnds=
crn-spr-indfb-draw-render.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613=
v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +7 other tests ( 2 skip=
 )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-=
pri-shrfb-draw-mmap-wc.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@f=
bcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-149613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-pri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@=
fbcdrrs-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#65=
3</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
9613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-=
msflip-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-pr=
imscrn-indfb-msflip-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests ( 2 sk=
ip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel X=
E#656</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcps=
r-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) +4 other tests ( 2 skip )</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel =
XE#653</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-149613v3/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-p=
ri-shrfb-draw-render.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149=
613v3/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb=
-onoff.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-149613v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn=
-spr-indfb-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests ( 2 skip )</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-in=
dfb-draw-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-sc=
ndscrn-spr-indfb-draw-blt.html">SKIP</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests ( 2 =
skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613=
v3/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff=
.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests ( 2 ski=
p )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
49613v3/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-=
fullscreen.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscr=
n-spr-indfb-fullscreen.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2312">Intel XE#2312</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 othe=
r tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&g=
t; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/sha=
rd-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-adlp-3/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">=
SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
947">Intel XE#4947</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/653">Intel XE#653</a>) +4 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_hdr=
@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; (<a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_hdr@static-t=
oggle.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-149613v3/shard-adlp-3/igt@kms_hdr@static-toggle.html">SKIP</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950=
">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_joi=
ner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-a=
dlp-4/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp=
-3/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a>) (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#29=
25</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/494=
7">Intel XE#4947</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; =
(<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
dg2-435/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg=
2-433/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_pla=
ne@pixel-format.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_pla=
ne@pixel-format.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_plane@pixel-format.html">INCO=
MPLETE</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-1/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-4/igt@kms_plane_multiple@2x-ti=
ling-yf.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-8/igt@kms_pm_=
dc@dc9-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3325">Intel XE#3325</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@kms_pm_dc@dc9-dpm=
s.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_psr=
2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -=
&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/s=
hard-adlp-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">S=
KIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v=
3/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html=
">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1489">Intel XE#1489</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ps=
r2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard=
-dg2-433/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
dg2-435/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) +1 other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ps=
r@fbc-pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@km=
s_psr@fbc-pr-dpms.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@kms_psr@fbc-pr-dpms.html">SKIP=
</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) +2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@kms_ps=
r@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard=
-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@=
kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@kms_psr=
@psr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; (<a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@=
kms_psr@psr-primary-blt.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@kms_psr@psr-primary-blt.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests ( 2 s=
kip )</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-8/igt@kms_s=
etmode@clone-exclusive-crtc.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_setmode@clone-excl=
usive-crtc.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-1/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@kms_vrr@negativ=
e-basic.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-149613v3/shard-bmg-5/igt@kms_vrr@negative-basic.html">PASS</a>) (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE=
#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-inplace:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_ccs@=
block-multicopy-inplace.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) -&gt; (<a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4=
/igt@xe_ccs@block-multicopy-inplace.html">SKIP</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_ccs@block-=
multicopy-inplace.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_eude=
bug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_eud=
ebug_online@single-step.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_eudebug_online@single-=
step.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_eud=
ebug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; (<a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_e=
udebug_online@single-step.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_eudebug_online@sing=
le-step.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4519">Intel XE#4519</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4519">Intel XE#4519</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; (<a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_eudebug_sriov@deny-srio=
v.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_evic=
t@evict-large-external-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; (<a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp=
-4/igt@xe_evict@evict-large-external-cm.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_evict@=
evict-large-external-cm.html">SKIP</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_exec=
_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; (<a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/i=
gt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_exec_b=
asic@multigpu-no-exec-basic.html">SKIP</a>) (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 =
other test ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard=
-dg2-466/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-=
dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a>) =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) +1 other test ( 1 pass, 1 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_exec=
_fault_mode@many-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adl=
p-4/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3=
/igt@xe_exec_fault_mode@many-invalid-userptr-fault.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">I=
ntel XE#4945</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_exe=
c_fault_mode@once-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_ex=
ec_fault_mode@once-rebind.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_exec_fault_mode@onc=
e-rebind.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +5 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-new-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_exe=
c_system_allocator@many-new-race.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; (<a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433=
/igt@xe_exec_system_allocator@many-new-race.html">SKIP</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_e=
xec_system_allocator@many-new-race.html">SKIP</a>) (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +52 other =
tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-malloc-multi-fault:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_exec=
_system_allocator@threads-many-large-malloc-multi-fault.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#=
4915</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-149613v3/shard-adlp-3/igt@xe_exec_system_allocator@threads-many-large-mall=
oc-multi-fault.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_exec_system_allocator@threads-m=
any-large-malloc-multi-fault.html">SKIP</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +5=
2 other tests ( 2 skip )</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5165">Intel XE#5165</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-149613v3/shard-lnl-5/igt@xe_exec_system_allocator@threads-s=
hared-vm-many-execqueues-new-bo-map-nomemset.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-3/igt@xe_ex=
ec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map-nomemset.h=
tml">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5165">Intel XE#5165</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4=
911</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-adlp-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_sen=
d_recv.html">TIMEOUT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_gu=
c_mmio_send_recv.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-4/igt@xe_modu=
le_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-bmg-2/i=
gt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; (<=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-bm=
g-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-149613v3/shard-bmg-6/igt@xe_module_load@load.ht=
ml">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2457">Intel XE#2457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4501">Intel XE#4501</a>) -&gt; (<a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_oa@buffer-siz=
e.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-149613v3/shard-dg2-433/igt@xe_oa@buffer-size.html">SKIP</a>) (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_oa@b=
uffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4501">Intel XE#4501</a>) -&gt; (<a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_oa@buffer-size.=
html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
149613v3/shard-adlp-3/igt@xe_oa@buffer-size.html">SKIP</a>) (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports-read:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_oa@m=
mio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; (<a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe=
_oa@mmio-triggered-reports-read.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_oa@mmio-trigge=
red-reports-read.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_oa@=
mmio-triggered-reports-read.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5103">Intel XE#5103</a>) -&gt; (<a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@=
xe_oa@mmio-triggered-reports-read.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe_oa@mmio-tri=
ggered-reports-read.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_oa@u=
nprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) =
-&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/=
shard-adlp-4/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp=
-3/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Inte=
l XE#3573</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4945">Intel XE#4945</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_oa@=
unprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)=
 -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3=
/shard-dg2-433/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg=
2-435/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-lnl-7/igt@xe_pm@s4-=
vm-bind-unbind-all.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-149613v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.htm=
l">ABORT</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-dg2-435/igt@xe_que=
ry@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; (<a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-433/igt@xe=
_query@multigpu-query-mem-usage.html">SKIP</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-dg2-435/igt@xe_query@multigp=
u-query-mem-usage.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11/shard-adlp-2/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; (<a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-4/igt@xe_q=
uery@multigpu-query-mem-usage.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-149613v3/shard-adlp-3/igt@xe_query@multigpu-q=
uery-mem-usage.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11 -&gt; xe-pw-149=
613v3</li>
</ul>
<p>IGT_8396: 8396<br />
  xe-3195-9becf23dcd5721a2ddb80f01d4964a1657117f11: 9becf23dcd5721a2ddb80f0=
1d4964a1657117f11<br />
  xe-pw-149613v3: 149613v3</p>

</body>
</html>

--===============1312408436361101146==--
