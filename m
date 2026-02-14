Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A93E3EF99DD
	for <intel-xe@archiver.kernel.org>; Sat, 14 Feb 2026 11:15:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE9AF10E2C8;
	Sat, 14 Feb 2026 11:15:53 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4585610E2BE;
 Sat, 14 Feb 2026 11:15:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4252377689096177737=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Refactor_LT_PHY_PLL_handli?=
 =?utf-8?q?ng_to_use_DPLL_framework?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 14 Feb 2026 11:15:53 -0000
Message-ID: <177106775325.254602.6974771610916575380@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213122615.1083654-1-mika.kahola@intel.com>
In-Reply-To: <20260213122615.1083654-1-mika.kahola@intel.com>
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

--===============4252377689096177737==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor LT PHY PLL handling to use DPLL framework
URL   : https://patchwork.freedesktop.org/series/161586/
State : failure

== Summary ==

CI Bug Log - changes from xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07_FULL -> xe-pw-161586v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-161586v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-161586v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-161586v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-6/igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0.html

  
Known issues
------------

  Here are the changes found in xe-pw-161586v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#5545]) +3 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2325])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#1178] / [Intel XE#3304])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#6707])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#776])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#6557] / [Intel XE#6703])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7179])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311]) +1 other test skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4141])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7061])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1406] / [Intel XE#1489])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_psr@pr-primary-render.html

  * igt@kms_sharpness_filter@filter-rotations:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#6503])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#4459]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4837])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7136]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#6703]) +65 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-rebind.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6874])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6703]) +98 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#5625])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] ([Intel XE#3428])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2427] / [Intel XE#6953])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@xe_peer2peer@read.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][35] -> [DMESG-WARN][36] ([Intel XE#6627])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][37] ([Intel XE#5299]) -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-bmg:          [FAIL][39] ([Intel XE#3098]) -> [PASS][40] +1 other test pass
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][41] ([Intel XE#1503]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][43] ([Intel XE#2142]) -> [PASS][44] +1 other test pass
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_oa@non-zero-reason-all:
    - shard-lnl:          [FAIL][45] -> [PASS][46] +1 other test pass
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@xe_oa@non-zero-reason-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@unused-handle:
    - shard-bmg:          [DMESG-WARN][47] ([Intel XE#1727] / [Intel XE#6819]) -> [SKIP][48] ([Intel XE#6703])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_addfb_basic@unused-handle.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          [DMESG-WARN][49] ([Intel XE#3428]) -> [SKIP][50] ([Intel XE#6703])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][51] ([Intel XE#2887]) -> [SKIP][52] ([Intel XE#6703]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][53] ([Intel XE#6707]) -> [SKIP][54] ([Intel XE#6703])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-bmg:          [SKIP][55] ([Intel XE#2320]) -> [SKIP][56] ([Intel XE#6703]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          [SKIP][57] ([Intel XE#4354]) -> [SKIP][58] ([Intel XE#6703])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][59] ([Intel XE#7178]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][61] ([Intel XE#2311]) -> [SKIP][62] ([Intel XE#6703]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][63] ([Intel XE#4141]) -> [SKIP][64] ([Intel XE#6703]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][65] ([Intel XE#2313]) -> [SKIP][66] ([Intel XE#6703]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][67] ([Intel XE#7061]) -> [SKIP][68] ([Intel XE#6703])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][69] ([Intel XE#5021]) -> [SKIP][70] ([Intel XE#6703])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][71] ([Intel XE#6886]) -> [SKIP][72] ([Intel XE#6703])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][73] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][74] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-bmg:          [SKIP][75] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][76] ([Intel XE#1406] / [Intel XE#6703])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-7/igt@kms_psr@pr-sprite-blt.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][77] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][78] ([Intel XE#6703])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][79] ([Intel XE#1729]) -> [SKIP][80] ([Intel XE#2426])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:
    - shard-bmg:          [SKIP][81] ([Intel XE#4837]) -> [SKIP][82] ([Intel XE#6703]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][83] ([Intel XE#2322]) -> [SKIP][84] ([Intel XE#6703]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:
    - shard-bmg:          [SKIP][85] ([Intel XE#7136]) -> [SKIP][86] ([Intel XE#6703])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:
    - shard-bmg:          [SKIP][87] ([Intel XE#6874]) -> [SKIP][88] ([Intel XE#6703]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][89] ([Intel XE#2284]) -> [SKIP][90] ([Intel XE#6703])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787


Build changes
-------------

  * Linux: xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 -> xe-pw-161586v1

  IGT_8753: 8753
  xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07: cd76e45b9a192aa3d4f7a2efb8ee46767f098e07
  xe-pw-161586v1: 161586v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/index.html

--===============4252377689096177737==
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
<tr><td><b>Series:</b></td><td>Refactor LT PHY PLL handling to use DPLL framework</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161586/">https://patchwork.freedesktop.org/series/161586/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07_FULL -&gt; xe-pw-161586v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-161586v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-161586v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-161586v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-6/igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@kms_plane@pixel-format-linear-modifier-source-clamping@pipe-b-plane-0.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-161586v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-rotations:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_sharpness_filter@filter-rotations.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_fault_mode@twice-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_fault_mode@twice-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-4/igt@xe_exec_multi_queue@many-queues-preempt-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_system_allocator@many-large-execqueues-mmap-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-3/igt@xe_gt_freq@freq_suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-8/igt@kms_flip@2x-modeset-vs-vblank-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-10/igt@kms_flip@2x-modeset-vs-vblank-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-lnl-6/igt@xe_oa@non-zero-reason-all.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-lnl-8/igt@xe_oa@non-zero-reason-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-handle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_addfb_basic@unused-handle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_addfb_basic@unused-handle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3428">Intel XE#3428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_async_flips@async-flip-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_content_protection@uevent-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_content_protection@uevent-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-7/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-parameters-userptr-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07/shard-bmg-3/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161586v1/shard-bmg-2/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 -&gt; xe-pw-161586v1</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07: cd76e45b9a192aa3d4f7a2efb8ee46767f098e07<br />
  xe-pw-161586v1: 161586v1</p>

</body>
</html>

--===============4252377689096177737==--
