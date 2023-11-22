Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DF2C072A2
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 06:44:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4E7D10E101;
	Wed, 22 Nov 2023 06:44:07 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2CD1510E101;
 Wed, 22 Nov 2023 06:44:06 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 238BEAA915;
 Wed, 22 Nov 2023 06:44:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3218849615545537739=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Date: Wed, 22 Nov 2023 06:44:06 -0000
Message-ID: <170063544610.4725.8618350541606398065@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231121115626.151214-5-matthew.auld@intel.com>
In-Reply-To: <20231121115626.151214-5-matthew.auld@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_PAT_and_c?=
 =?utf-8?q?ache_coherency_support_=28rev14=29?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============3218849615545537739==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PAT and cache coherency support (rev14)
URL   : https://patchwork.freedesktop.org/series/123027/
State : failure

== Summary ==

CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -> xe-pw-123027v14_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-123027v14_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-123027v14_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123027v14_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_addfb_basic@addfb25-yf-tiled-legacy:
    - bat-adlp-7:         [PASS][1] -> [WARN][2] +8 other tests warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html

  * igt@kms_addfb_basic@too-wide:
    - bat-dg2-oem2:       [PASS][3] -> [WARN][4] +7 other tests warn
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] +145 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
    - bat-adlp-7:         [PASS][7] -> [FAIL][8] +120 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_intel_bb@intel-bb-blit-y:
    - bat-pvc-2:          [PASS][9] -> [FAIL][10] +97 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html

  * igt@xe_live_ktest@bo:
    - bat-pvc-2:          [PASS][11] -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_live_ktest@bo.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_live_ktest@bo.html

  * igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:
    - bat-pvc-2:          [PASS][13] -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@dmabuf:
    - bat-adlp-7:         [PASS][15] -> [INCOMPLETE][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_live_ktest@dmabuf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_live_ktest@dmabuf.html

  * igt@xe_prime_self_import@basic-with_one_bo:
    - bat-atsm-2:         [PASS][17] -> [FAIL][18] +88 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       [SKIP][19] ([Intel XE#624]) -> [FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html
    - bat-adlp-7:         [FAIL][21] ([Intel XE#609]) -> [FAIL][22] +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#609]) -> [FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][25] ([Intel XE#480]) -> [FAIL][26] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
    - bat-adlp-7:         [FAIL][27] ([Intel XE#480]) -> [FAIL][28] +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][29] ([Intel XE#608]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
    - bat-adlp-7:         [FAIL][31] ([Intel XE#616] / [Intel XE#750]) -> [FAIL][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][33] ([Intel XE#400] / [Intel XE#616]) -> [FAIL][34] +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-pvc-2:          [FAIL][35] ([Intel XE#936]) -> [FAIL][36] +3 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_evict@evict-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][37] ([Intel XE#482]) -> [FAIL][38] +3 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-small-cm.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_evict@evict-small-cm.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:
    - bat-pvc-2:          [INCOMPLETE][39] ([Intel XE#392]) -> [FAIL][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][41] -> [FAIL][42] +7 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue}:
    - bat-atsm-2:         [PASS][43] -> [FAIL][44] +7 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * {igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:
    - bat-pvc-2:          [PASS][45] -> [FAIL][46] +12 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * {igt@xe_vm@bind-execqueues-independent}:
    - bat-adlp-7:         [PASS][47] -> [FAIL][48] +11 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html

  
Known issues
------------

  Here are the changes found in xe-pw-123027v14_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_live_ktest@bo:
    - bat-dg2-oem2:       [PASS][49] -> [INCOMPLETE][50] ([Intel XE#868])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_live_ktest@bo.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_live_ktest@bo.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][51] ([Intel XE#939]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [DMESG-WARN][53] ([Intel XE#939]) -> [PASS][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][55] ([Intel XE#524]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [FAIL][57] ([Intel XE#935]) -> [PASS][58]
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [FAIL][59] ([Intel XE#935]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-dg2-oem2:       [FAIL][61] ([Intel XE#935]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [FAIL][63] ([Intel XE#935]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [FAIL][65] ([Intel XE#940]) -> [PASS][66] +1 other test pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-dg2-oem2:       [FAIL][67] ([Intel XE#940]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [FAIL][69] ([Intel XE#940]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/868
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#936]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/936
  [Intel XE#939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/939
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940


Build changes
-------------

  * Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -> xe-pw-123027v14

  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9
  xe-pw-123027v14: 123027v14

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/index.html

--===============3218849615545537739==
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
<tr><td><b>Series:</b></td><td>PAT and cache coherency support (rev14)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123027/">https://patchwork.freedesktop.org/series/123027/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -&gt; xe-pw-123027v14_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-123027v14_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-123027v14_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123027v14_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-yf-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_addfb_basic@addfb25-yf-tiled-legacy.html">WARN</a> +8 other tests warn</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@too-wide:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_addfb_basic@too-wide.html">WARN</a> +7 other tests warn</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +145 other tests fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> +120 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@intel-bb-blit-y:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_intel_bb@intel-bb-blit-y.html">FAIL</a> +97 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_live_ktest@bo.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_live_ktest@bo@xe_bo-xe_ccs_migrate_kunit.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@dmabuf:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_live_ktest@dmabuf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_live_ktest@dmabuf.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-with_one_bo:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_prime_self_import@basic-with_one_bo.html">FAIL</a> +88 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +1 other test fail</p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> +1 other test fail</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/936">Intel XE#936</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_evict@evict-beng-small-external.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict@evict-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_evict@evict-small-cm.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate}:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">FAIL</a> +12 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@xe_vm@bind-execqueues-independent}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123027v14_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_live_ktest@bo:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_live_ktest@bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_live_ktest@bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/868">Intel XE#868</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123027v14/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -&gt; xe-pw-123027v14</li>
</ul>
<p>IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9<br />
  xe-pw-123027v14: 123027v14</p>

</body>
</html>

--===============3218849615545537739==--
