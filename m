Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07593F55132
	for <intel-xe@archiver.kernel.org>; Sun,  8 Mar 2026 06:17:11 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B7810E0BF;
	Sun,  8 Mar 2026 06:17:11 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3562010E062;
 Sun,  8 Mar 2026 06:17:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1153601862767479961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/color=3A_Enable_S?=
 =?utf-8?q?DR_plane_color_pipeline?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 08 Mar 2026 06:17:10 -0000
Message-ID: <177295063019.330226.7719574661219400389@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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

--===============1153601862767479961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/color: Enable SDR plane color pipeline
URL   : https://patchwork.freedesktop.org/series/162786/
State : failure

== Summary ==

CI Bug Log - changes from xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL -> xe-pw-162786v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-162786v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162786v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162786v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  
New tests
---------

  New tests have been introduced between xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL and xe-pw-162786v1_FULL:

### New IGT tests (62) ###

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.17, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.15, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-3:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.17, 0.18] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.15] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0, 0.00] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-3:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.24] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.23] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-3:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.22] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.25] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-3:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-4:
    - Statuses : 1 fail(s) 1 pass(s)
    - Exec time: [0.16, 0.18] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.17] s

  * igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.16] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-3:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-3:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pm_rpm@universal-planes-dpms@plane-184:
    - Statuses : 2 pass(s)
    - Exec time: [2.47, 7.87] s

  * igt@kms_pm_rpm@universal-planes@plane-184:
    - Statuses : 2 pass(s)
    - Exec time: [2.54, 7.84] s

  

Known issues
------------

  Here are the changes found in xe-pw-162786v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#367] / [Intel XE#7354])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * {igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#6969]) +34 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html

  * {igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#6969]) +30 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3.html

  * {igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4} (NEW):
    - shard-lnl:          NOTRUN -> [FAIL][7] ([Intel XE#7305]) +11 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4.html

  * {igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4} (NEW):
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#6969] / [Intel XE#7006])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4.html

  * {igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4} (NEW):
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#6969] / [Intel XE#7006])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6126] / [Intel XE#776])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][11] -> [FAIL][12] ([Intel XE#3098]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:
    - shard-bmg:          [PASS][13] -> [ABORT][14] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-6/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [PASS][15] -> [INCOMPLETE][16] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4141])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2311])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2313])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1489])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6874])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#5625])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7138])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#5694] / [Intel XE#7370])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@xe_pm@d3cold-i2c.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][26] ([Intel XE#7545]) -> [PASS][27]
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][28] ([Intel XE#301]) -> [PASS][29] +2 other tests pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:
    - shard-bmg:          [FAIL][30] -> [PASS][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][32] ([Intel XE#1503]) -> [PASS][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_hdr@invalid-hdr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][34] ([Intel XE#6321]) -> [PASS][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2:
    - shard-lnl:          [SKIP][36] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][37] ([Intel XE#6969])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:
    - shard-bmg:          [SKIP][38] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][39] ([Intel XE#6969])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][40] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][41] ([Intel XE#3544])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][42] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][43] ([Intel XE#2509] / [Intel XE#7437])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7545
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776


Build changes
-------------

  * Linux: xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a -> xe-pw-162786v1

  IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a: fce8d7fb2107068c269b868d51aba5f9cf85998a
  xe-pw-162786v1: 162786v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/index.html

--===============1153601862767479961==
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
<tr><td><b>Series:</b></td><td>drm/i915/color: Enable SDR plane color pipeline</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162786/">https://patchwork.freedesktop.org/series/162786/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL -&gt; xe-pw-162786v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-162786v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-162786v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-162786v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a_FULL and xe-pw-162786v1_FULL:</p>
<h3>New IGT tests (62)</h3>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.17, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.15, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.17, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.15] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0, 0.00] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.24] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.23] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.22] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.25] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 1 fail(s) 1 pass(s)</li>
<li>Exec time: [0.16, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.17] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.16] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-a-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-3:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-3:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-184:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.47, 7.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-184:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [2.54, 7.84] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162786v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-1/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d@pipe-b-plane-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7305">Intel XE#7305</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4} (NEW):</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>{igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4} (NEW):</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126">Intel XE#6126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-6/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@a-hdmi-a3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-5/igt@kms_flip@flip-vs-suspend@c-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7545">Intel XE#7545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-lnl-4/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-c-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-d-plane-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162786v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a -&gt; xe-pw-162786v1</li>
</ul>
<p>IGT_8783: b5051dc2e867005c758c707312aa9cf9d1dc3291 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4675-fce8d7fb2107068c269b868d51aba5f9cf85998a: fce8d7fb2107068c269b868d51aba5f9cf85998a<br />
  xe-pw-162786v1: 162786v1</p>

</body>
</html>

--===============1153601862767479961==--
