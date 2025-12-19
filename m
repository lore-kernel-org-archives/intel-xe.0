Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CA6D78783
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 14:56:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FA210E719;
	Fri, 19 Dec 2025 14:56:03 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CED910E719;
 Fri, 19 Dec 2025 14:56:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0234052470041738039=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_Dynamic_drm=5Fpagemaps_and?=
 =?utf-8?q?_Initial_multi-device_SVM_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 14:56:02 -0000
Message-ID: <176615616243.107060.16194456279094693368@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20251218162101.605379-1-thomas.hellstrom@linux.intel.com>
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

--===============0234052470041738039==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Dynamic drm_pagemaps and Initial multi-device SVM (rev6)
URL   : https://patchwork.freedesktop.org/series/156525/
State : success

== Summary ==

CI Bug Log - changes from xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0_FULL -> xe-pw-156525v6_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-156525v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][1] -> [SKIP][2] ([Intel XE#6779])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#6815])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html

  * igt@fbdev@read:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#2134])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@fbdev@read.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_audio@hdmi-audio:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#1178]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-sliding-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2291])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#4633])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2293] / [Intel XE#2380])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2293]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
    - shard-bmg:          [PASS][21] -> [ABORT][22] ([Intel XE#6740]) +3 other tests abort
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#5021])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#6693])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#1406] / [Intel XE#1489])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1406] / [Intel XE#6703]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2330])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#4227]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-bmg:          NOTRUN -> [ABORT][32] ([Intel XE#6740])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@testdisplay.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#6599])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4837] / [Intel XE#6665])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#6557] / [Intel XE#6703]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6703]) +178 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6874]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4943])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6557] / [Intel XE#6703]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#6251]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          [PASS][43] -> [SKIP][44] ([Intel XE#6703]) +299 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_spin_batch@spin-all.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [SKIP][45] ([Intel XE#6779]) -> [PASS][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][47] ([Intel XE#6914]) -> [PASS][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@fbdev@info:
    - shard-bmg:          [SKIP][49] ([Intel XE#2134]) -> [PASS][50] +1 other test pass
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@fbdev@info.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@fbdev@info.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [SKIP][51] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][53] ([Intel XE#2316]) -> [PASS][54] +1 other test pass
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][55] ([Intel XE#6693]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][57] ([Intel XE#4459]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][59] ([Intel XE#2142]) -> [PASS][60] +1 other test pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [SKIP][61] ([Intel XE#6703]) -> [PASS][62] +505 other tests pass
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][63] ([Intel XE#5625]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:
    - shard-bmg:          [SKIP][65] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][66] +5 other tests pass
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [SKIP][67] ([Intel XE#2229]) -> [PASS][68] +1 other test pass
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@xe_live_ktest@xe_bo.html

  * igt@xe_module_load@reload:
    - shard-bmg:          [FAIL][69] ([Intel XE#6913]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_module_load@reload.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][71] ([Intel XE#2327]) -> [SKIP][72] ([Intel XE#6703]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][73] ([Intel XE#6703]) -> [SKIP][74] ([Intel XE#2327]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][75] ([Intel XE#610]) -> [SKIP][76] ([Intel XE#6703])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][77] ([Intel XE#6703]) -> [SKIP][78] ([Intel XE#1124]) +6 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][79] ([Intel XE#1124]) -> [SKIP][80] ([Intel XE#6703]) +4 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          [SKIP][81] ([Intel XE#6703]) -> [SKIP][82] ([Intel XE#2328])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][83] ([Intel XE#6703]) -> [SKIP][84] ([Intel XE#607])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][85] ([Intel XE#6703]) -> [SKIP][86] ([Intel XE#367]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][87] ([Intel XE#367]) -> [SKIP][88] ([Intel XE#6703]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][89] ([Intel XE#6703]) -> [SKIP][90] ([Intel XE#2652] / [Intel XE#787])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][91] ([Intel XE#6703]) -> [SKIP][92] ([Intel XE#3432])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][93] ([Intel XE#2887]) -> [SKIP][94] ([Intel XE#6703]) +9 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][95] ([Intel XE#6703]) -> [SKIP][96] ([Intel XE#2887]) +12 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][97] ([Intel XE#2724]) -> [SKIP][98] ([Intel XE#6703])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_cdclk@plane-scaling.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#2325])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          [SKIP][101] ([Intel XE#2325]) -> [SKIP][102] ([Intel XE#6703])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_chamelium_color@gamma.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#2252]) +9 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          [SKIP][105] ([Intel XE#2252]) -> [SKIP][106] ([Intel XE#6703]) +3 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][107] ([Intel XE#1178]) -> [SKIP][108] ([Intel XE#6703])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [SKIP][109] ([Intel XE#6703]) -> [FAIL][110] ([Intel XE#1178]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_content_protection@suspend-resume.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_content_protection@suspend-resume.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#2320]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][113] ([Intel XE#2321]) -> [SKIP][114] ([Intel XE#6703]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2321])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][117] ([Intel XE#6703]) -> [SKIP][118] ([Intel XE#2286])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][119] ([Intel XE#2244]) -> [SKIP][120] ([Intel XE#6703])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_dsc@dsc-with-bpc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#4156])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#2372])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_feature_discovery@chamelium.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#2373])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][127] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][128] ([Intel XE#6703]) +2 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][131] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][132] ([Intel XE#2293] / [Intel XE#2380])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][133] ([Intel XE#2312]) -> [SKIP][134] ([Intel XE#2311]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#6703]) -> [SKIP][136] ([Intel XE#2311]) +23 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][137] ([Intel XE#2311]) -> [SKIP][138] ([Intel XE#2312]) +3 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#4141]) +13 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][141] ([Intel XE#4141]) -> [SKIP][142] ([Intel XE#6703]) +8 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][143] ([Intel XE#2312]) -> [SKIP][144] ([Intel XE#4141])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][145] ([Intel XE#4141]) -> [SKIP][146] ([Intel XE#2312]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][147] ([Intel XE#2311]) -> [SKIP][148] ([Intel XE#6703]) +11 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          [SKIP][149] ([Intel XE#2311]) -> [SKIP][150] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][151] ([Intel XE#2313]) -> [SKIP][152] ([Intel XE#6703]) +17 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][153] ([Intel XE#2312]) -> [SKIP][154] ([Intel XE#2313]) +2 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][155] ([Intel XE#2313]) -> [SKIP][156] ([Intel XE#2312]) +3 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][157] ([Intel XE#6557] / [Intel XE#6703]) -> [SKIP][158] ([Intel XE#2313])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][159] ([Intel XE#6703]) -> [SKIP][160] ([Intel XE#2313]) +25 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][161] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][162] ([Intel XE#6703])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#1503])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][165] ([Intel XE#6703]) -> [SKIP][166] ([Intel XE#2925])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][167] ([Intel XE#5020]) -> [SKIP][168] ([Intel XE#6703])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [SKIP][170] ([Intel XE#870])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][171] ([Intel XE#6703]) -> [SKIP][172] ([Intel XE#2938])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][173] ([Intel XE#870]) -> [SKIP][174] ([Intel XE#6703])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][175] ([Intel XE#6693]) -> [SKIP][176] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) +1 other test skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][177] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [SKIP][178] ([Intel XE#6693])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][179] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][180] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][181] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][182] ([Intel XE#1406] / [Intel XE#1489]) +10 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][183] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][184] ([Intel XE#1406] / [Intel XE#6703])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][185] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][186] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          [SKIP][187] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][188] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][189] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][190] ([Intel XE#6703]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][191] ([Intel XE#6703]) -> [SKIP][192] ([Intel XE#2330])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          [SKIP][193] ([Intel XE#6703]) -> [SKIP][194] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][195] ([Intel XE#1435]) -> [SKIP][196] ([Intel XE#6703])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-formats:
    - shard-bmg:          [SKIP][197] ([Intel XE#6703]) -> [SKIP][198] ([Intel XE#6503]) +2 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_sharpness_filter@filter-formats.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          [SKIP][199] ([Intel XE#6503]) -> [SKIP][200] ([Intel XE#6703])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][201] ([Intel XE#2426]) -> [FAIL][202] ([Intel XE#1729])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          [SKIP][203] ([Intel XE#6703]) -> [SKIP][204] ([Intel XE#2168])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_vrr@cmrr.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][205] ([Intel XE#1499]) -> [SKIP][206] ([Intel XE#6703]) +1 other test skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][207] ([Intel XE#6703]) -> [SKIP][208] ([Intel XE#1499])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][209] ([Intel XE#2504]) -> [SKIP][210] ([Intel XE#6703])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][211] ([Intel XE#6703]) -> [SKIP][212] ([Intel XE#4837]) +6 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@vma-ufence:
    - shard-bmg:          [SKIP][213] ([Intel XE#4837]) -> [SKIP][214] ([Intel XE#6703]) +4 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_eudebug@vma-ufence.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_eudebug@vma-ufence.html

  * igt@xe_eudebug_online@interrupt-all:
    - shard-bmg:          [SKIP][215] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][216] ([Intel XE#6703]) +1 other test skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_eudebug_online@interrupt-all.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_eudebug_online@interrupt-all.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][217] ([Intel XE#6703]) -> [SKIP][218] ([Intel XE#4837] / [Intel XE#6665]) +4 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          [SKIP][219] ([Intel XE#6703]) -> [SKIP][220] ([Intel XE#5793])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][221] ([Intel XE#2322]) -> [SKIP][222] ([Intel XE#6703]) +5 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-bmg:          [SKIP][223] ([Intel XE#6703]) -> [SKIP][224] ([Intel XE#2322]) +5 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          [SKIP][225] ([Intel XE#6703]) -> [SKIP][226] ([Intel XE#6874]) +26 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][227] ([Intel XE#6874]) -> [SKIP][228] ([Intel XE#6703]) +14 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          [SKIP][229] ([Intel XE#5007]) -> [SKIP][230] ([Intel XE#6703])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-huge.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][231] ([Intel XE#6703]) -> [SKIP][232] ([Intel XE#4943]) +17 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-huge:
    - shard-bmg:          [SKIP][233] ([Intel XE#4943]) -> [SKIP][234] ([Intel XE#6703]) +13 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][235] ([Intel XE#5466]) -> [SKIP][236] ([Intel XE#6703])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-bmg:          [SKIP][237] ([Intel XE#6703]) -> [SKIP][238] ([Intel XE#2248])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][239] ([Intel XE#6703]) -> [SKIP][240] ([Intel XE#1420])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][241] ([Intel XE#6703]) -> [SKIP][242] ([Intel XE#5694])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pm@d3cold-i2c.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][243] ([Intel XE#2284]) -> [SKIP][244] ([Intel XE#6703])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_pm@d3cold-mocs.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-bmg:          [SKIP][245] ([Intel XE#6703]) -> [SKIP][246] ([Intel XE#2284])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          [SKIP][247] ([Intel XE#6703]) -> [SKIP][248] ([Intel XE#4733]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][249] ([Intel XE#4733]) -> [SKIP][250] ([Intel XE#6703]) +1 other test skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][251] ([Intel XE#6703]) -> [SKIP][252] ([Intel XE#944]) +3 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6815]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6913]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913
  [Intel XE#6914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0 -> xe-pw-156525v6

  IGT_8673: 8673
  xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0: 4f05611959c286b9eb7d33eb7043762901b9fae0
  xe-pw-156525v6: 156525v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/index.html

--===============0234052470041738039==
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
<tr><td><b>Series:</b></td><td>Dynamic drm_pagemaps and Initial multi-device SVM (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156525/">https://patchwork.freedesktop.org/series/156525/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0_FULL -&gt; xe-pw-156525v6_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-156525v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@core_hotunplug@hotunplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@device_reset@unbind-reset-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6815">Intel XE#6815</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_chamelium_audio@hdmi-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-10/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +3 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +178 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_system_allocator@many-large-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_video_enhance0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_spin_batch@spin-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +299 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6914">Intel XE#6914</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@fbdev@info.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_system_allocator@many-large-execqueues-new-race-nomemset.html">PASS</a> +505 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-prefetch.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_module_load@reload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6913">Intel XE#6913</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_module_load@reload.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_sharpness_filter@filter-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_eudebug@vma-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_eudebug_online@interrupt-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793">Intel XE#5793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-3/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-9/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-2/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-7/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156525v6/shard-bmg-3/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0 -&gt; xe-pw-156525v6</li>
</ul>
<p>IGT_8673: 8673<br />
  xe-4266-4f05611959c286b9eb7d33eb7043762901b9fae0: 4f05611959c286b9eb7d33eb7043762901b9fae0<br />
  xe-pw-156525v6: 156525v6</p>

</body>
</html>

--===============0234052470041738039==--
