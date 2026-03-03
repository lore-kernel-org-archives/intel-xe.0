Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D71E67A96
	for <intel-xe@archiver.kernel.org>; Tue,  3 Mar 2026 08:17:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79E4510E65A;
	Tue,  3 Mar 2026 08:17:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9465410E036;
 Tue,  3 Mar 2026 08:17:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6758928768964333420=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/=7Bi915=2C_xe=7D/front?=
 =?utf-8?q?buffer=3A_refactor=2C_move_calls_to_parent_interface?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 03 Mar 2026 08:17:24 -0000
Message-ID: <177252584455.306092.449343245613288418@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <cover.1772475391.git.jani.nikula@intel.com>
In-Reply-To: <cover.1772475391.git.jani.nikula@intel.com>
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

--===============6758928768964333420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915, xe}/frontbuffer: refactor, move calls to parent interface
URL   : https://patchwork.freedesktop.org/series/162448/
State : failure

== Summary ==

CI Bug Log - changes from xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b_FULL -> xe-pw-162448v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-162448v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-162448v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-162448v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][1] ([Intel XE#6281]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  
Known issues
------------

  Here are the changes found in xe-pw-162448v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#607] / [Intel XE#7361])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#367] / [Intel XE#7354]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252]) +5 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#3304]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2341])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][12] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2320]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#4210] / [Intel XE#7467])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1508])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#4354] / [Intel XE#7410])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#4422] / [Intel XE#7442])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2373] / [Intel XE#7448])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#4141]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2311]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2313]) +15 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7308])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3374] / [Intel XE#3544])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6901] / [Intel XE#7423])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7283]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2392] / [Intel XE#7463])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#2029] / [Intel XE#7314] / [Intel XE#7395])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1489]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][35] -> [SKIP][36] ([Intel XE#4692] / [Intel XE#7508])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2330] / [Intel XE#7401])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#6503])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#4459]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1499])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_vrr@flipline.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4837]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7140]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2322] / [Intel XE#7372]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7136]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6874]) +13 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7138]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#6964]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-op-conflict.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2284] / [Intel XE#7370])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#7258])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_pm_residency@aspm_link_residency.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#944]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][56] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][58] ([Intel XE#5625]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [ABORT][60] -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  
#### Warnings ####

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          [SKIP][62] ([Intel XE#664]) -> [SKIP][63] ([Intel XE#664] / [Intel XE#7380])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_async_flips@test-cursor.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_async_flips@test-cursor.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [SKIP][64] ([Intel XE#3658]) -> [SKIP][65] ([Intel XE#3658] / [Intel XE#7360]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][66] ([Intel XE#7059]) -> [SKIP][67] ([Intel XE#7059] / [Intel XE#7415]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][68] ([Intel XE#7059]) -> [SKIP][69] ([Intel XE#7059] / [Intel XE#7415]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][70] ([Intel XE#2328]) -> [SKIP][71] ([Intel XE#2328] / [Intel XE#7367]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_big_fb@y-tiled-addfb.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          [SKIP][72] ([Intel XE#1477]) -> [SKIP][73] ([Intel XE#1477] / [Intel XE#7361]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][74] ([Intel XE#1428]) -> [SKIP][75] ([Intel XE#1428] / [Intel XE#7387]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][76] ([Intel XE#610]) -> [SKIP][77] ([Intel XE#610] / [Intel XE#7387]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-lnl:          [SKIP][78] ([Intel XE#1467]) -> [SKIP][79] ([Intel XE#1467] / [Intel XE#7367]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_big_fb@yf-tiled-addfb.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][80] ([Intel XE#607]) -> [SKIP][81] ([Intel XE#607] / [Intel XE#7361])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-lnl:          [SKIP][82] ([Intel XE#2191]) -> [SKIP][83] ([Intel XE#2191] / [Intel XE#7373]) +6 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-bmg:          [SKIP][84] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][85] ([Intel XE#2314] / [Intel XE#2894] / [Intel XE#7373]) +7 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          [SKIP][86] ([Intel XE#1512]) -> [SKIP][87] ([Intel XE#1512] / [Intel XE#7392]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-bmg:          [SKIP][88] ([Intel XE#367]) -> [SKIP][89] ([Intel XE#367] / [Intel XE#7354]) +12 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          [SKIP][90] ([Intel XE#367]) -> [SKIP][91] ([Intel XE#367] / [Intel XE#7354]) +7 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:
    - shard-lnl:          [SKIP][92] ([Intel XE#2669]) -> [SKIP][93] ([Intel XE#2669] / [Intel XE#7389]) +19 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][94] ([Intel XE#2724]) -> [SKIP][95] ([Intel XE#2724] / [Intel XE#7449]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          [SKIP][96] ([Intel XE#4417]) -> [SKIP][97] ([Intel XE#4417] / [Intel XE#7407]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-lnl:          [SKIP][98] ([Intel XE#4416]) -> [SKIP][99] ([Intel XE#4416] / [Intel XE#7381]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_cdclk@plane-scaling.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][100] ([Intel XE#2325]) -> [SKIP][101] ([Intel XE#2325] / [Intel XE#7358]) +9 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          [SKIP][102] ([Intel XE#306]) -> [SKIP][103] ([Intel XE#306] / [Intel XE#7358]) +10 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_chamelium_color@ctm-blue-to-red.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          [FAIL][104] ([Intel XE#3304]) -> [FAIL][105] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][106] ([Intel XE#1178] / [Intel XE#3304]) -> [FAIL][107] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +11 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@kms_content_protection@legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          [SKIP][108] ([Intel XE#1468]) -> [SKIP][109] ([Intel XE#1468] / [Intel XE#7396])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_content_protection@mei-interface.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent-hdcp14:
    - shard-bmg:          [FAIL][110] ([Intel XE#6707]) -> [FAIL][111] ([Intel XE#6707] / [Intel XE#7439]) +3 other tests fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_content_protection@uevent-hdcp14.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_content_protection@uevent-hdcp14.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-lnl:          [SKIP][112] ([Intel XE#2321]) -> [SKIP][113] ([Intel XE#2321] / [Intel XE#7355]) +9 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
    - shard-bmg:          [SKIP][114] ([Intel XE#2321]) -> [SKIP][115] ([Intel XE#2321] / [Intel XE#7355]) +8 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          [SKIP][116] ([Intel XE#309]) -> [SKIP][117] ([Intel XE#309] / [Intel XE#7343]) +28 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [SKIP][118] ([Intel XE#323]) -> [SKIP][119] ([Intel XE#323] / [Intel XE#7412]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
    - shard-bmg:          [SKIP][120] ([Intel XE#2286]) -> [SKIP][121] ([Intel XE#2286] / [Intel XE#7412]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-lnl:          [SKIP][122] ([Intel XE#4302]) -> [SKIP][123] ([Intel XE#4302] / [Intel XE#7403])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_display_modes@extended-mode-basic.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          [SKIP][124] ([Intel XE#1340]) -> [SKIP][125] ([Intel XE#1340] / [Intel XE#7435])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-lnl:          [SKIP][126] ([Intel XE#4354]) -> [SKIP][127] ([Intel XE#4354] / [Intel XE#7410])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-lnl:          [SKIP][128] ([Intel XE#4354]) -> [SKIP][129] ([Intel XE#4354] / [Intel XE#7450])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_dp_link_training@non-uhbr-sst.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][130] ([Intel XE#4354]) -> [SKIP][131] ([Intel XE#4354] / [Intel XE#7386])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_dp_link_training@uhbr-mst.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html
    - shard-bmg:          [SKIP][132] ([Intel XE#4354]) -> [SKIP][133] ([Intel XE#4354] / [Intel XE#7386])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          [SKIP][134] ([Intel XE#4354]) -> [SKIP][135] ([Intel XE#4354] / [Intel XE#7473])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_dp_link_training@uhbr-sst.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html
    - shard-bmg:          [SKIP][136] ([Intel XE#4354]) -> [SKIP][137] ([Intel XE#4354] / [Intel XE#7473])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@kms_dp_link_training@uhbr-sst.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-lnl:          [SKIP][138] ([Intel XE#4294]) -> [SKIP][139] ([Intel XE#4294] / [Intel XE#7472])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_dp_linktrain_fallback@dp-fallback.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-lnl:          [SKIP][140] ([Intel XE#4331]) -> [SKIP][141] ([Intel XE#4331] / [Intel XE#7418])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_dp_linktrain_fallback@dsc-fallback.html
    - shard-bmg:          [SKIP][142] ([Intel XE#4331]) -> [SKIP][143] ([Intel XE#4331] / [Intel XE#7418])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-lnl:          [SKIP][144] ([Intel XE#4422]) -> [SKIP][145] ([Intel XE#4422] / [Intel XE#7442]) +2 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
    - shard-bmg:          [SKIP][146] ([Intel XE#4422]) -> [SKIP][147] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [SKIP][148] ([Intel XE#4156]) -> [SKIP][149] ([Intel XE#4156] / [Intel XE#7425])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fbcon_fbt@fbc-suspend.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][150] ([Intel XE#776]) -> [SKIP][151] ([Intel XE#7416] / [Intel XE#776]) +1 other test skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fbcon_fbt@psr-suspend.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][152] ([Intel XE#2372]) -> [SKIP][153] ([Intel XE#2372] / [Intel XE#7359])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_feature_discovery@chamelium.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_feature_discovery@chamelium.html
    - shard-lnl:          [SKIP][154] ([Intel XE#701]) -> [SKIP][155] ([Intel XE#701] / [Intel XE#7359])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_feature_discovery@chamelium.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          [SKIP][156] ([Intel XE#702]) -> [SKIP][157] ([Intel XE#702] / [Intel XE#7462])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_feature_discovery@display-2x.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][158] ([Intel XE#703]) -> [SKIP][159] ([Intel XE#703] / [Intel XE#7448])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_feature_discovery@display-3x.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-lnl:          [SKIP][160] ([Intel XE#1138]) -> [SKIP][161] ([Intel XE#1138] / [Intel XE#7344])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_feature_discovery@display-4x.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          [SKIP][162] ([Intel XE#1138]) -> [SKIP][163] ([Intel XE#1138] / [Intel XE#7344])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_feature_discovery@display-4x.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-lnl:          [SKIP][164] ([Intel XE#1137]) -> [SKIP][165] ([Intel XE#1137] / [Intel XE#7438])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_feature_discovery@dp-mst.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_feature_discovery@dp-mst.html
    - shard-bmg:          [SKIP][166] ([Intel XE#2375]) -> [SKIP][167] ([Intel XE#2375] / [Intel XE#7438])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_feature_discovery@dp-mst.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][168] ([Intel XE#2374]) -> [SKIP][169] ([Intel XE#2374] / [Intel XE#6127])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_feature_discovery@psr1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_feature_discovery@psr1.html

  * igt@kms_feature_discovery@psr2:
    - shard-bmg:          [SKIP][170] ([Intel XE#2374]) -> [SKIP][171] ([Intel XE#2374] / [Intel XE#7468])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_feature_discovery@psr2.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          [SKIP][172] ([Intel XE#7178]) -> [SKIP][173] ([Intel XE#7178] / [Intel XE#7349]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-bmg:          [SKIP][174] ([Intel XE#7178]) -> [SKIP][175] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          [SKIP][176] ([Intel XE#1397]) -> [SKIP][177] ([Intel XE#1397] / [Intel XE#7385]) +8 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-lnl:          [SKIP][178] ([Intel XE#7179]) -> [SKIP][179] ([Intel XE#7179] / [Intel XE#7411]) +3 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          [SKIP][180] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][181] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385]) +8 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][182] ([Intel XE#7178]) -> [SKIP][183] ([Intel XE#7178] / [Intel XE#7351]) +20 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:
    - shard-lnl:          [SKIP][184] ([Intel XE#7178]) -> [SKIP][185] ([Intel XE#7178] / [Intel XE#7351]) +23 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          [SKIP][186] ([Intel XE#7179]) -> [SKIP][187] ([Intel XE#7179] / [Intel XE#7411]) +2 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:
    - shard-lnl:          [SKIP][188] ([Intel XE#7061]) -> [SKIP][189] ([Intel XE#7061] / [Intel XE#7356]) +28 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][190] ([Intel XE#7061]) -> [SKIP][191] ([Intel XE#7061] / [Intel XE#7356]) +23 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-lnl:          [SKIP][192] ([Intel XE#1469]) -> [SKIP][193] ([Intel XE#1469] / [Intel XE#7399]) +2 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          [SKIP][194] ([Intel XE#2352]) -> [SKIP][195] ([Intel XE#2352] / [Intel XE#7399]) +2 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          [SKIP][196] ([Intel XE#2350]) -> [SKIP][197] ([Intel XE#2350] / [Intel XE#7503])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:
    - shard-lnl:          [SKIP][198] ([Intel XE#1450]) -> [SKIP][199] ([Intel XE#1450] / [Intel XE#7394]) +1 other test skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html

  * igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:
    - shard-lnl:          [SKIP][200] ([Intel XE#1450] / [Intel XE#2568]) -> [SKIP][201] ([Intel XE#1450] / [Intel XE#2568] / [Intel XE#7394]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          [SKIP][202] ([Intel XE#6901]) -> [SKIP][203] ([Intel XE#6901] / [Intel XE#7423]) +1 other test skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_joiner@basic-big-joiner.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_joiner@basic-big-joiner.html
    - shard-bmg:          [SKIP][204] ([Intel XE#6901]) -> [SKIP][205] ([Intel XE#6901] / [Intel XE#7423])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_joiner@basic-big-joiner.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-lnl:          [SKIP][206] ([Intel XE#7086]) -> [SKIP][207] ([Intel XE#7086] / [Intel XE#7390]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_joiner@basic-force-big-joiner.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-lnl:          [SKIP][208] ([Intel XE#6900]) -> [SKIP][209] ([Intel XE#6900] / [Intel XE#7362]) +3 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          [SKIP][210] ([Intel XE#6911]) -> [SKIP][211] ([Intel XE#6911] / [Intel XE#7378]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@kms_joiner@basic-ultra-joiner.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][212] ([Intel XE#6911]) -> [SKIP][213] ([Intel XE#6911] / [Intel XE#7466]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][214] ([Intel XE#4090]) -> [SKIP][215] ([Intel XE#4090] / [Intel XE#7443])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
    - shard-lnl:          [SKIP][216] ([Intel XE#7173] / [Intel XE#7294]) -> [SKIP][217] ([Intel XE#7173] / [Intel XE#7294] / [Intel XE#7460])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][218] ([Intel XE#6912]) -> [SKIP][219] ([Intel XE#6912] / [Intel XE#7375])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
    - shard-lnl:          [SKIP][220] ([Intel XE#6912]) -> [SKIP][221] ([Intel XE#6912] / [Intel XE#7375])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          [SKIP][222] ([Intel XE#4329] / [Intel XE#6912]) -> [SKIP][223] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          [SKIP][224] ([Intel XE#4329] / [Intel XE#6912]) -> [SKIP][225] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          [SKIP][226] ([Intel XE#7130]) -> [SKIP][227] ([Intel XE#7130] / [Intel XE#7409]) +3 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:
    - shard-lnl:          [SKIP][228] ([Intel XE#7130]) -> [SKIP][229] ([Intel XE#7130] / [Intel XE#7409]) +5 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          [SKIP][230] ([Intel XE#599]) -> [SKIP][231] ([Intel XE#599] / [Intel XE#7382]) +11 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          [SKIP][232] ([Intel XE#4596]) -> [SKIP][233] ([Intel XE#4596] / [Intel XE#7458]) +4 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][234] ([Intel XE#5021]) -> [SKIP][235] ([Intel XE#5021] / [Intel XE#7377]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-lnl:          [SKIP][236] ([Intel XE#5020]) -> [SKIP][237] ([Intel XE#5020] / [Intel XE#7348])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_plane_multiple@tiling-y.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_plane_multiple@tiling-y.html
    - shard-bmg:          [SKIP][238] ([Intel XE#5020]) -> [SKIP][239] ([Intel XE#5020] / [Intel XE#7348])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_plane_multiple@tiling-y.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          [SKIP][240] ([Intel XE#870]) -> [SKIP][241] ([Intel XE#7376] / [Intel XE#870]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][242] ([Intel XE#2938]) -> [SKIP][243] ([Intel XE#2938] / [Intel XE#7376])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_pm_backlight@brightness-with-dpms.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][244] ([Intel XE#7339]) -> [SKIP][245] ([Intel XE#7339] / [Intel XE#7506])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-bmg:          [SKIP][246] ([Intel XE#2391]) -> [SKIP][247] ([Intel XE#2391] / [Intel XE#7441])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          [SKIP][248] ([Intel XE#1131]) -> [SKIP][249] ([Intel XE#1131] / [Intel XE#7451])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-negative.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][250] ([Intel XE#2392]) -> [SKIP][251] ([Intel XE#2392] / [Intel XE#7463])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_dc@dc5-psr.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-lnl:          [SKIP][252] ([Intel XE#3309]) -> [SKIP][253] ([Intel XE#3309] / [Intel XE#7368])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_pm_dc@dc5-retention-flops.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          [SKIP][254] ([Intel XE#3309]) -> [SKIP][255] ([Intel XE#3309] / [Intel XE#7368])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][256] ([Intel XE#2505]) -> [SKIP][257] ([Intel XE#2505] / [Intel XE#7447])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_pm_dc@deep-pkgc.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][258] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][259] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +3 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_rpm@dpms-lpsp.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][260] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][261] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][262] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][263] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_pm_rpm@modeset-non-lpsp.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          [SKIP][264] ([Intel XE#6813]) -> [SKIP][265] ([Intel XE#6813] / [Intel XE#7470])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_pm_rpm@package-g7.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_pm_rpm@package-g7.html
    - shard-bmg:          [SKIP][266] ([Intel XE#6814]) -> [SKIP][267] ([Intel XE#6814] / [Intel XE#7428])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_rpm@package-g7.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][268] ([Intel XE#2893]) -> [SKIP][269] ([Intel XE#2893] / [Intel XE#7304]) +22 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          [SKIP][270] ([Intel XE#1128]) -> [SKIP][271] ([Intel XE#1128] / [Intel XE#7413]) +3 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][272] ([Intel XE#2387]) -> [SKIP][273] ([Intel XE#2387] / [Intel XE#7429]) +3 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          [SKIP][274] ([Intel XE#1406]) -> [SKIP][275] ([Intel XE#1406] / [Intel XE#7345]) +11 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_psr@fbc-psr2-sprite-render.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-bmg:          [SKIP][276] ([Intel XE#2414]) -> [SKIP][277] ([Intel XE#2414] / [Intel XE#7446]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          [SKIP][278] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][279] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +12 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-90.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][280] ([Intel XE#2330]) -> [SKIP][281] ([Intel XE#2330] / [Intel XE#7401]) +2 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          [SKIP][282] ([Intel XE#1127]) -> [SKIP][283] ([Intel XE#1127] / [Intel XE#7401]) +3 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][284] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][285] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +9 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][286] ([Intel XE#2426]) -> [FAIL][287] ([Intel XE#1729] / [Intel XE#7424])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-lnl:          [SKIP][288] ([Intel XE#362]) -> [SKIP][289] ([Intel XE#362] / [Intel XE#7420]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-bmg:          [SKIP][290] ([Intel XE#2426]) -> [SKIP][291] ([Intel XE#2426] / [Intel XE#7420])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-lnl:          [SKIP][292] ([Intel XE#330]) -> [SKIP][293] ([Intel XE#330] / [Intel XE#7440])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_tv_load_detect@load-detect.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          [SKIP][294] ([Intel XE#2450]) -> [SKIP][295] ([Intel XE#2450] / [Intel XE#7440])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_tv_load_detect@load-detect.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          [SKIP][296] ([Intel XE#2168]) -> [SKIP][297] ([Intel XE#2168] / [Intel XE#7444]) +1 other test skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_vrr@lobf.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf@pipe-a-edp-1:
    - shard-lnl:          [FAIL][298] ([Intel XE#6390]) -> [FAIL][299] ([Intel XE#6390] / [Intel XE#7461]) +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_vrr@lobf@pipe-a-edp-1.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_vrr@lobf@pipe-a-edp-1.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-lnl:          [SKIP][300] ([Intel XE#1447]) -> [SKIP][301] ([Intel XE#1447] / [Intel XE#7471])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_compute@ccs-mode-basic.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-lnl:          [SKIP][302] ([Intel XE#1447]) -> [SKIP][303] ([Intel XE#1447] / [Intel XE#7469])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_compute@ccs-mode-compute-kernel.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_compute@eu-busy-10s:
    - shard-lnl:          [SKIP][304] ([Intel XE#6592] / [Intel XE#6645]) -> [SKIP][305] ([Intel XE#6592] / [Intel XE#6645] / [Intel XE#7391])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_compute@eu-busy-10s.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_compute@eu-busy-10s.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict:
    - shard-lnl:          [SKIP][306] ([Intel XE#5191] / [Intel XE#7316]) -> [SKIP][307] ([Intel XE#5191] / [Intel XE#7316] / [Intel XE#7346]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict.html

  * igt@xe_configfs@survivability-mode:
    - shard-lnl:          [SKIP][308] ([Intel XE#6010] / [Intel XE#7317]) -> [SKIP][309] ([Intel XE#6010] / [Intel XE#7317] / [Intel XE#7455])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_configfs@survivability-mode.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_configfs@survivability-mode.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          [SKIP][310] ([Intel XE#1062] / [Intel XE#7318]) -> [SKIP][311] ([Intel XE#1062] / [Intel XE#7318] / [Intel XE#7457])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_create@create-big-vram.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-3/igt@xe_create@create-big-vram.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          [SKIP][312] ([Intel XE#7319] / [Intel XE#944]) -> [SKIP][313] ([Intel XE#7319] / [Intel XE#7350] / [Intel XE#944])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_create@multigpu-create-massive-size.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html
    - shard-bmg:          [SKIP][314] ([Intel XE#2504] / [Intel XE#7319]) -> [SKIP][315] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][316] ([Intel XE#5793] / [Intel XE#7320]) -> [SKIP][317] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_eudebug_sriov@deny-eudebug.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-lnl:          [SKIP][318] ([Intel XE#4518]) -> [SKIP][319] ([Intel XE#4518] / [Intel XE#7404]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_eudebug_sriov@deny-sriov.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          [SKIP][320] ([Intel XE#2322]) -> [SKIP][321] ([Intel XE#2322] / [Intel XE#7372]) +42 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_media_fill@media-fill:
    - shard-lnl:          [SKIP][322] ([Intel XE#560] / [Intel XE#7321]) -> [SKIP][323] ([Intel XE#560] / [Intel XE#7321] / [Intel XE#7453])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_media_fill@media-fill.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_media_fill@media-fill.html
    - shard-bmg:          [SKIP][324] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321]) -> [SKIP][325] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_media_fill@media-fill.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-lnl:          [SKIP][326] ([Intel XE#5100] / [Intel XE#7322]) -> [SKIP][327] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_mmap@pci-membarrier-parallel.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          [SKIP][328] ([Intel XE#512] / [Intel XE#7323]) -> [SKIP][329] ([Intel XE#512] / [Intel XE#7323] / [Intel XE#7384])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_mmap@small-bar.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_mmap@small-bar.html
    - shard-bmg:          [SKIP][330] ([Intel XE#586] / [Intel XE#7323]) -> [SKIP][331] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_mmap@small-bar.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [SKIP][339], [PASS][340], [PASS][341], [PASS][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357]) ([Intel XE#378]) -> ([PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363], [PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [SKIP][383]) ([Intel XE#378] / [Intel XE#7405])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-3/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html
    - shard-bmg:          ([SKIP][384], [PASS][385], [PASS][386], [PASS][387], [PASS][388], [PASS][389], [PASS][390], [PASS][391], [PASS][392], [PASS][393], [PASS][394], [PASS][395], [PASS][396], [PASS][397], [PASS][398], [PASS][399], [PASS][400], [PASS][401], [PASS][402], [PASS][403], [PASS][404], [PASS][405], [PASS][406], [PASS][407], [PASS][408], [PASS][409]) ([Intel XE#2457]) -> ([PASS][410], [PASS][411], [PASS][412], [PASS][413], [PASS][414], [PASS][415], [PASS][416], [PASS][417], [PASS][418], [PASS][419], [PASS][420], [PASS][421], [PASS][422], [PASS][423], [SKIP][424], [PASS][425], [PASS][426], [PASS][427], [PASS][428], [PASS][429], [PASS][430], [PASS][431], [PASS][432], [PASS][433], [PASS][434], [PASS][435]) ([Intel XE#2457] / [Intel XE#7405])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_module_load@load.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@load.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_module_load@load.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@xe_module_load@load.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@xe_module_load@load.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_module_load@load.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_module_load@load.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@xe_module_load@load.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@xe_module_load@load.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_module_load@load.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@load.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@load.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_module_load@load.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@load.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@xe_module_load@load.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@xe_module_load@load.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@xe_module_load@load.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@xe_module_load@load.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@xe_module_load@load.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@xe_module_load@load.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@xe_module_load@load.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@xe_module_load@load.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@xe_module_load@load.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_module_load@load.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_module_load@load.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_module_load@load.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_module_load@load.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_module_load@load.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_module_load@load.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@xe_module_load@load.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_module_load@load.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_module_load@load.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@xe_module_load@load.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_module_load@load.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@xe_module_load@load.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@xe_module_load@load.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_module_load@load.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_module_load@load.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_module_load@load.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_module_load@load.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_module_load@load.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@xe_module_load@load.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_module_load@load.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@xe_module_load@load.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_module_load@load.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_module_load@load.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_module_load@load.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@xe_module_load@load.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong@basic:
    - shard-lnl:          [SKIP][436] ([Intel XE#6259] / [Intel XE#7324]) -> [SKIP][437] ([Intel XE#6259] / [Intel XE#7324] / [Intel XE#7406])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_noexec_ping_pong@basic.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@xe_noexec_ping_pong@basic.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-lnl:          [SKIP][438] ([Intel XE#2248] / [Intel XE#7325]) -> [SKIP][439] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_oa@oa-tlb-invalidate.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          [SKIP][440] ([Intel XE#2248] / [Intel XE#7325]) -> [SKIP][441] ([Intel XE#2248] / [Intel XE#7325] / [Intel XE#7393])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_oa@oa-tlb-invalidate.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_peer2peer@read:
    - shard-lnl:          [SKIP][442] ([Intel XE#1061] / [Intel XE#7326]) -> [SKIP][443] ([Intel XE#1061] / [Intel XE#7326] / [Intel XE#7353]) +1 other test skip
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_peer2peer@read.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_peer2peer@read.html
    - shard-bmg:          [SKIP][444] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326]) -> [SKIP][445] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_peer2peer@read.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          [SKIP][446] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][447] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +7 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_pm@d3cold-basic.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_pm@d3cold-basic.html
    - shard-bmg:          [SKIP][448] ([Intel XE#2284]) -> [SKIP][449] ([Intel XE#2284] / [Intel XE#7370]) +6 other tests skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@xe_pm@d3cold-basic.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-lnl:          [SKIP][450] ([Intel XE#5694]) -> [SKIP][451] ([Intel XE#5694] / [Intel XE#7370])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_pm@d3cold-i2c.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_pm@d3cold-i2c.html
    - shard-bmg:          [SKIP][452] ([Intel XE#5694]) -> [SKIP][453] ([Intel XE#5694] / [Intel XE#7370])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_pm@d3cold-i2c.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          [SKIP][454] ([Intel XE#2284]) -> [SKIP][455] ([Intel XE#2284] / [Intel XE#7370])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_pm@d3cold-mocs.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          [SKIP][456] ([Intel XE#5742] / [Intel XE#7328]) -> [SKIP][457] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_pm@d3hot-i2c.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_pm@d3hot-i2c.html
    - shard-bmg:          [SKIP][458] ([Intel XE#5742] / [Intel XE#7328]) -> [SKIP][459] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_pm@d3hot-i2c.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s3-mocs:
    - shard-lnl:          [SKIP][460] ([Intel XE#584]) -> [SKIP][461] ([Intel XE#584] / [Intel XE#7369]) +10 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_pm@s3-mocs.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_pm@s3-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-lnl:          [SKIP][462] ([Intel XE#579] / [Intel XE#7329]) -> [SKIP][463] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@xe_pm@vram-d3cold-threshold.html
    - shard-bmg:          [SKIP][464] ([Intel XE#579] / [Intel XE#7329]) -> [SKIP][465] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7456])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-lnl:          [SKIP][466] ([Intel XE#4650]) -> [SKIP][467] ([Intel XE#4650] / [Intel XE#7347]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_pmu@all-fn-engine-activity-load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][468] ([Intel XE#4733]) -> [SKIP][469] ([Intel XE#4733] / [Intel XE#7417]) +10 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          [SKIP][470] ([Intel XE#4130]) -> [SKIP][471] ([Intel XE#4130] / [Intel XE#7366]) +5 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_sriov_auto_provisioning@fair-allocation.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-lnl:          [SKIP][472] ([Intel XE#4351]) -> [SKIP][473] ([Intel XE#4351] / [Intel XE#7357]) +1 other test skip
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  * igt@xe_sriov_vram@vf-access-beyond:
    - shard-lnl:          [SKIP][474] ([Intel XE#6376] / [Intel XE#7330]) -> [SKIP][475] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422]) +3 other tests skip
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_sriov_vram@vf-access-beyond.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_sriov_vram@vf-access-beyond.html

  * igt@xe_survivability@i2c-functionality:
    - shard-lnl:          [SKIP][476] ([Intel XE#6529] / [Intel XE#7331]) -> [SKIP][477] ([Intel XE#6529] / [Intel XE#7331] / [Intel XE#7388]) +1 other test skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_survivability@i2c-functionality.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_survivability@i2c-functionality.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4692]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6259
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6390
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6529]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6529
  [Intel XE#6592]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6592
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#6645]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6645
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7086
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7173
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7258]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7258
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7314
  [Intel XE#7316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316
  [Intel XE#7317]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7317
  [Intel XE#7318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7318
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7324
  [Intel XE#7325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7325
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331
  [Intel XE#7339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7339
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7346
  [Intel XE#7347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7347
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7357]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7357
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7373
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7380
  [Intel XE#7381]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7381
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7388]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7388
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7390
  [Intel XE#7391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391
  [Intel XE#7392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7392
  [Intel XE#7393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393
  [Intel XE#7394]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7394
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7401
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7403]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7403
  [Intel XE#7404]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7404
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406
  [Intel XE#7407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7407
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7409]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7409
  [Intel XE#7410]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7410
  [Intel XE#7411]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7411
  [Intel XE#7412]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7412
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7415
  [Intel XE#7416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7416
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7418
  [Intel XE#7420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7420
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7423
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7438
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7440
  [Intel XE#7441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7441
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7446
  [Intel XE#7447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7447
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7450
  [Intel XE#7451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7451
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7455
  [Intel XE#7456]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456
  [Intel XE#7457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457
  [Intel XE#7458]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7458
  [Intel XE#7460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7460
  [Intel XE#7461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7461
  [Intel XE#7462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7462
  [Intel XE#7463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7463
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7468
  [Intel XE#7469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7469
  [Intel XE#7470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7470
  [Intel XE#7471]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7471
  [Intel XE#7472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7472
  [Intel XE#7473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7473
  [Intel XE#7503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503
  [Intel XE#7506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7506
  [Intel XE#7508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b -> xe-pw-162448v1

  IGT_8776: 8776
  xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b: 658ee8457333fe9f26f88f812f6cd423f800720b
  xe-pw-162448v1: 162448v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/index.html

--===============6758928768964333420==
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
<tr><td><b>Series:</b></td><td>drm/{i915, xe}/frontbuffer: refactor, move c=
alls to parent interface</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/162448/">https://patchwork.freedesktop.org/series/162448/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-162448v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4643-658ee8457333fe9f26f88f812f6cd423f=
800720b_FULL -&gt; xe-pw-162448v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-162448v1_FULL need to be verifie=
d<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-162448v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1624=
48v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_fault=
_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#=
6281</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162448v1/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_e=
xec_queue_add.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162448v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-lnl-ccs@pipe-d-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-bas=
ic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_chamelium_hpd@vga-hpd.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2252">Intel XE#2252</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_content_protection@atomic=
-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_content_protection@legacy=
-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other t=
est fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_dirtyfb@fbc-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4210">Intel XE#4210</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7410">Intel XE#7410</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend@a-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_flip@flip-vs-s=
uspend@a-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other =
test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs=
-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-=
1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_joiner@invalid-modeset-bi=
g-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6901">Intel XE#6901</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7423">Intel XE#7423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_plane@pixel-format-yf-til=
ed-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7463">Intel XE#7463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_pm_d=
c@deep-pkgc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Int=
el XE#2029</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7314">Intel XE#7314</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_psr@fbc-psr-sprite-render=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@k=
ms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4692">Intel XE#4692=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7508"=
>Intel XE#7508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_rotation_crc@bad-tiling.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7401">Intel XE#7401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_sharpness_filter@invalid-=
filter-with-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_eudebug@basic-exec-queues-=
enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_eudebug_online@single-step=
-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_evict@evict-small-multi-qu=
eue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7140">Intel XE#7140</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_exec_fault_mode@many-multi=
-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +13 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_exec_threads@threads-multi=
-queue-mixed-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-atomic-o=
p-conflict.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_pm_re=
sidency@aspm_link_residency.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_pm_residency@a=
spm_link_residency.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7258">Intel XE#7258</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_query@multigpu-query-cs-cy=
cles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1624=
48v1/shard-bmg-9/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162448v1/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_guc_log_init.html">ABORT</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard=
-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_asyn=
c_flips@test-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/664">Intel XE#664</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_async_fli=
ps@test-cursor.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/664">Intel XE#664</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7380">Intel XE#7380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel =
XE#3658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-162448v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/=
shard-lnl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7415">Intel XE#7415</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/=
shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7059">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7415">Intel XE#7415</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#147=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361=
">Intel XE#7361</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/ig=
t@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7=
387</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_big_=
fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@km=
s_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_big_=
fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1467">Intel XE#1467</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_big_fb@yf=
-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1467">Intel XE#1467</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_big_=
fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-=
7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607<=
/a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">=
Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sh=
ard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191=
">Intel XE#2191</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7373">Intel XE#7373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-162448v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2314">Intel XE#2314</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2894">Intel XE#2894</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7373">Intel XE#7373</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_bw@c=
onnected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sh=
ard-lnl-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512=
">Intel XE#1512</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7392">Intel XE#7392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_bw@l=
inear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/ig=
t@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE=
#7354</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/ig=
t@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE=
#7354</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_ccs@=
crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/=
shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-edp-1.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2669">Intel XE#2669</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7389">Intel XE#7389</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_cdcl=
k@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/ig=
t@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7407">Intel XE#7=
407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4416">Intel XE#4416</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7381">Intel XE#7381</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_chamel=
ium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +9 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_cham=
elium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_c=
hamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +10=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/s=
hard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/33=
04">Intel XE#3304</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7=
/igt@kms_content_protection@legacy.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">In=
tel XE#7374</a>) +11 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@km=
s_content_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_cont=
ent_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@km=
s_content_protection@uevent-hdcp14.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a=
>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>) +9 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/ig=
t@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE=
#7343</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-be=
fore-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7412">Intel XE#=
7412</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7412">Intel=
 XE#7412</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7403">Intel XE#7403=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-=
bmg-2/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel =
XE#1340</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7410">Intel XE#7410</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_d=
p_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7450">Intel XE#7450</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_dp_l=
ink_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_dp_li=
nk_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7473">Intel XE#7473</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@kms_dp_l=
ink_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_dp_li=
nk_training@uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7473">Intel XE#7473</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_dp_l=
inktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@k=
ms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4294">Intel XE#4294</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7472">Intel XE#7472=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7418">Intel XE#7=
418</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_dp_l=
inktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/ig=
t@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7418">Intel XE#7=
418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1=
/shard-lnl-4/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7442">Intel XE#7442</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1=
/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7442">Intel XE#7442</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fbco=
n_fbt@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4156">Intel XE#4156</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_fbcon_fbt=
@fbc-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fbco=
n_fbt@psr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_fbcon_fbt@p=
sr-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7416">Intel XE#7416</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/776">Intel XE#776</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_fea=
ture_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2372">Intel XE#2372</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_feat=
ure_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_featu=
re_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/701">Intel XE#701</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/702">Intel XE#702</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7462">Intel XE#7462</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/703">Intel XE#703</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_feat=
ure_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7438">Intel XE#7438</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2375">Intel XE#2375</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7438">Intel XE#7438</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2374">Intel XE#2374</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_feature_=
discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7468">Intel XE#7468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Int=
el XE#7178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-162448v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bp=
p-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) +2 oth=
er tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Int=
el XE#7178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-162448v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bp=
p-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1397">Intel XE#1397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp=
-xtile-to-64bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#13=
97</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/738=
5">Intel XE#7385</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflec=
t-x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">I=
ntel XE#7179</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-162448v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-=
to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7411">Intel XE#7411</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel X=
E#1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-lin=
ear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel=
 XE#7385</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel X=
E#7178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-162448v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +20 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#=
7178</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162448v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yft=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +23 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#71=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
2448v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-=
reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7179">Intel XE#7179</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7411">Intel XE#7411</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/s=
hard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-blt.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7356">Intel XE#7356</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7061">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7356">Intel XE#7356</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel =
XE#7399</a>) +2 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/i=
gt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel =
XE#7399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/ig=
t@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7503">Intel XE#7=
503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_inva=
lid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-=
5/igt@kms_invalid_mode@clock-too-high@pipe-a-edp-1.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7394"=
>Intel XE#7394</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_inva=
lid_mode@clock-too-high@pipe-c-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1450">Intel XE#1450</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1624=
48v1/shard-lnl-5/igt@kms_invalid_mode@clock-too-high@pipe-c-edp-1.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1450"=
>Intel XE#1450</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2568">Intel XE#2568</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7394">Intel XE#7394</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_joiner@=
basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6901">Intel XE#6901</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7423">Intel XE#7423</a>) +1 other test s=
kip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_join=
er@basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_joiner@=
basic-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6901">Intel XE#6901</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7423">Intel XE#7423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@kms_j=
oiner@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7086">Intel XE#7086</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7390">Intel XE#7390</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6900">Intel XE#6900</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>) +3 other te=
sts skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@kms_join=
er@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_joine=
r@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg=
-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#691=
1</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466=
">Intel XE#7466</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard=
-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7443">Intel XE#7443</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7173">Intel XE#7173</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7294">Intel XE#=
7294</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
162448v1/shard-lnl-4/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7173">Intel XE#7173</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7294">Intel XE#7294</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7460">Intel XE#7460</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/ig=
t@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#=
7375</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/ig=
t@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#=
7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sh=
ard-bmg-8/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#432=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912=
">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7375">Intel XE#7375</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_pipe=
_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4329">Intel XE#4329</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sh=
ard-lnl-7/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329">Intel XE#432=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912=
">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_plan=
e@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7=
130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62448v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pip=
e-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7130">Intel XE#7130</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7409">Intel XE#7409</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@kms_plan=
e@pixel-format-4-tiled-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/=
shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-a-plane-5.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7130">Intel XE#7130</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7409">Intel XE#7409</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_plan=
e_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@km=
s_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a=
>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_p=
lane_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7458">Intel XE#7458</a>) +4 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_plan=
e_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_plane_m=
ultiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@kms_pm_b=
acklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@kms_pm_ba=
cklight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@k=
ms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7339">Intel XE#7339</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7339">Intel XE#7339</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7506">Intel XE#7506</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2391">Intel XE#2391</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7441">Intel XE#7441</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_pm_d=
c@dc5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1131">Intel XE#1131</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_pm_dc@d=
c5-dpms-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1131">Intel XE#1131</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7451">Intel XE#7451</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2392">Intel XE#2392</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7463">Intel XE#7463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_pm_d=
c@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@kms_pm_dc@deep-pkgc=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2505">Intel XE#2505</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7447">Intel XE#7447</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_r=
pm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bm=
g-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE=
#7383</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
836">Intel XE#836</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-2/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">=
Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@kms_pm_r=
pm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/i=
gt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel =
XE#7383</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6813">Intel XE#6813</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@kms_pm_rpm@packag=
e-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6813">Intel XE#6813</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7470">Intel XE#7470</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6814">Intel XE#6814</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@kms_pm_rpm@packag=
e-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7428">Intel XE#7428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@kms_psr2=
_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-l=
nl-1/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE=
#2893</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7304">Intel XE#7304</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@kms_psr2=
_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7413">Intel XE#7413</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@kms_psr2=
_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@kms_psr@=
fbc-psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) +11 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@kms_psr_=
stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sha=
rd-bmg-1/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">=
Intel XE#2414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7446">Intel XE#7446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shar=
d-lnl-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">In=
tel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7342">Intel XE#7342</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-6/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bm=
g-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/74=
01">Intel XE#7401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#112=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7401=
">Intel XE#7401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard=
-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Inte=
l XE#3904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7342">Intel XE#7342</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard=
-lnl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Int=
el XE#362</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7420">Intel XE#7420</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sha=
rd-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">=
Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7420">Intel XE#7420</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@kms_tv_loa=
d_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/330">Intel XE#330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7440">Intel XE#7440</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7440">Intel XE#7440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@kms_vrr@=
lobf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2168">Intel XE#2168</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@kms_vrr@lobf.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Int=
el XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7444">Intel XE#7444</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@kms_vrr@=
lobf@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6390">Intel XE#6390</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@kms_vrr@lobf@=
pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6390">Intel XE#6390</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7461">Intel XE#7461</a>) +1 other test fail<=
/li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_compu=
te@ccs-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_compute@cc=
s-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1447">Intel XE#1447</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7471">Intel XE#7471</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_compu=
te@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_c=
ompute@ccs-mode-compute-kernel.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7469">Intel XE#7469</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_compu=
te@eu-busy-10s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6592">Intel XE#6592</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe=
_compute@eu-busy-10s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6592">Intel XE#6592</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6645">Intel XE#6645</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7391">Intel XE#7391</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_compu=
te_preempt@compute-preempt-many-vram-evict.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7316">Intel XE=
#7316</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-162448v1/shard-lnl-3/igt@xe_compute_preempt@compute-preempt-many-vram-evic=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5191">Intel XE#5191</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7316">Intel XE#7316</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7346">Intel XE#7346</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_confi=
gfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6010">Intel XE#6010</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7317">Intel XE#7317</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-=
4/igt@xe_configfs@survivability-mode.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6010">Intel XE#6010</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7317">Intel XE#7317=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7455"=
>Intel XE#7455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_creat=
e@create-big-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7318">Intel XE#7318</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-3/ig=
t@xe_create@create-big-vram.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7318">Intel XE#7318</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7457">Intel XE#=
7457</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shar=
d-lnl-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350"=
>Intel XE#7350</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sh=
ard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#250=
4</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319=
">Intel XE#7319</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_eudeb=
ug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1=
/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320">Intel XE#7320</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464">In=
tel XE#7464</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_eudeb=
ug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_eudebug_=
sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4518">Intel XE#4518</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7404">Intel XE#7404</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_exec_=
basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-1/ig=
t@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#=
7372</a>) +42 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_media=
_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/560">Intel XE#560</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe=
_media_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/560">Intel XE#560</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a=
>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_media=
_fill@media-fill.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7321">Intel XE#7321</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/sh=
ard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#259=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321=
">Intel XE#7321</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_mmap@=
pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#7322</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-8/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322">Intel XE#732=
2</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408=
">Intel XE#7408</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/512">Intel XE#512</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7323">Intel XE#7323</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_mmap@s=
mall-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/512">Intel XE#512</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_mmap@=
small-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/586">Intel XE#586</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7323">Intel XE#7323</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_mmap@s=
mall-bar.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/586">Intel XE#586</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-l=
nl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/sha=
rd-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b=
/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800=
720b/shard-lnl-8/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423=
f800720b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6c=
d423f800720b/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f81=
2f6cd423f800720b/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f8=
8f812f6cd423f800720b/shard-lnl-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f=
26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333=
fe9f26f88f812f6cd423f800720b/shard-lnl-4/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee845=
7333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658e=
e8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-=
658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-=
lnl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/sh=
ard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720=
b/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
448v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
448v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
448v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-2/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
448v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162=
448v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl=
-7/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_modu=
le_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800=
720b/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423=
f800720b/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6c=
d423f800720b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f81=
2f6cd423f800720b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f8=
8f812f6cd423f800720b/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f=
26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333=
fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658ee845=
7333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-658e=
e8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4643-=
658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-=
bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720=
b/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62448v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62448v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62448v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/shard-bmg-1/igt@xe_module_load@load.html">SKIP</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62448v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
62448v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-162448v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong@basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-6/igt@xe_noexe=
c_ping_pong@basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7324">Intel XE#7324</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/ig=
t@xe_noexec_ping_pong@basic.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/6259">Intel XE#6259</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7324">Intel XE#7324</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7406">Intel XE#=
7406</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@x=
e_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393=
</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_oa@oa=
-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-2/igt@x=
e_oa@oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2248">Intel XE#2248</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7325">Intel XE#7325</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7393">Intel XE#7393=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-8/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7326">Intel XE#7326</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-7/igt@xe_peer=
2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) +1 othe=
r test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg=
-1/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#732=
6</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353=
">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) +7 other =
tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-1/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-6/igt@xe_pm@d3cold-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-3/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-3/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5694">Intel XE#5694</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-7/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_pm@d3cold-mocs.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7328">Intel XE#7328</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/igt@xe_pm@d3h=
ot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-8/igt@xe_pm@d3=
hot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7328">Intel XE#7328</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-3/igt@xe_pm@d3h=
ot-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5742">Intel XE#5742</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_pm@s3=
-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/584">Intel XE#584</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-162448v1/shard-lnl-6/igt@xe_pm@s3-mocs.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Inte=
l XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/7369">Intel XE#7369</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-2/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-5/ig=
t@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#=
7456</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bmg-4/ig=
t@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7329">Intel XE#7329</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7456">Intel XE#=
7456</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_pmu@a=
ll-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-1/igt@xe_p=
mu@all-fn-engine-activity-load.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7347">Intel XE#7347</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-bmg-9/igt@xe_pxp@p=
xp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-bm=
g-4/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4=
733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/74=
17">Intel XE#7417</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-1/igt@xe_sriov=
_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-8/=
igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Inte=
l XE#7366</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-7/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-=
1/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7357"=
>Intel XE#7357</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-beyond:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_sriov=
_vram@vf-access-beyond.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-lnl-=
6/igt@xe_sriov_vram@vf-access-beyond.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330">Intel XE#7330=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422"=
>Intel XE#7422</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@i2c-functionality:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b/shard-lnl-5/igt@xe_survi=
vability@i2c-functionality.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6529">Intel XE#6529</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7331">Intel XE#7331</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162448v1/shard-=
lnl-6/igt@xe_survivability@i2c-functionality.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/6529">Intel XE#6529</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7331">Intel =
XE#7331</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7388">Intel XE#7388</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b -&gt; xe-pw-162=
448v1</li>
</ul>
<p>IGT_8776: 8776<br />
  xe-4643-658ee8457333fe9f26f88f812f6cd423f800720b: 658ee8457333fe9f26f88f8=
12f6cd423f800720b<br />
  xe-pw-162448v1: 162448v1</p>

</body>
</html>

--===============6758928768964333420==--
