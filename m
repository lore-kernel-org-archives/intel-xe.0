Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41116CAC58E
	for <intel-xe@archiver.kernel.org>; Thu, 11 Sep 2025 17:55:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1E5E10E3D5;
	Thu, 11 Sep 2025 17:55:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0AF10EB78;
 Thu, 11 Sep 2025 17:54:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3883301501056355809=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Fix_driver_refer?=
 =?utf-8?q?ence_in_FLR_comment_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Sep 2025 17:54:59 -0000
Message-ID: <175761329967.326696.7712153096329496696@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250911110202.810715-1-varun.gupta@intel.com>
In-Reply-To: <20250911110202.810715-1-varun.gupta@intel.com>
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

--===============3883301501056355809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix driver reference in FLR comment (rev2)
URL   : https://patchwork.freedesktop.org/series/154369/
State : failure

== Summary ==

CI Bug Log - changes from xe-3724-f251150579f93807f196c33b8716f14c1fd136e6_FULL -> xe-pw-154369v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-154369v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-154369v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-154369v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_threads@threads-fd-userptr-invalidate-race:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_exec_threads@threads-fd-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap:
    - shard-bmg:          [INCOMPLETE][3] ([Intel XE#4842]) -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode}:
    - shard-dg2-set2:     [SKIP][5] ([Intel XE#4208]) -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  
Known issues
------------

  Here are the changes found in xe-pw-154369v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] ([Intel XE#4208])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@core_setmaster@master-drop-set-user.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] ([Intel XE#2134])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@fbdev@write.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@fbdev@write.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#4543])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][13] -> [DMESG-WARN][14] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][15] -> [SKIP][16] ([Intel XE#2314] / [Intel XE#2894])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +125 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][18] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#2907])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#373]) +3 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#1188])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#1188])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2291]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#2373])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_feature_discovery@display-2x.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#2316]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301]) +3 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#4543])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#455]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][36] -> [SKIP][37] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#651]) +7 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2351] / [Intel XE#4208])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#653]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-bmg:          [PASS][41] -> [SKIP][42] ([Intel XE#1503])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_hdr@invalid-metadata-sizes.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-cursor-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-8/igt@kms_psr@fbc-psr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr@psr-basic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#1435])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1729])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#2168])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_vrr@lobf.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1280] / [Intel XE#455])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1123])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0xfd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1126])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfd.html

  * igt@xe_eudebug_online@interrupt-other-debuggable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#4837]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_eudebug_online@interrupt-other-debuggable.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][55] -> [SKIP][56] ([Intel XE#1392]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#288]) +4 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@xe_exec_fault_mode@many-basic-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#3876])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_exec_reset@parallel-gt-reset.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#4915]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#4915]) +36 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - shard-adlp:         [PASS][62] -> [DMESG-FAIL][63] ([Intel XE#3876]) +1 other test dmesg-fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2229] / [Intel XE#455]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_live_ktest@xe_bo.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-dg2-set2:     [PASS][66] -> [SKIP][67] ([Intel XE#2229])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#3573])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_oa@rc6-disable.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][69] ([Intel XE#1173])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [PASS][70] -> [DMESG-FAIL][71] ([Intel XE#5545])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_pm@s2idle-basic.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#4208]) +187 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#4733])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#944])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#4273])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#4208]) +31 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_vm@invalid-extensions.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-dg2-set2:     [FAIL][78] ([Intel XE#4208]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@core_getversion@all-cards.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@core_getversion@all-cards.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [SKIP][80] ([Intel XE#2134]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@fbdev@read.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@fbdev@read.html

  * {igt@kms_async_flips@async-flip-hang}:
    - shard-adlp:         [DMESG-WARN][82] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][83] +2 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-3/igt@kms_async_flips@async-flip-hang.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-9/igt@kms_async_flips@async-flip-hang.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][84] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][85] +6 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][86] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][88] ([Intel XE#3124]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][90] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][91]
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][92] ([Intel XE#2291]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][94] ([Intel XE#5299]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][96] ([Intel XE#2316]) -> [PASS][97] +6 other tests pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][98] ([Intel XE#4543]) -> [PASS][99] +1 other test pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-3/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-8/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@c-dp4:
    - shard-dg2-set2:     [INCOMPLETE][100] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-463/igt@kms_flip@flip-vs-suspend@c-dp4.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [SKIP][102] ([Intel XE#4208]) -> [PASS][103] +198 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][104] ([Intel XE#1503]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_hdr@static-toggle.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [SKIP][106] ([Intel XE#1499]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_vrr@negative-basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_vrr@negative-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-dg2-set2:     [SKIP][108] ([Intel XE#1392]) -> [PASS][109] +1 other test pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * {igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:
    - shard-bmg:          [WARN][110] ([Intel XE#5786]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [DMESG-WARN][112] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4504]) -> [PASS][113]
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][114] ([Intel XE#4543]) -> [DMESG-WARN][115] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     [SKIP][116] ([Intel XE#455]) -> [SKIP][117] ([Intel XE#4208]) +6 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][118] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][119] ([Intel XE#316])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][120] ([Intel XE#4208]) -> [SKIP][121] ([Intel XE#316]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][122] ([Intel XE#316]) -> [SKIP][123] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][124] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][125] ([Intel XE#1124]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][126] ([Intel XE#1124]) -> [SKIP][127] ([Intel XE#4208]) +6 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#4208]) -> [SKIP][129] ([Intel XE#1124]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][130] ([Intel XE#1124]) -> [SKIP][131] ([Intel XE#2351] / [Intel XE#4208])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][132] ([Intel XE#4208]) -> [SKIP][133] ([Intel XE#2191])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][134] ([Intel XE#2191]) -> [SKIP][135] ([Intel XE#4208])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][136] ([Intel XE#4208]) -> [SKIP][137] ([Intel XE#367])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][138] ([Intel XE#367]) -> [SKIP][139] ([Intel XE#4208]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][140] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][141] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][142] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][143] ([Intel XE#4208]) +6 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][144] ([Intel XE#4208]) -> [SKIP][145] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#4208]) -> [SKIP][147] ([Intel XE#2907])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][149] ([Intel XE#455] / [Intel XE#787])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][150] ([Intel XE#2351] / [Intel XE#4208]) -> [INCOMPLETE][151] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][152] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [SKIP][153] ([Intel XE#4208])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][154] ([Intel XE#373]) -> [SKIP][155] ([Intel XE#4208]) +7 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_chamelium_audio@dp-audio.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][156] ([Intel XE#306]) -> [SKIP][157] ([Intel XE#4208])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_chamelium_color@degamma.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#4208]) -> [SKIP][159] ([Intel XE#306]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_chamelium_color@gamma.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     [SKIP][160] ([Intel XE#4208]) -> [SKIP][161] ([Intel XE#373]) +5 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_chamelium_frames@dp-crc-fast.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][162] ([Intel XE#2341]) -> [FAIL][163] ([Intel XE#1178])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_content_protection@atomic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-dg2-set2:     [SKIP][164] ([Intel XE#307]) -> [SKIP][165] ([Intel XE#4208]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_content_protection@dp-mst-lic-type-0.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#4208]) -> [FAIL][167] ([Intel XE#1188])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_content_protection@uevent.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][168] ([Intel XE#2341]) -> [FAIL][169] ([Intel XE#1188])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_content_protection@uevent.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#4208]) -> [SKIP][171] ([Intel XE#308])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][172] ([Intel XE#308]) -> [SKIP][173] ([Intel XE#4208]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_dsc@dsc-basic:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][175] ([Intel XE#455])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_dsc@dsc-basic.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_dsc@dsc-basic.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#4208]) -> [SKIP][177] ([Intel XE#701])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_feature_discovery@chamelium.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][178] ([Intel XE#1135]) -> [SKIP][179] ([Intel XE#4208])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][180] ([Intel XE#4208]) -> [SKIP][181] ([Intel XE#455]) +3 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#455]) -> [SKIP][183] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#4208]) -> [SKIP][185] ([Intel XE#651]) +16 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][186] ([Intel XE#2311]) -> [SKIP][187] ([Intel XE#2312]) +9 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][188] ([Intel XE#2312]) -> [SKIP][189] ([Intel XE#2311]) +9 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][190] ([Intel XE#5390]) -> [SKIP][191] ([Intel XE#2312]) +4 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][192] ([Intel XE#2312]) -> [SKIP][193] ([Intel XE#5390]) +3 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][194] ([Intel XE#658]) -> [SKIP][195] ([Intel XE#2351] / [Intel XE#4208])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][196] ([Intel XE#651]) -> [SKIP][197] ([Intel XE#4208]) +15 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][199] ([Intel XE#651]) +3 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#651]) -> [SKIP][201] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][203] ([Intel XE#658])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#653]) -> [SKIP][205] ([Intel XE#4208]) +15 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][206] ([Intel XE#2312]) -> [SKIP][207] ([Intel XE#2313]) +7 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][209] ([Intel XE#653]) +5 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#653]) -> [SKIP][211] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][212] ([Intel XE#2313]) -> [SKIP][213] ([Intel XE#2312]) +12 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#4208]) -> [SKIP][215] ([Intel XE#653]) +14 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#4298]) -> [SKIP][217] ([Intel XE#4208])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#4208]) -> [SKIP][219] ([Intel XE#2927])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#4208]) -> [SKIP][221] ([Intel XE#2925])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][222] ([Intel XE#4596]) -> [SKIP][223] ([Intel XE#5021])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#4208]) -> [SKIP][225] ([Intel XE#5021])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-yf.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#870]) -> [SKIP][227] ([Intel XE#4208])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_pm_backlight@basic-brightness.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#4208]) -> [SKIP][229] ([Intel XE#2938])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_pm_backlight@brightness-with-dpms.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#4208]) -> [SKIP][231] ([Intel XE#1129])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][233] ([Intel XE#1406] / [Intel XE#4208]) +7 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][235] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][237] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_psr@fbc-psr-primary-page-flip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_psr@fbc-psr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][239] ([Intel XE#1406] / [Intel XE#4208]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][241] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][243] ([Intel XE#1406] / [Intel XE#2939])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1500]) -> [SKIP][245] ([Intel XE#4208])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#4208]) -> [SKIP][247] ([Intel XE#1280] / [Intel XE#455])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_compute_preempt@compute-threadgroup-preempt.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html

  * igt@xe_configfs@survivability-mode:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#6010]) -> [SKIP][249] ([Intel XE#4208])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_configfs@survivability-mode.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_configfs@survivability-mode.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#5626]) -> [SKIP][251] ([Intel XE#4208])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_eu_stall@invalid-event-report-count.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#4837]) -> [SKIP][253] ([Intel XE#4208]) +9 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_eudebug@vm-bind-clear-faultable.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#4208]) -> [SKIP][255] ([Intel XE#4837]) +7 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#4208]) -> [SKIP][257] ([Intel XE#1392]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1392]) -> [SKIP][259] ([Intel XE#4208]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#288]) -> [SKIP][261] ([Intel XE#4208]) +16 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#4208]) -> [SKIP][263] ([Intel XE#288]) +16 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#4208]) -> [SKIP][265] ([Intel XE#2360])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#4208]) -> [SKIP][267] ([Intel XE#4915]) +165 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#4915]) -> [SKIP][269] ([Intel XE#4208]) +169 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#4208]) -> [ABORT][271] ([Intel XE#4917])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          [ABORT][272] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530]) -> [ABORT][273] ([Intel XE#5466] / [Intel XE#5530])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208]) -> [SKIP][275] ([Intel XE#3573]) +4 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_oa@non-privileged-map-oa-buffer.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#3573]) -> [SKIP][277] ([Intel XE#4208]) +5 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_oa@oa-tlb-invalidate.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][279] ([Intel XE#4208])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][281] ([Intel XE#1173])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_peer2peer@write.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][283] ([Intel XE#4208]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#4208]) -> [SKIP][285] ([Intel XE#4733]) +2 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#4733]) -> [SKIP][287] ([Intel XE#4208]) +2 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#944]) -> [SKIP][289] ([Intel XE#4208]) +1 other test skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_query@multigpu-query-topology.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_query@multigpu-query-topology.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#4814]) -> [SKIP][291] ([Intel XE#4208])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208]) -> [SKIP][293] ([Intel XE#4130])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#3342]) -> [SKIP][295] ([Intel XE#4208])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_sriov_flr@flr-each-isolation.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#4208]) -> [SKIP][297] ([Intel XE#4273])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_sriov_flr@flr-twice.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#4351]) -> [SKIP][299] ([Intel XE#4208])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4842]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4842
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#6010]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6010
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * Linux: xe-3724-f251150579f93807f196c33b8716f14c1fd136e6 -> xe-pw-154369v2

  IGT_8534: 8534
  xe-3724-f251150579f93807f196c33b8716f14c1fd136e6: f251150579f93807f196c33b8716f14c1fd136e6
  xe-pw-154369v2: 154369v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/index.html

--===============3883301501056355809==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix driver reference in FLR comment =
(rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/154369/">https://patchwork.freedesktop.org/series/154369/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154369v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-154369v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3724-f251150579f93807f196c33b8716f14c1=
fd136e6_FULL -&gt; xe-pw-154369v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-154369v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-154369v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1543=
69v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_threads@threads-fd-userptr-invalidate-race:<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_exec=
_threads@threads-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@=
xe_exec_threads@threads-fd-userptr-invalidate-race.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-b=
o-unmap:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-malloc-bo-unmap.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4842">Intel XE#4842</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154369v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-=
shared-vm-many-execqueues-malloc-bo-unmap.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode}:<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_fau=
lt_injection@inject-fault-probe-function-guc_wait_ucode.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154369v2/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-g=
uc_wait_ucode.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-154369v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@core_s=
etmaster@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@core_setmaste=
r@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-154369v2/shard-dg2-434/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/sha=
rd-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-a=
dlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4173">Intel XE#4173</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_ccs@crc-primary-suspend=
-4-tiled-mtl-rc-ccs@pipe-a-hdmi-a-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +125 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-c-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-t=
iled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_chamelium_frames@dp-crc=
-single.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_content_protection@atomic=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_content_protection@ueve=
nt@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_feature_discover=
y@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_flip@2x-fl=
ip-vs-blocking-wf-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-lnl-4/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-9/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32=
bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-d=
g2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fb=
cdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_hdr@=
invalid-metadata-sizes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_hdr@invalid-metada=
ta-sizes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_psr2_sf@fbc-pr-overlay-=
plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-adlp-8/igt@kms_psr@fbc-psr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_psr@pr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_psr@psr-basic.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_setm=
ode@clone-exclusive-crtc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-6/igt@kms_setmode@clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_tiled_display@basic-tes=
t-pattern.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_=
class_compute:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@xe_compute_preempt@compute-=
threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1=
280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_copy_basic@mem-copy-line=
ar-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_copy_basic@mem-set-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other-debuggable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_eudebug_online@interrupt=
-other-debuggable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-=
432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-rebind.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-435/igt@xe_exec_fault_mode@many-bas=
ic-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-mlock:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-adlp-8/igt@xe_exec_system_allocator@thr=
eads-many-execqueues-malloc-mlock.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_exec=
_threads@threads-hang-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard=
-adlp-6/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3876">Intel XE#3876</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_liv=
e_ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229"=
>Intel XE#2229</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_liv=
e_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_live_=
ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_oa@rc6-disable.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-2/igt@xe_pm@s=
2idle-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-154369v2/shard-adlp-6/igt@xe_pm@s2idle-basic.html">DMESG-F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/554=
5">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_pm@=
s2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_pm@s2idle-exec-after.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) +187 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_pxp@pxp-stale-queue-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@xe_sriov_flr@flr-vfs-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_vm@invalid-extensions.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +31 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@core_g=
etversion@all-cards.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@core_getv=
ersion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@fbdev@=
read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@fbdev@read.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@kms_async_flips@async-flip-hang}:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-hang.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/sh=
ard-adlp-9/igt@kms_async_flips@async-flip-hang.html">PASS</a> +2 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-dg2-463/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154369v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@=
pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Int=
el XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3113">Intel XE#3113</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-154369v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs-cc@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-b=
mg-7/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-3/igt@kms_fli=
p@dpms-off-confusion-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-adlp-8/igt@kms_flip@dpms-off-confusion-interruptible@b-hdmi-a1.h=
tml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend@c-dp4.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/sh=
ard-dg2-436/igt@kms_flip@flip-vs-suspend@c-dp4.html">PASS</a> +1 other test=
 pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154369v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-=
4tile-downscaling.html">PASS</a> +198 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_hdr@static-to=
ggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_vrr@negative=
-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1=
392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54369v2/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bi=
ndexecqueue.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@many-stride-malloc-prefetch}:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@xe_exec_=
system_allocator@many-stride-malloc-prefetch.html">WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/5786">Intel XE#5786</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/sh=
ard-bmg-1/igt@xe_exec_system_allocator@many-stride-malloc-prefetch.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-8/igt@xe_pm@s=
2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504">Intel =
XE#4504</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154369v2/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a>=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-adlp-4/igt@kms_asy=
nc_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-=
adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel =
XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_at=
omic_transition@plane-all-modeset-transition-fencing-internal-panels.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_atomic_transition@plane-all-modes=
et-transition-fencing-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard=
-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@=
kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms=
_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shar=
d-dg2-433/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a=
>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/=
igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154369v2/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rota=
te-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-h=
flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/=
shard-dg2-463/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_bw=
@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_bw=
@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-=
463/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_bw=
@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-43=
4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369=
v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351"=
>Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_cc=
s@crc-primary-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15436=
9v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shar=
d-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Int=
el XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard=
-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/=
shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/78=
7">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INC=
OMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#434=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522=
">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_ch=
amelium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_cham=
elium_audio@dp-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_ch=
amelium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_chame=
lium_color@degamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_chame=
lium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ch=
amelium_frames@dp-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@km=
s_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_cont=
ent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-3/igt@kms_conte=
nt_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_co=
ntent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/=
igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_co=
ntent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_c=
ontent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432=
/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_cu=
rsor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt=
@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ds=
c@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms=
_dsc@dsc-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fe=
ature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms=
_feature_discovery@chamelium.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154369v2/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-154369v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp=
-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-154369v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri=
-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154369v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
154369v2/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v=
2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt=
@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Inte=
l XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn=
-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs=
-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#6=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
4369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb=
-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">I=
ntel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54369v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154=
369v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v=
2/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/=
igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms=
_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_jo=
iner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-d=
g2-463/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE=
#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-bmg-7/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms=
_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_pm=
_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@kms=
_pm_backlight@basic-brightness.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_pm=
_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/=
igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_pm=
_dc@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@kms_pm_dc@dc5-psr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_psr2_sf@psr2-overlay-plane-mo=
ve-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ps=
r@fbc-psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard=
-dg2-466/igt@kms_psr@fbc-psr-primary-page-flip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Inte=
l XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1543=
69v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1=
406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-=
434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel=
 XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@kms_psr_stress_test@flip-prima=
ry-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/s=
hard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_com=
pute_preempt@compute-threadgroup-preempt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-=
dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel =
XE#1280</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@survivability-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_con=
figfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6010">Intel XE#6010</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_c=
onfigfs@survivability-mode.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/=
igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_eud=
ebug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@=
xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_eud=
ebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-=
dg2-466/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel =
XE#4837</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg=
2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1=
392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel=
 XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-154369v2/shard-dg2-434/igt@xe_exec_basic@multigpu-once-bindexecqueue-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
54369v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-in=
validate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154369v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-=
rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/=
shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_exe=
c_system_allocator@many-execqueues-mmap-new-huge.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v=
2/shard-dg2-463/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4915">Intel XE#4915</a>) +165 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eo=
check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/491=
5">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-sha=
red-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +169 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_ct_send_recv.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2=
/shard-dg2-433/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4917">Intel XE#4917</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-bmg-2/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5530">Intel XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-154369v2/shard-bmg-2/igt@xe_fault_injection@probe-fail-g=
uc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-463/igt@=
xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_oa@=
oa-tlb-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_oa@oa-tl=
b-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_pat=
@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@=
xe_pat@pat-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe=
_peer2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt=
@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-432/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-466/igt@xe_pxp=
@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-=
434/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_que=
ry@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_q=
uery@multigpu-query-topology.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-154369v2/shard-dg2-463/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-432/igt@xe_sri=
ov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-434/igt@xe_=
sriov_flr@flr-each-isolation.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-434/igt@xe_sri=
ov_flr@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg2-466/igt@xe_sriov_flr=
@flr-twice.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3724-f251150579f93807f196c33b8716f14c1fd136e6/shard-dg2-464/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4351</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154369v2/shard-dg=
2-434/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3724-f251150579f93807f196c33b8716f14c1fd136e6 -&gt; xe-pw-154=
369v2</li>
</ul>
<p>IGT_8534: 8534<br />
  xe-3724-f251150579f93807f196c33b8716f14c1fd136e6: f251150579f93807f196c33=
b8716f14c1fd136e6<br />
  xe-pw-154369v2: 154369v2</p>

</body>
</html>

--===============3883301501056355809==--
