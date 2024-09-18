Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 371D5CDD55C
	for <intel-xe@archiver.kernel.org>; Wed, 18 Sep 2024 20:53:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9BB910E63B;
	Wed, 18 Sep 2024 20:53:09 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED8410E0A0;
 Wed, 18 Sep 2024 20:53:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1253666471302788608=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_drm/gpuvm=3A_merge_adjacent_gpuv?=
 =?utf-8?q?a_range_during_a_map_operation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Oak Zeng" <oak.zeng@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Sep 2024 20:53:08 -0000
Message-ID: <172669278850.1027924.16007410380105117191@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240918164740.3955915-1-oak.zeng@intel.com>
In-Reply-To: <20240918164740.3955915-1-oak.zeng@intel.com>
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

--===============1253666471302788608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpuvm: merge adjacent gpuva range during a map operation
URL   : https://patchwork.freedesktop.org/series/138835/
State : failure

== Summary ==

CI Bug Log - changes from xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05_BAT -> xe-pw-138835v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138835v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138835v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138835v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_compute@compute-square:
    - bat-adlp-vf:        [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-vf/igt@xe_compute@compute-square.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-vf/igt@xe_compute@compute-square.html
    - bat-adlp-7:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@xe_compute@compute-square.html

  * igt@xe_live_ktest@xe_bo:
    - bat-pvc-2:          [PASS][5] -> [SKIP][6] +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-pvc-2/igt@xe_live_ktest@xe_bo.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - bat-lnl-1:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-bmg-1:          [PASS][9] -> [SKIP][10] +2 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_vm@large-split-binds-268435456:
    - bat-adlp-vf:        [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html
    - bat-pvc-2:          [PASS][13] -> [DMESG-FAIL][14] +2 other tests dmesg-fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-pvc-2/igt@xe_vm@large-split-binds-268435456.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-pvc-2/igt@xe_vm@large-split-binds-268435456.html
    - bat-bmg-1:          [PASS][15] -> [DMESG-FAIL][16] +2 other tests dmesg-fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-1/igt@xe_vm@large-split-binds-268435456.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-1/igt@xe_vm@large-split-binds-268435456.html
    - bat-adlp-7:         [PASS][17] -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@xe_vm@large-split-binds-268435456.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@xe_vm@large-split-binds-268435456.html
    - bat-lnl-2:          [PASS][19] -> [ABORT][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-2/igt@xe_vm@large-split-binds-268435456.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-2/igt@xe_vm@large-split-binds-268435456.html
    - bat-dg2-oem2:       [PASS][21] -> [DMESG-FAIL][22] +2 other tests dmesg-fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-dg2-oem2/igt@xe_vm@large-split-binds-268435456.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-dg2-oem2/igt@xe_vm@large-split-binds-268435456.html
    - bat-atsm-2:         [PASS][23] -> [DMESG-FAIL][24] +2 other tests dmesg-fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-atsm-2/igt@xe_vm@large-split-binds-268435456.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-atsm-2/igt@xe_vm@large-split-binds-268435456.html

  * igt@xe_vm@munmap-style-unbind-one-partial:
    - bat-dg2-oem2:       [PASS][25] -> [FAIL][26] +6 other tests fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html

  * igt@xe_vm@munmap-style-unbind-userptr-front:
    - bat-bmg-1:          [PASS][27] -> [FAIL][28] +5 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-front.html
    - bat-atsm-2:         [PASS][29] -> [FAIL][30] +6 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - bat-pvc-2:          [PASS][31] -> [FAIL][32] +5 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@xe_live_ktest@xe_dma_buf:
    - {bat-bmg-2}:        [PASS][33] -> [SKIP][34] +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_vm@large-split-binds-268435456:
    - {bat-bmg-2}:        [PASS][35] -> [DMESG-FAIL][36] +2 other tests dmesg-fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-2/igt@xe_vm@large-split-binds-268435456.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-2/igt@xe_vm@large-split-binds-268435456.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-front:
    - {bat-bmg-2}:        [PASS][37] -> [FAIL][38] +5 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html

  
Known issues
------------

  Here are the changes found in xe-pw-138835v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-lnl-1:          [PASS][39] -> [SKIP][40] ([Intel XE#1885])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [PASS][41] -> [FAIL][42] ([Intel XE#1861])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:
    - bat-lnl-1:          [PASS][43] -> [DMESG-FAIL][44] ([Intel XE#1620] / [Intel XE#1760]) +1 other test dmesg-fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html

  * igt@kms_pipe_crc_basic@read-crc-frame-sequence:
    - bat-lnl-1:          [PASS][45] -> [SKIP][46] ([Intel XE#2423]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - bat-lnl-1:          [PASS][47] -> [SKIP][48] ([Intel XE#2351]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@xe_live_ktest@xe_bo:
    - bat-lnl-1:          [PASS][49] -> [FAIL][50] ([Intel XE#1999]) +5 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_live_ktest@xe_bo.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][51] -> [SKIP][52] ([Intel XE#1192]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
    - bat-atsm-2:         [PASS][53] -> [SKIP][54] ([Intel XE#1192]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_mmap@cpu-caching:
    - bat-lnl-1:          [PASS][55] -> [SKIP][56] ([Intel XE#1130]) +170 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_mmap@cpu-caching.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@bad-pitch-0:
    - bat-adlp-7:         [DMESG-WARN][57] -> [PASS][58] +31 other tests pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-adlp-7:         [SKIP][59] ([Intel XE#455]) -> [PASS][60] +5 other tests pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html

  
#### Warnings ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-lnl-1:          [SKIP][61] ([Intel XE#1091]) -> [SKIP][62] ([Intel XE#2423]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - bat-lnl-1:          [SKIP][63] ([Intel XE#688]) -> [SKIP][64] ([Intel XE#1130]) +17 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-lnl-1:          [SKIP][65] ([Intel XE#2229]) -> [FAIL][66] ([Intel XE#1999]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_mmap@vram:
    - bat-lnl-1:          [SKIP][67] ([Intel XE#1416]) -> [SKIP][68] ([Intel XE#1130])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_mmap@vram.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_mmap@vram.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-lnl-1:          [SKIP][69] ([Intel XE#1420]) -> [SKIP][70] ([Intel XE#1130])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelp:
    - bat-lnl-1:          [SKIP][71] ([Intel XE#977]) -> [SKIP][72] ([Intel XE#1130])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_pat@pat-index-xelp.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - bat-lnl-1:          [SKIP][73] ([Intel XE#979]) -> [SKIP][74] ([Intel XE#1130])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05 -> xe-pw-138835v1

  IGT_8024: 15f8ad0bce184e96d171dfe19c06bdef93e7cf72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05: 15aeb2cced25e1bfa15f1aa538247d79cf8b0a05
  xe-pw-138835v1: 138835v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/index.html

--===============1253666471302788608==
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
<tr><td><b>Series:</b></td><td>drm/gpuvm: merge adjacent gpuva range during a map operation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138835/">https://patchwork.freedesktop.org/series/138835/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05_BAT -&gt; xe-pw-138835v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138835v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138835v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138835v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-vf/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-vf/igt@xe_compute@compute-square.html">FAIL</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@xe_compute@compute-square.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-pvc-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-1/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">ABORT</a></li>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-pvc-2/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-pvc-2/igt@xe_vm@large-split-binds-268435456.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-1/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-1/igt@xe_vm@large-split-binds-268435456.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@xe_vm@large-split-binds-268435456.html">ABORT</a></li>
<li>bat-lnl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-2/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-2/igt@xe_vm@large-split-binds-268435456.html">ABORT</a></li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-dg2-oem2/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-dg2-oem2/igt@xe_vm@large-split-binds-268435456.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-atsm-2/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-atsm-2/igt@xe_vm@large-split-binds-268435456.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-one-partial:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-dg2-oem2/igt@xe_vm@munmap-style-unbind-one-partial.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-front:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-1/igt@xe_vm@munmap-style-unbind-userptr-front.html">FAIL</a> +5 other tests fail</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-atsm-2/igt@xe_vm@munmap-style-unbind-userptr-front.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-pvc-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-2/igt@xe_vm@large-split-binds-268435456.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-2/igt@xe_vm@large-split-binds-268435456.html">DMESG-FAIL</a> +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-front:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-bmg-2/igt@xe_vm@munmap-style-unbind-userptr-inval-front.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138835v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@kms_pipe_crc_basic@hang-read-crc@pipe-b-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc-frame-sequence:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@kms_pipe_crc_basic@read-crc-frame-sequence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_live_ktest@xe_bo.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@cpu-caching:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_mmap@cpu-caching.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_mmap@cpu-caching.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +170 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-0:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@kms_addfb_basic@bad-pitch-0.html">PASS</a> +31 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-adlp-7/igt@kms_psr@psr-cursor-plane-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138835v1/bat-lnl-1/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05 -&gt; xe-pw-138835v1</li>
</ul>
<p>IGT_8024: 15f8ad0bce184e96d171dfe19c06bdef93e7cf72 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1969-15aeb2cced25e1bfa15f1aa538247d79cf8b0a05: 15aeb2cced25e1bfa15f1aa538247d79cf8b0a05<br />
  xe-pw-138835v1: 138835v1</p>

</body>
</html>

--===============1253666471302788608==--
