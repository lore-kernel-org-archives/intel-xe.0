Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24027EC1E97
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 10:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB79210E85B;
	Thu,  5 Feb 2026 10:35:35 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF09C10E85B;
 Thu,  5 Feb 2026 10:35:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0172948073339944599=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Reject_coh=5Fnon?=
 =?utf-8?q?e_PAT_index_for_CPU_cached_memory_in_madvise_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jia Yao" <jia.yao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 10:35:34 -0000
Message-ID: <177028773482.228132.12402866272854612115@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129000147.339361-1-jia.yao@intel.com>
In-Reply-To: <20260129000147.339361-1-jia.yao@intel.com>
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

--===============0172948073339944599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reject coh_none PAT index for CPU cached memory in madvise (rev5)
URL   : https://patchwork.freedesktop.org/series/160797/
State : failure

== Summary ==

CI Bug Log - changes from xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be_FULL -> xe-pw-160797v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160797v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160797v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160797v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-10/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_system_allocator@process-many-execqueues-new:
    - shard-bmg:          [PASS][5] -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-new.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-new.html

  
Known issues
------------

  Here are the changes found in xe-pw-160797v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#6969]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#6969] / [Intel XE#7006])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#1178] / [Intel XE#3304])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][10] -> [SKIP][11] ([Intel XE#2291]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2316]) +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#1435])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#1499])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_vrr@negative-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#2142]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault:
    - shard-bmg:          [PASS][20] -> [FAIL][21] ([Intel XE#5625]) +1 other test fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-many-mmap-race:
    - shard-bmg:          [PASS][22] -> [ABORT][23] ([Intel XE#5545])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-race.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-race.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [PASS][24] -> [DMESG-WARN][25] ([Intel XE#3428])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][26] ([Intel XE#2291]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][28] ([Intel XE#3009]) -> [PASS][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_dp_aux_dev.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][30] ([Intel XE#2316]) -> [PASS][31] +1 other test pass
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][32] ([Intel XE#301]) -> [PASS][33] +1 other test pass
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][34] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][35] +1 other test pass
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          [DMESG-WARN][36] ([Intel XE#3428]) -> [PASS][37] +2 other tests pass
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html

  
#### Warnings ####

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [FAIL][38] ([Intel XE#3304]) -> [SKIP][39] ([Intel XE#7194])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][40] ([Intel XE#2341]) -> [FAIL][41] ([Intel XE#1178] / [Intel XE#3304])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_content_protection@legacy.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][42] ([Intel XE#5299]) -> [FAIL][43] ([Intel XE#4633])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][44] ([Intel XE#2312]) -> [SKIP][45] ([Intel XE#2311]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][46] ([Intel XE#2311]) -> [SKIP][47] ([Intel XE#2312]) +10 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][48] ([Intel XE#4141]) -> [SKIP][49] ([Intel XE#2312]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][50] ([Intel XE#2312]) -> [SKIP][51] ([Intel XE#4141]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][52] ([Intel XE#2312]) -> [SKIP][53] ([Intel XE#2313]) +4 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][54] ([Intel XE#2313]) -> [SKIP][55] ([Intel XE#2312]) +10 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][56] ([Intel XE#1729]) -> [SKIP][57] ([Intel XE#2426])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194


Build changes
-------------

  * Linux: xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be -> xe-pw-160797v5

  IGT_8736: 8736
  xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be: 689aea2d3dbe6d733e2267bb2f6b81156eba82be
  xe-pw-160797v5: 160797v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/index.html

--===============0172948073339944599==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reject coh_none PAT index for CPU cached memory in madvise (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160797/">https://patchwork.freedesktop.org/series/160797/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be_FULL -&gt; xe-pw-160797v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160797v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160797v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160797v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-10/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-new:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-new.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-new.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160797v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-6/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-malloc-multi-fault.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-mmap-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-mmap-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@xe_pmu@fn-engine-activity-load.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7194">Intel XE#7194</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160797v5/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be -&gt; xe-pw-160797v5</li>
</ul>
<p>IGT_8736: 8736<br />
  xe-4498-689aea2d3dbe6d733e2267bb2f6b81156eba82be: 689aea2d3dbe6d733e2267bb2f6b81156eba82be<br />
  xe-pw-160797v5: 160797v5</p>

</body>
</html>

--===============0172948073339944599==--
