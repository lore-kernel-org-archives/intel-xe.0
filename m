Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E24D0C611
	for <intel-xe@archiver.kernel.org>; Fri, 25 Oct 2024 13:54:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22E0710EAF1;
	Fri, 25 Oct 2024 13:54:13 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C9D210EB06;
 Fri, 25 Oct 2024 13:54:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4818768069122524202=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_=28CI=29_drm/xe=3A_Fix_initial_f?=
 =?utf-8?q?ramebuffer_handover=2E_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 25 Oct 2024 13:54:12 -0000
Message-ID: <172986445243.1331517.3589909083501634654@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20241018170631.6598-1-maarten.lankhorst@linux.intel.com>
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

--===============4818768069122524202==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: (CI) drm/xe: Fix initial framebuffer handover. (rev7)
URL   : https://patchwork.freedesktop.org/series/140183/
State : failure

== Summary ==

CI Bug Log - changes from xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea_BAT -> xe-pw-140183v7_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140183v7_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140183v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140183v7_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-vf:        [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html

  * igt@sriov_basic@enable-vfs-autoprobe-on:
    - bat-adlp-7:         [PASS][3] -> [DMESG-WARN][4] +1 other test dmesg-warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html

  * igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:
    - bat-atsm-2:         [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-140183v7_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_evict@evict-beng-small:
    - bat-adlp-7:         NOTRUN -> [SKIP][7] ([Intel XE#261] / [Intel XE#688]) +15 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-1:          [PASS][8] -> [DMESG-WARN][9] ([Intel XE#3230])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:
    - bat-adlp-7:         NOTRUN -> [SKIP][10] ([Intel XE#288]) +32 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-adlp-vf:        [PASS][11] -> [DMESG-WARN][12] ([Intel XE#3230])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - bat-adlp-7:         NOTRUN -> [DMESG-WARN][13] ([Intel XE#3230])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-adlp-7:         NOTRUN -> [SKIP][14] ([Intel XE#1192]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([Intel XE#1192]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-lnl-1:          [PASS][17] -> [DMESG-WARN][18] ([Intel XE#1727])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-1/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-1/igt@xe_module_load@load.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#1885]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@nullptr:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#2134]) -> [PASS][22] +4 other tests pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@fbdev@nullptr.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@fbdev@nullptr.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#2423] / [i915#2575]) -> [PASS][24] +50 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][25] ([Intel XE#1861]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#2351]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - bat-lnl-2:          [DMESG-WARN][29] ([Intel XE#3230]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-adlp-vf:        [DMESG-WARN][31] ([Intel XE#3230]) -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html
    - bat-lnl-1:          [DMESG-WARN][33] ([Intel XE#3230]) -> [PASS][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [FAIL][35] ([Intel XE#2136]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_module_load@load.html

  * igt@xe_prime_self_import@basic-with_fd_dup:
    - bat-dg2-oem2:       [SKIP][37] ([Intel XE#1130]) -> [PASS][38] +156 other tests pass
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][39] ([Intel XE#2423] / [i915#2575]) -> [SKIP][40] ([Intel XE#623])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][41] ([Intel XE#2351]) -> [SKIP][42] ([Intel XE#455])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][43] ([Intel XE#2423] / [i915#2575]) -> [SKIP][44] ([i915#5274])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][45] ([Intel XE#2351]) -> [SKIP][46] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-dg2-oem2:       [SKIP][47] ([Intel XE#2423] / [i915#2575]) -> [SKIP][48] ([Intel XE#1091] / [Intel XE#2849]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [SKIP][49] ([Intel XE#1130]) -> [SKIP][50] ([Intel XE#288]) +32 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - bat-dg2-oem2:       [SKIP][51] ([Intel XE#1130]) -> [DMESG-WARN][52] ([Intel XE#3230])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][53] ([Intel XE#1130]) -> [SKIP][54] ([Intel XE#255])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo:
    - bat-adlp-7:         [INCOMPLETE][55] ([Intel XE#2874]) -> [SKIP][56] ([Intel XE#1192])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-7/igt@xe_live_ktest@xe_bo.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][57] ([Intel XE#1130]) -> [SKIP][58] ([Intel XE#2839] / [Intel XE#977])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][59] ([Intel XE#1130]) -> [SKIP][60] ([Intel XE#2838] / [Intel XE#979])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-dg2-oem2:       [SKIP][61] ([Intel XE#1130]) -> [SKIP][62] ([Intel XE#979])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2839]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8083 -> IGT_8084
  * Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -> xe-pw-140183v7

  IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8084: 4ebef261c74f8efbd7d1921e8b91e178a9e897fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea
  xe-pw-140183v7: 140183v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/index.html

--===============4818768069122524202==
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
<tr><td><b>Series:</b></td><td>(CI) drm/xe: Fix initial framebuffer handover. (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140183/">https://patchwork.freedesktop.org/series/140183/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea_BAT -&gt; xe-pw-140183v7_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140183v7_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140183v7_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140183v7_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-vf/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@sriov_basic@enable-vfs-autoprobe-on.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-atsm-2/igt@sriov_basic@enable-vfs-autoprobe-on@numvfs-1.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140183v7_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-fd-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +1 other test skip</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-1/igt@xe_module_load@load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@fbdev@nullptr.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> +50 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-vf/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-lnl-1/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_fd_dup:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_prime_self_import@basic-with_fd_dup.html">PASS</a> +156 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-adlp-7/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2839">Intel XE#2839</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140183v7/bat-dg2-oem2/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8083 -&gt; IGT_8084</li>
<li>Linux: xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea -&gt; xe-pw-140183v7</li>
</ul>
<p>IGT_8083: 73f910ebf47fe8f379d2e233cab754e4d6091701 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8084: 4ebef261c74f8efbd7d1921e8b91e178a9e897fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2127-7cadd167321b3267a9803aba88f115fc9809d4ea: 7cadd167321b3267a9803aba88f115fc9809d4ea<br />
  xe-pw-140183v7: 140183v7</p>

</body>
</html>

--===============4818768069122524202==--
