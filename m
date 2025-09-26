Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD43BCAC5B9
	for <intel-xe@archiver.kernel.org>; Fri, 26 Sep 2025 18:04:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CD0D10EACB;
	Fri, 26 Sep 2025 18:04:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC57510EAC8;
 Fri, 26 Sep 2025 18:04:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8610027454940450223=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_=3A_Add_GPU_work_period_su?=
 =?utf-8?q?pport_for_Xe_driver_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aakash Deep Sarkar" <aakash.deep.sarkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Sep 2025 18:04:00 -0000
Message-ID: <175890984094.369784.11962347537768196480@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
In-Reply-To: <20250926104521.1815428-1-aakash.deep.sarkar@intel.com>
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

--===============8610027454940450223==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: : Add GPU work period support for Xe driver (rev4)
URL   : https://patchwork.freedesktop.org/series/153341/
State : failure

== Summary ==

CI Bug Log - changes from xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24_FULL -> xe-pw-153341v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-153341v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-153341v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-153341v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pm_rpm@legacy-planes@plane-43:
    - shard-adlp:         [PASS][1] -> [ABORT][2] +8 other tests abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@kms_pm_rpm@legacy-planes@plane-43.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@kms_pm_rpm@legacy-planes@plane-43.html
    - shard-bmg:          [PASS][3] -> [ABORT][4] +9 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@kms_pm_rpm@legacy-planes@plane-43.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@kms_pm_rpm@legacy-planes@plane-43.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [PASS][5] -> [ABORT][6] +6 other tests abort
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-33:
    - shard-dg2-set2:     NOTRUN -> [ABORT][7] +3 other tests abort
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_pm_rpm@universal-planes-dpms@plane-33.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +7 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-dg2-set2:     [PASS][10] -> [DMESG-WARN][11] +5 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] +5 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
    - shard-adlp:         [PASS][14] -> [DMESG-WARN][15] +7 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          [PASS][16] -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_pm@d3hot-mmap-vram.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_pm@d3hot-mmap-vram.html
    - shard-dg2-set2:     [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_pm@d3hot-mmap-vram.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-bmg:          NOTRUN -> [ABORT][20]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-lnl:          [PASS][21] -> [ABORT][22] +8 other tests abort
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][23] -> [INCOMPLETE][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_wedged@basic-wedged.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_wedged@basic-wedged.html
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_wedged@basic-wedged.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_wedged@basic-wedged.html
    - shard-lnl:          [PASS][27] -> [INCOMPLETE][28] +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_wedged@basic-wedged.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [PASS][29] -> [INCOMPLETE][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_wedged@basic-wedged.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          [SKIP][32] ([Intel XE#2320]) -> [ABORT][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
    - shard-dg2-set2:     [SKIP][34] ([Intel XE#455]) -> [ABORT][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-463/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][36] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [ABORT][37]
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][38] ([Intel XE#1439] / [Intel XE#3141]) -> [ABORT][39]
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html
    - shard-adlp:         [SKIP][40] ([Intel XE#836]) -> [ABORT][41]
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][42] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_pm@d3cold-basic.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_pm@d3cold-basic.html
    - shard-bmg:          [SKIP][44] ([Intel XE#2284]) -> [ABORT][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_pm@d3cold-basic.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_pm@d3cold-basic.html
    - shard-adlp:         [SKIP][46] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_pm@d3cold-basic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_pm@d3cold-basic.html
    - shard-dg2-set2:     [SKIP][48] ([Intel XE#2284] / [Intel XE#366]) -> [ABORT][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_pm@d3cold-basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          [SKIP][50] ([Intel XE#5694]) -> [ABORT][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_pm@d3cold-i2c.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          [SKIP][52] ([Intel XE#5694]) -> [ABORT][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_pm@d3cold-i2c.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
    - shard-adlp:         [SKIP][54] ([Intel XE#5694]) -> [ABORT][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_pm@d3cold-i2c.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_pm@d3cold-i2c.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_async_flips@async-flip-dpms}:
    - shard-lnl:          [PASS][56] -> [ABORT][57] +1 other test abort
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@kms_async_flips@async-flip-dpms.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@kms_async_flips@async-flip-dpms.html
    - shard-adlp:         [DMESG-WARN][58] ([Intel XE#4543]) -> [ABORT][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@kms_async_flips@async-flip-dpms.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@kms_async_flips@async-flip-dpms.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2}:
    - shard-bmg:          [PASS][60] -> [ABORT][61] +1 other test abort
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2.html

  * {igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1}:
    - shard-adlp:         [PASS][62] -> [ABORT][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1.html

  * {igt@xe_configfs@engines-allowed}:
    - shard-adlp:         [PASS][64] -> [DMESG-WARN][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_configfs@engines-allowed.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_configfs@engines-allowed.html
    - shard-bmg:          [PASS][66] -> [DMESG-WARN][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_configfs@engines-allowed.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_configfs@engines-allowed.html

  
Known issues
------------

  Here are the changes found in xe-pw-153341v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1124])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][69] ([Intel XE#367])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2887])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#787]) +76 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][74] ([Intel XE#1727] / [Intel XE#3113])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-2.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2252]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#306])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#373]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2321])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2291]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2244])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#301]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][84] -> [DMESG-WARN][85] ([Intel XE#4543]) +3 other tests dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651]) +2 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2311]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#5390]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#658])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#653]) +6 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2313])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#1503])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_hdr@static-toggle-dpms.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#346])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#356])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#455]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#1406] / [Intel XE#1489])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#1406] / [Intel XE#1489])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-cursor-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-plane-onoff.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#1499])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_vrr@flip-suspend.html

  * igt@xe_eudebug@basic-exec-queues:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#4837]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@xe_eudebug@basic-exec-queues.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#4837]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#1392]) +3 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#288]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-rebind.html

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#4915]) +37 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_exec_system_allocator@many-stride-malloc-race.html

  * igt@xe_exec_system_allocator@once-large-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#4943])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_exec_system_allocator@once-large-mmap-new-huge.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:
    - shard-adlp:         [PASS][108] -> [DMESG-WARN][109] ([Intel XE#2953] / [Intel XE#4173])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#3573])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_pmu@engine-activity-most-load-idle:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][111] ([Intel XE#6190]) +1 other test dmesg-warn
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_pmu@engine-activity-most-load-idle.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#4733])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][113] ([Intel XE#5354]) -> [PASS][114]
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][115] ([Intel XE#2291]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][117] ([Intel XE#2316]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#4543]) -> [PASS][120] +3 other tests pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-1/igt@kms_flip@basic-flip-vs-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-4/igt@kms_flip@basic-flip-vs-dpms.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][121] ([Intel XE#1499]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#1392]) -> [PASS][124]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * {igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch}:
    - shard-lnl:          [CRASH][125] ([Intel XE#6192]) -> [PASS][126] +1 other test pass
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch.html

  * {igt@xe_exec_system_allocator@once-malloc-prefetch}:
    - shard-bmg:          [CRASH][127] ([Intel XE#6192]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_exec_system_allocator@once-malloc-prefetch.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_exec_system_allocator@once-malloc-prefetch.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [SKIP][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154]) ([Intel XE#378]) -> ([PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-1/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-1/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-1/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-1/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-4/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-3/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-4/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-4/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-3/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-3/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_module_load@load.html
    - shard-bmg:          ([PASS][180], [PASS][181], [PASS][182], [PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [SKIP][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205]) ([Intel XE#2457]) -> ([PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [PASS][217], [PASS][218], [PASS][219], [PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_module_load@load.html
    - shard-adlp:         ([PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244], [PASS][245], [PASS][246], [PASS][247], [PASS][248], [PASS][249], [PASS][250], [PASS][251], [PASS][252], [PASS][253], [PASS][254], [SKIP][255], [PASS][256]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][257], [PASS][258], [PASS][259], [PASS][260], [PASS][261], [PASS][262], [PASS][263], [PASS][264], [PASS][265], [PASS][266], [PASS][267], [PASS][268], [PASS][269], [PASS][270], [PASS][271], [PASS][272], [PASS][273], [PASS][274], [PASS][275], [PASS][276], [PASS][277], [PASS][278], [PASS][279], [PASS][280], [PASS][281])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-1/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-1/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-1/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_load@load.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_module_load@load.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@xe_module_load@load.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@xe_module_load@load.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_module_load@load.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_module_load@load.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_load@load.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_module_load@load.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_module_load@load.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@xe_module_load@load.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_load@load.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_load@load.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_load@load.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_load@load.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-4/igt@xe_module_load@load.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_module_load@load.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_module_load@load.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_module_load@load.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-9/igt@xe_module_load@load.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-9/igt@xe_module_load@load.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@xe_module_load@load.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-9/igt@xe_module_load@load.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_module_load@load.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_module_load@load.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-4/igt@xe_module_load@load.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-4/igt@xe_module_load@load.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_module_load@load.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_module_load@load.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_module_load@load.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@xe_module_load@load.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@xe_module_load@load.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@xe_module_load@load.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_load@load.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@xe_module_load@load.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@xe_module_load@load.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][282], [PASS][283], [PASS][284], [PASS][285], [SKIP][286], [PASS][287], [PASS][288], [PASS][289], [PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301]) ([Intel XE#378]) -> ([PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [PASS][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315], [PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-433/igt@xe_module_load@load.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_module_load@load.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-464/igt@xe_module_load@load.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-464/igt@xe_module_load@load.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-464/igt@xe_module_load@load.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-464/igt@xe_module_load@load.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_module_load@load.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_module_load@load.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-433/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-433/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-466/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-466/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-434/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-434/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-434/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-432/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-432/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-463/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-463/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-463/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-bmg:          [FAIL][322] ([Intel XE#1188]) -> [SKIP][323] ([Intel XE#2341])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_content_protection@uevent.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_content_protection@uevent.html

  * igt@kms_flip@flip-vs-rmfb-interruptible:
    - shard-adlp:         [DMESG-WARN][324] ([Intel XE#5208]) -> [DMESG-WARN][325] ([Intel XE#4543] / [Intel XE#5208])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@kms_flip@flip-vs-rmfb-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][326] ([Intel XE#2312]) -> [SKIP][327] ([Intel XE#2311])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][328] ([Intel XE#2311]) -> [SKIP][329] ([Intel XE#2312])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][330] ([Intel XE#2312]) -> [SKIP][331] ([Intel XE#2313]) +2 other tests skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][332] ([Intel XE#2313]) -> [SKIP][333] ([Intel XE#2312])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#6190]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6190
  [Intel XE#6192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24 -> xe-pw-153341v4

  IGT_8554: 8554
  xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24: d557b14c00c4ab027e66c1c7bf512cf479ff8c24
  xe-pw-153341v4: 153341v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/index.html

--===============8610027454940450223==
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
<tr><td><b>Series:</b></td><td>: Add GPU work period support for Xe driver =
(rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153341/">https://patchwork.freedesktop.org/series/153341/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153341v4/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153341v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3833-d557b14c00c4ab027e66c1c7bf512cf47=
9ff8c24_FULL -&gt; xe-pw-153341v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-153341v4_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-153341v4_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1533=
41v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-43:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@kms_pm_=
rpm@legacy-planes@plane-43.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@kms_pm_rpm@legacy=
-planes@plane-43.html">ABORT</a> +8 other tests abort</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@kms_pm_r=
pm@legacy-planes@plane-43.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@kms_pm_rpm@legacy-p=
lanes@plane-43.html">ABORT</a> +9 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-434/igt@kms_pm=
_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@kms_pm_rpm=
@modeset-lpsp-stress-no-wait.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-33:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_pm_rpm@universal-planes=
-dpms@plane-33.html">ABORT</a> +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:=
</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_pcode_probe_early.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/s=
hard-lnl-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_prob=
e_early.html">DMESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_fau=
lt_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/=
igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</=
a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_fault=
_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/ig=
t@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</=
a> +5 other tests dmesg-warn</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@xe_faul=
t_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/=
igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN=
</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_pm@d3=
hot-mmap-vram.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_pm@d3hot-mmap-vram.html">FAI=
L</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_pm@=
d3hot-mmap-vram.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html"=
>FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_pm@s4-d3hot-basic-exec.htm=
l">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_pxp@p=
xp-termination-key-update-post-rpm.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_pxp@pxp=
-termination-key-update-post-rpm.html">ABORT</a> +8 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_wedg=
ed@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_wedged@basic-wedged.html"=
>INCOMPLETE</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_wed=
ged@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_wedged@basic-wedged.htm=
l">INCOMPLETE</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_wedge=
d@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_wedged@basic-wedged.html">I=
NCOMPLETE</a> +1 other test incomplete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_wedge=
d@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_wedged@basic-wedged.html">I=
NCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_wedged@wedged-at-any-tim=
eout.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_curs=
or_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/=
igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-46=
3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel X=
E#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153341v4/shard-bmg-3/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">ABOR=
T</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/igt@kms_pm_r=
pm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/i=
gt@kms_pm_rpm@modeset-non-lpsp.html">ABORT</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@kms_pm_=
rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@kms_pm_rpm@=
modeset-non-lpsp.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_pm@d3=
cold-basic.html">ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_pm@d3cold-basic.h=
tml">ABORT</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_pm@d=
3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_pm@=
d3cold-basic.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_pm@=
d3cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_p=
m@d3cold-basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_pm@d3cold-i2c.html"=
>ABORT</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_pm@d3cold-i2c.html"=
>ABORT</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_pm@d=
3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_pm@d3cold-i2c.htm=
l">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-dpms}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@kms_async_flips@async=
-flip-dpms.html">ABORT</a> +1 other test abort</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/i=
gt@kms_async_flips@async-flip-dpms.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-a-dp-2}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@kms_asyn=
c_flips@async-flip-dpms@pipe-a-dp-2.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@kms_async=
_flips@async-flip-dpms@pipe-a-dp-2.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-dpms@pipe-a-hdmi-a-1}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@kms_asy=
nc_flips@async-flip-dpms@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@kms=
_async_flips@async-flip-dpms@pipe-a-hdmi-a-1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>{igt@xe_configfs@engines-allowed}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_conf=
igfs@engines-allowed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_configfs@engines-all=
owed.html">DMESG-WARN</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_confi=
gfs@engines-allowed.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_configfs@engines-allow=
ed.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153341v4_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_big_fb@y-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_ccs@bad-aux-stride-4-tile=
d-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-yf-tiled-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@kms_ccs@bad-rotation-90-yf-=
tiled-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-=
4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-b-dp-2.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_chamelium_audio@hdmi-audi=
o.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_chamelium_color@ctm-lim=
ited-range.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_chamelium_edid@vga-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_cursor_=
legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244=
">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@kms_f=
lip@flip-vs-rmfb-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_hdr@=
static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_hdr@static-toggle-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_plane_lowres@tiling-y.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@kms_psr2_sf@psr2-primary-pl=
ane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@kms_psr@fbc-psr2-cursor-pla=
ne-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499=
">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-436/igt@xe_eudebug@basic-exec-queue=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_eudebug_online@writes-cach=
ing-vram-bb-sram-target-vram.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_exec_fault_mode@many-exe=
cqueues-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_exec_system_allocator@ma=
ny-stride-malloc-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_exec_system_allocator@once=
-large-mmap-new-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@xe_faul=
t_injection@vm-bind-fail-xe_pt_update_ops_run.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/i=
gt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_run.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Int=
el XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_oa@syncs-ufence-wait.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-most-load-idle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-bmg-1/igt@xe_pmu@engine-activity-most-l=
oad-idle.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6190">Intel XE#6190</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_pxp@pxp-termination-key-=
update-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">DMESG-WARN=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">=
Intel XE#5354</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-153341v4/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic=
-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/i=
gt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg=
-5/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-1/igt@kms_fli=
p@basic-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-4/igt@kms=
_flip@basic-flip-vs-dpms.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg=
2-463/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-large-execqueues-malloc-prefetch}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_exec_=
system_allocator@many-large-execqueues-malloc-prefetch.html">CRASH</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#=
6192</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153341v4/shard-lnl-7/igt@xe_exec_system_allocator@many-large-execqueues-mal=
loc-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@once-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_exec_=
system_allocator@once-malloc-prefetch.html">CRASH</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6192">Intel XE#6192</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bm=
g-1/igt@xe_exec_system_allocator@once-malloc-prefetch.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-l=
nl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/sha=
rd-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24=
/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff=
8c24/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf4=
79ff8c24/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf51=
2cf479ff8c24/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7=
bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66=
c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab02=
7e66c1c7bf512cf479ff8c24/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4=
ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c=
00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557=
b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-=
d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-1/igt@xe_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-lnl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-=
lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/sh=
ard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c2=
4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
341v4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153341v4/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
341v4/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
341v4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153341v4/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
341v4/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153341v4/shard-lnl-4/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-3/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
341v4/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-lnl-1/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-153341v4/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>)</l=
i>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff=
8c24/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf4=
79ff8c24/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf51=
2cf479ff8c24/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7=
bf512cf479ff8c24/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66=
c1c7bf512cf479ff8c24/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab02=
7e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4=
ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c=
00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557=
b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-3/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-=
d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c2=
4/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53341v4/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53341v4/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53341v4/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53341v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53341v4/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153341v4/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>)<=
/li>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-6/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c2=
4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479=
ff8c24/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512=
cf479ff8c24/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7=
bf512cf479ff8c24/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e6=
6c1c7bf512cf479ff8c24/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab=
027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c0=
0c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557=
b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833=
-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-ad=
lp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/sha=
rd-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c2=
4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479=
ff8c24/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512=
cf479ff8c24/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7=
bf512cf479ff8c24/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e6=
6c1c7bf512cf479ff8c24/shard-adlp-4/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab=
027e66c1c7bf512cf479ff8c24/shard-adlp-3/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v=
4/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153341v4/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3341v4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-9/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-153341v4/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard=
-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-153341v4/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-2/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153341v4/shard-adlp-4/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/=
shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-153341v4/shard-adlp-3/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1533=
41v4/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-153341v4/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-a=
dlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153341v4/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-433/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard=
-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24=
/shard-dg2-464/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479=
ff8c24/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf51=
2cf479ff8c24/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c=
1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab0=
27e66c1c7bf512cf479ff8c24/shard-dg2-436/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c0=
0c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d55=
7b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-38=
33-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-463/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-466/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-466/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-dg2-436=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-d=
g2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/s=
hard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff=
8c24/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7bf512c=
f479ff8c24/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3833-d557b14c00c4ab027e66c1c7=
bf512cf479ff8c24/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>) (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#3=
78</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53341v4/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-153341v4/shard-dg2-464/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-153341v4/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-466/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153341v4/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-463/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/=
shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-153341v4/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2=
-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153341v4/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-dg2-433/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153341v4/shard-dg2-432/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4=
/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_cont=
ent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-bmg-6/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-adlp-8/igt@kms_fli=
p@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v4/shard-adlp-8=
/igt@kms_flip@flip-vs-rmfb-interruptible.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208">Inte=
l XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1533=
41v4/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
341v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indf=
b-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153341v=
4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1533=
41v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24 -&gt; xe-pw-153=
341v4</li>
</ul>
<p>IGT_8554: 8554<br />
  xe-3833-d557b14c00c4ab027e66c1c7bf512cf479ff8c24: d557b14c00c4ab027e66c1c=
7bf512cf479ff8c24<br />
  xe-pw-153341v4: 153341v4</p>

</body>
</html>

--===============8610027454940450223==--
