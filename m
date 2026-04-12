Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0E2E937E4
	for <intel-xe@archiver.kernel.org>; Sun, 12 Apr 2026 13:01:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5F7310E032;
	Sun, 12 Apr 2026 13:01:56 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC3F10E032;
 Sun, 12 Apr 2026 13:01:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2967026170660097908=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_CMTG_enablement_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Animesh Manna" <animesh.manna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 12 Apr 2026 13:01:55 -0000
Message-ID: <177599891568.454552.17343199385288432091@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260412103712.4021213-1-animesh.manna@intel.com>
In-Reply-To: <20260412103712.4021213-1-animesh.manna@intel.com>
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

--===============2967026170660097908==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CMTG enablement (rev5)
URL   : https://patchwork.freedesktop.org/series/157663/
State : failure

== Summary ==

CI Bug Log - changes from xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb_FULL -> xe-pw-157663v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-157663v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-157663v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-157663v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  
Known issues
------------

  Here are the changes found in xe-pw-157663v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367] / [Intel XE#7354])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652]) +8 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1424])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_cursor_crc@cursor-onscreen-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2320])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#7571])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1340] / [Intel XE#7435])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4354] / [Intel XE#7386])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301]) +3 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#7545])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible@d-dp2:
    - shard-bmg:          [PASS][20] -> [ABORT][21] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7200]) +3 other tests abort
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-9/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible@d-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7178] / [Intel XE#7351])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2311]) +5 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#6312] / [Intel XE#651])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4141])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#656]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +6 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7283])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7283])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#5021] / [Intel XE#7377])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#7340])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#3309] / [Intel XE#7368])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1489]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1127] / [Intel XE#5813])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2330] / [Intel XE#5813])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3904] / [Intel XE#7342])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1499])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-access-parameters-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7636])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_eudebug@basic-vm-access-parameters-faultable.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#7636]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#6540] / [Intel XE#688])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][44] -> [INCOMPLETE][45] ([Intel XE#6321])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2322] / [Intel XE#7372])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7136]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7136]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#6874]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6874])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7138])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#6964])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#4733] / [Intel XE#7417])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#4130] / [Intel XE#7366])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][55] ([Intel XE#5545])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][56] ([Intel XE#7725]) -> [PASS][57] +11 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [SKIP][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_color@deep-color.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_color@deep-color.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [SKIP][60] ([Intel XE#2291] / [Intel XE#7343]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [DMESG-WARN][62] -> [PASS][63] +7 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_flip@2x-blocking-wf_vblank.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][64] ([Intel XE#1503]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_vblank@wait-idle@pipe-d-dp-2:
    - shard-bmg:          [FAIL][66] -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_vblank@wait-idle@pipe-d-dp-2.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_vblank@wait-idle@pipe-d-dp-2.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [ABORT][68] ([Intel XE#7200]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][70] ([Intel XE#5625]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-lnl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [ABORT][72] ([Intel XE#7578]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][74] ([Intel XE#2312]) -> [SKIP][75] ([Intel XE#4141])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][76] ([Intel XE#2312]) -> [SKIP][77] ([Intel XE#2311])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][78] ([Intel XE#2312]) -> [SKIP][79] ([Intel XE#2313])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][80] ([Intel XE#3544]) -> [SKIP][81] ([Intel XE#3374] / [Intel XE#3544])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][82] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][83] ([Intel XE#1729] / [Intel XE#7424])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][84] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][85] ([Intel XE#2509] / [Intel XE#7437])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [SKIP][111]) ([Intel XE#2457] / [Intel XE#7405]) -> ([DMESG-WARN][112], [DMESG-WARN][113], [DMESG-WARN][114], [DMESG-WARN][115], [DMESG-WARN][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [SKIP][136], [PASS][137]) ([Intel XE#2457] / [Intel XE#7405] / [Intel XE#7725])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-10/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-2/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-9/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-9/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-10/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-7/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-10/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-9/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-7/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-7/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-2/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-1/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-10/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-10/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-3/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-3/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-9/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-9/igt@xe_module_load@load.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7545
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7725


Build changes
-------------

  * Linux: xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb -> xe-pw-157663v5

  IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb: afe01cbdd453cb1b141b29ea6153f64ef0f151fb
  xe-pw-157663v5: 157663v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/index.html

--===============2967026170660097908==
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
<tr><td><b>Series:</b></td><td>CMTG enablement (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/157663/">https://patchwork.freedesktop.org/series/157663/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-157663v5/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-157663v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4887-afe01cbdd453cb1b141b29ea6153f64ef=
0f151fb_FULL -&gt; xe-pw-157663v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-157663v5_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-157663v5_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1576=
63v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157663v5_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_big_fb@linear-16bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_bw@linear-tiling-2-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-st=
orm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_content_protection@atomic=
-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_cursor_crc@cursor-onscree=
n-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_cursor_crc@cursor-onscree=
n-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_cursor_le=
gacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6=
bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-lnl-5/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other =
tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7545">Intel XE#7545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible@d-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-9/igt@kms_flip=
@flip-vs-panning-interruptible@d-dp2.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@kms_flip=
@flip-vs-panning-interruptible@d-dp2.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200"=
>Intel XE#7200</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-downsc=
aling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-downscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel =
XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tes=
ts skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5021">Intel XE#5021</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-lnl-1/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel X=
E#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_pm_dc@dc5-retention-flops=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3309">Intel XE#3309</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_rotation_crc@sprite-rotat=
ion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-dr=
rs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_eudebug@basic-vm-access-pa=
rameters-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_eudebug_online@set-breakpo=
int-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_evict@evict-beng-large-cm.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-2/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_basic@multigpu-once-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_multi_queue@few-execs=
-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-rebind:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_exec_threads@threads-multi=
-queue-mixed-shared-vm-userptr-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_multigpu_svm@mgpu-latency-=
copy-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-src-to-pxp-dest-rendercopy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_pxp@pxp-src-to-pxp-dest-re=
ndercopy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-lnl-4/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_atom=
ic@crtc-invalid-params-fence@pipe-a-dp-2.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/=
shard-bmg-8/igt@kms_atomic@crtc-invalid-params-fence@pipe-a-dp-2.html">PASS=
</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_colo=
r@deep-color.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@kms_color@deep-color.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5=
/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_flip=
@2x-blocking-wf_vblank.html">DMESG-WARN</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_flip@2x-bloc=
king-wf_vblank.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_vbla=
nk@wait-idle@pipe-d-dp-2.html">FAIL</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@kms_vblank@wait-idle=
@pipe-d-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_eng=
ine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_compu=
te_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compu=
te.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7200">Intel XE#7200</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_compute_preempt@compute-=
preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +=
1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-lnl-3/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#=
5625</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157663v5/shard-lnl-5/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-1/igt@xe_fault=
_injection@inject-fault-probe-function-xe_pcode_probe_early.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Inte=
l XE#7578</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-157663v5/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_pcode_probe_early.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1576=
63v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
157663v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-s=
hrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5=
/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-10/igt@kms_hdr=
@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-3/igt@kms_hdr@br=
ightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shar=
d-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-157663v5/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-10/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-=
bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/sh=
ard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151f=
b/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f=
151fb/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64=
ef0f151fb/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea61=
53f64ef0f151fb/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b2=
9ea6153f64ef0f151fb/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b=
141b29ea6153f64ef0f151fb/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453=
cb1b141b29ea6153f64ef0f151fb/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbd=
d453cb1b141b29ea6153f64ef0f151fb/shard-bmg-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe0=
1cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4887-=
afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4=
887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-3/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-8/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/shard-=
bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151f=
b/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f=
151fb/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-157663v5/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-157663v5/shard-bmg-6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-=
6/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-1/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-157663v5/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-10/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157663v5/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-7/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157663v5/shard-bmg-3/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157663v5/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-8/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157663v5/shard-bmg-2/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-157663v5/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-5/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-157663v5/shard-bmg-9/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/sh=
ard-bmg-1/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-157663v5/shard-bmg-9/igt@xe_module_load@l=
oad.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7405">Intel XE#7405</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7725">Intel XE#7725</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb -&gt; xe-pw-157=
663v5</li>
</ul>
<p>IGT_8854: 93abaf0170728f69bc27577e5b405f7a2a01b6fd @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-4887-afe01cbdd453cb1b141b29ea6153f64ef0f151fb: afe01cbdd453cb1b141b29e=
a6153f64ef0f151fb<br />
  xe-pw-157663v5: 157663v5</p>

</body>
</html>

--===============2967026170660097908==--
