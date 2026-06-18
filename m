Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17ECBCD98E4
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jun 2026 02:02:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A540510E77B;
	Thu, 18 Jun 2026 02:02:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CF4F10E728;
 Thu, 18 Jun 2026 02:02:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5802595842404958078=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Return_error_on_?=
 =?utf-8?q?non-migratable_faults_requiring_devmem?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Jun 2026 02:02:13 -0000
Message-ID: <178174813311.91713.7863222393867583753@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617135101.1245574-1-matthew.brost@intel.com>
In-Reply-To: <20260617135101.1245574-1-matthew.brost@intel.com>
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

--===============5802595842404958078==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Return error on non-migratable faults requiring devmem
URL   : https://patchwork.freedesktop.org/series/168716/
State : failure

== Summary ==

CI Bug Log - changes from xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b_FULL -> xe-pw-168716v1_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-168716v1_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168716v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168716v1_FULL:

### IGT changes ###

#### Warnings ####

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][1] ([Intel XE#7339]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html

  
Known issues
------------

  Here are the changes found in xe-pw-168716v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2325] / [Intel XE#7358])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2252])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#7642])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_content_protection@lic-type-1.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#7571])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@torture-bo:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#6819] / [Intel XE#8151])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-9/igt@kms_cursor_legacy@torture-bo.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_cursor_legacy@torture-bo.html

  * igt@kms_cursor_legacy@torture-bo@pipe-a:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] ([Intel XE#6819])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-9/igt@kms_cursor_legacy@torture-bo@pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_cursor_legacy@torture-bo@pipe-a.html

  * igt@kms_cursor_legacy@torture-bo@pipe-b:
    - shard-bmg:          [PASS][14] -> [INCOMPLETE][15] ([Intel XE#8151])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-9/igt@kms_cursor_legacy@torture-bo@pipe-b.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_cursor_legacy@torture-bo@pipe-b.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7179])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4141]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2313]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7061])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#7915]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][26] -> [ABORT][27] ([Intel XE#8300]) +1 other test abort
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7794])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1489]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr2-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_psr@psr2-suspend.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#6361]) +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_eudebug@discovery-race-vmbind:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7636]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_eudebug@discovery-race-vmbind.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7136])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#6874]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7138]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_mmap@small-bar.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7590])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#944])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][41] ([Intel XE#5545])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][42] ([Intel XE#3098]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][44] ([Intel XE#3149] / [Intel XE#3321]) -> [PASS][45] +1 other test pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][46] ([Intel XE#301]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][48] ([Intel XE#2142]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][50] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][52] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][53] ([Intel XE#309] / [Intel XE#7343])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][54] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][55] ([Intel XE#2509] / [Intel XE#7437])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7339
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b -> xe-pw-168716v1

  IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b: 1f1e03ee0c160129c336e9301aeed557f406153b
  xe-pw-168716v1: 168716v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/index.html

--===============5802595842404958078==
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
<tr><td><b>Series:</b></td><td>drm/xe: Return error on non-migratable faults requiring devmem</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168716/">https://patchwork.freedesktop.org/series/168716/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b_FULL -&gt; xe-pw-168716v1_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-168716v1_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-168716v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-168716v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_dc@dc3co-vpb-simulation:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7339">Intel XE#7339</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-5/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168716v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-9/igt@kms_cursor_legacy@torture-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_cursor_legacy@torture-bo.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-9/igt@kms_cursor_legacy@torture-bo@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_cursor_legacy@torture-bo@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-bo@pipe-b:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-9/igt@kms_cursor_legacy@torture-bo@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_cursor_legacy@torture-bo@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-1/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-7/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4@pipe-a-dp-2-pipe-c-hdmi-a-3.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8300">Intel XE#8300</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-8/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-race-vmbind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_eudebug@discovery-race-vmbind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@kms_flip@2x-blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_flip@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-5/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b -&gt; xe-pw-168716v1</li>
</ul>
<p>IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b: 1f1e03ee0c160129c336e9301aeed557f406153b<br />
  xe-pw-168716v1: 168716v1</p>

</body>
</html>

--===============5802595842404958078==--
