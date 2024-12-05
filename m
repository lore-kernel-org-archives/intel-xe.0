Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16700E7716D
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 01:53:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A767610E376;
	Thu,  5 Dec 2024 01:53:05 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E353F10E376;
 Thu,  5 Dec 2024 01:53:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6368139279034501653=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Wait_for_migrati?=
 =?utf-8?q?on_job_before_unmapping_pages?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 01:53:03 -0000
Message-ID: <173336358392.2773211.14590010930643537207@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241204220605.1786340-1-nirmoy.das@intel.com>
In-Reply-To: <20241204220605.1786340-1-nirmoy.das@intel.com>
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

--===============6368139279034501653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Wait for migration job before unmapping pages
URL   : https://patchwork.freedesktop.org/series/142137/
State : failure

== Summary ==

CI Bug Log - changes from xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856_full -> xe-pw-142137v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142137v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142137v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142137v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp2:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp2.html

  * igt@xe_exec_basic@many-execqueues-userptr:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@xe_exec_basic@many-execqueues-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_exec_basic@many-execqueues-userptr.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-7/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-8388608:
    - shard-bmg:          [PASS][7] -> [DMESG-WARN][8] +4 other tests dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_vm@large-userptr-split-misaligned-binds-8388608.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_vm@large-userptr-split-misaligned-binds-8388608.html

  
Known issues
------------

  Here are the changes found in xe-pw-142137v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][9] -> [DMESG-FAIL][10] ([Intel XE#1033] / [Intel XE#1727]) +6 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1426]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][15] -> [DMESG-WARN][16] ([Intel XE#2705] / [Intel XE#3468])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-adlp:         [PASS][17] -> [DMESG-WARN][18] ([Intel XE#3086]) +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#1727] / [Intel XE#3468])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [PASS][21] -> [DMESG-FAIL][22] ([Intel XE#2705])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [PASS][23] -> [ABORT][24] ([Intel XE#3468]) +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][25] -> [DMESG-FAIL][26] ([Intel XE#3468]) +4 other tests dmesg-fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][27] -> [DMESG-FAIL][28] ([Intel XE#1727] / [Intel XE#3468]) +3 other tests dmesg-fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-bmg:          [PASS][29] -> [INCOMPLETE][30] ([Intel XE#2635])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][31] -> [DMESG-WARN][32] ([Intel XE#3468]) +37 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#886]) +4 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][35] -> [FAIL][36] ([Intel XE#2882]) +7 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_flip@wf_vblank-ts-check.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2311])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#771] / [Intel XE#899])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][40] -> [FAIL][41] ([Intel XE#899])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#3467])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953] / [Intel XE#3086])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-8/igt@xe_module_load@many-reload.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-8/igt@xe_module_load@many-reload.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][46] -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-FAIL][48] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][49] +2 other tests pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [FAIL][50] ([Intel XE#1426]) -> [PASS][51] +1 other test pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][52] -> [PASS][53] +1 other test pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [FAIL][54] ([Intel XE#1475]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][56] ([Intel XE#3321]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:
    - shard-adlp:         [FAIL][58] ([Intel XE#2882]) -> [PASS][59] +2 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-3/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html

  * igt@kms_plane_scaling@planes-upscale-20x20:
    - shard-bmg:          [INCOMPLETE][60] ([Intel XE#2566]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20.html

  * igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:
    - shard-bmg:          [INCOMPLETE][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_plane_scaling@planes-upscale-20x20@pipe-a.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][64] ([Intel XE#899]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [TIMEOUT][66] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-rebind:
    - shard-bmg:          [DMESG-WARN][68] ([Intel XE#3468]) -> [PASS][69] +5 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_exec_basic@many-rebind.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_exec_basic@many-rebind.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:
    - shard-bmg:          [DMESG-WARN][70] ([Intel XE#2705]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][72], [PASS][73], [PASS][74], [PASS][75], [PASS][76], [PASS][77], [PASS][78], [PASS][79], [PASS][80], [PASS][81], [PASS][82], [PASS][83], [PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [SKIP][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97]) ([Intel XE#2457]) -> ([PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_module_load@load.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_module_load@load.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_module_load@load.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_module_load@load.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_module_load@load.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@xe_module_load@load.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@xe_module_load@load.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@xe_module_load@load.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_module_load@load.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][123] ([Intel XE#3468]) -> [DMESG-WARN][124] ([Intel XE#3468]) +5 other tests dmesg-warn
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_big_fb@linear-32bpp-rotate-180.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@kms_big_fb@linear-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][125] ([Intel XE#3468]) -> [DMESG-FAIL][126] ([Intel XE#3468]) +2 other tests dmesg-fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][127] -> [FAIL][128] ([Intel XE#1231])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [TIMEOUT][129] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402]) -> [FAIL][130] ([Intel XE#1874])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [DMESG-WARN][131] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-FAIL][132] ([Intel XE#3468] / [Intel XE#877])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_color@deep-color.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@kms_color@deep-color.html

  * igt@kms_color@deep-color@pipe-a-dp-2-degamma:
    - shard-bmg:          [DMESG-WARN][133] ([Intel XE#3468] / [Intel XE#877]) -> [DMESG-WARN][134] ([Intel XE#3468])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html

  * igt@kms_color@deep-color@pipe-a-dp-2-gamma:
    - shard-bmg:          [DMESG-WARN][135] ([Intel XE#3468]) -> [DMESG-FAIL][136] ([Intel XE#3468] / [Intel XE#877])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_color@deep-color@pipe-a-dp-2-gamma.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-gamma.html

  * igt@kms_draw_crc@draw-method-blt:
    - shard-bmg:          [DMESG-FAIL][137] ([Intel XE#3468]) -> [INCOMPLETE][138] ([Intel XE#1727] / [Intel XE#3468])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw_crc@draw-method-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_draw_crc@draw-method-blt.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
    - shard-bmg:          [DMESG-FAIL][139] ([Intel XE#2705]) -> [DMESG-WARN][140] ([Intel XE#3468])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [SKIP][141] ([Intel XE#3665]) -> [DMESG-FAIL][142] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3468])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][143] ([Intel XE#2333]) -> [DMESG-FAIL][144] ([Intel XE#3468])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:
    - shard-adlp:         [TIMEOUT][145] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][146] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][147] ([Intel XE#2426]) -> [SKIP][148] ([Intel XE#2509])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-bmg:          [DMESG-WARN][149] ([Intel XE#3467]) -> [DMESG-WARN][150] ([Intel XE#3467] / [Intel XE#3468])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][151] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][152] ([Intel XE#3467]) +1 other test dmesg-warn
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_vm@large-userptr-binds-2147483648:
    - shard-bmg:          [DMESG-WARN][153] -> [DMESG-WARN][154] ([Intel XE#3468])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_vm@large-userptr-binds-2147483648.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_vm@large-userptr-binds-2147483648.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3665
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899


Build changes
-------------

  * Linux: xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856 -> xe-pw-142137v1

  IGT_8138: 8138
  xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856: 62d365d6c3078d7e4f34dd65735f6fcd7b53a856
  xe-pw-142137v1: 142137v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/index.html

--===============6368139279034501653==
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
<tr><td><b>Series:</b></td><td>drm/xe: Wait for migration job before unmapp=
ing pages</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/142137/">https://patchwork.freedesktop.org/series/142137/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-142137v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142137v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7=
b53a856_full -&gt; xe-pw-142137v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142137v1_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-142137v1_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1421=
37v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank@c-dp2.html">PASS</a> -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_flip@fl=
ip-vs-absolute-wf_vblank@c-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@xe_exec_=
basic@many-execqueues-userptr.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_exec_basic@m=
any-execqueues-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-7/igt@xe_exec_=
mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-7/ig=
t@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-8388608:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_vm@la=
rge-userptr-split-misaligned-binds-8388608.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe=
_vm@large-userptr-split-misaligned-binds-8388608.html">DMESG-WARN</a> +4 ot=
her tests dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142137v1_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-2/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp=
-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMES=
G-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1033">Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1727">Intel XE#1727</a>) +6 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-3/igt@kms_ato=
mic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-3/i=
gt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE=
#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-5/igt@kms_atom=
ic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/sh=
ard-lnl-5/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-=
edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/ig=
t@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Int=
el XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-8/igt@kms_cur=
sor_legacy@short-flip-before-cursor-toggle.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-8/igt@k=
ms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3=
086</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw=
_crc@draw-method-blt@xrgb2101010-4tiled.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_d=
raw_crc@draw-method-blt@xrgb2101010-4tiled.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">In=
tel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw=
_crc@draw-method-blt@xrgb8888-4tiled.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_draw=
_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspe=
nd.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3468">Intel XE#3468</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-suspend@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@2=
x-flip-vs-suspend@ab-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 othe=
r tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-suspend@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@kms_flip@2=
x-flip-vs-suspend@ac-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#346=
8</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@kms_flip=
@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_flip@flip-vs-=
absolute-wf_vblank.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_flip=
@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/ig=
t@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Inte=
l XE#3468</a>) +37 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-3/igt@kms_flip=
@plain-flip-ts-check@a-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl-7/igt@kms_flip@plain-fl=
ip-ts-check@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_flip=
@wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_flip@wf_vblank-ts-che=
ck.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2882">Intel XE#2882</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-1/igt@kms_uni=
versal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-9/igt@kms_universal_pl=
ane@cursor-fb-leak.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-1/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-9/igt@=
kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_tile_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/sha=
rd-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_ea=
rly.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-8/igt@xe_modu=
le_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-142137v1/shard-adlp-8/igt@xe_module_load@many-relo=
ad.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">FAIL</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033"=
>Intel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-142137v1/shard-adlp-6/igt@kms_async_flips@async-fli=
p-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> +2 other tests pas=
s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@p=
ipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-3/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1426">Intel XE#1426</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142137v1/shard-lnl-3/igt@kms_atomic_transition@plane-all-mo=
deset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> +1 other test =
pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-3.html">DMESG-WARN</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1=
/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs@pipe-a-hdm=
i-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-4/igt@kms_curs=
or_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl=
-3/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard=
-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-3/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-ad=
lp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@b-hdmi-a1.html">PASS</a> +2 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-20x20.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-=
4/igt@kms_plane_scaling@planes-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20@pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-20x20@pipe-a.html">INCOMPLETE</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@k=
ms_plane_scaling@planes-upscale-20x20@pipe-a.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-lnl-8/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-lnl=
-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_evict=
@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v=
1/shard-bmg-3/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_exec_=
basic@many-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_exec=
_basic@many-rebind.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_exec_=
threads@threads-cm-shared-vm-userptr-rebind.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
37v1/shard-bmg-3/igt@xe_exec_threads@threads-cm-shared-vm-userptr-rebind.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53=
a856/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd=
7b53a856/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f=
6fcd7b53a856/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65=
735f6fcd7b53a856/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34=
dd65735f6fcd7b53a856/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e=
4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c307=
8d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6=
c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-62d3=
65d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2320-=
62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_module_=
load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a85=
6/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-b=
mg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42137v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142137v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42137v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42137v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142137v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42137v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142137v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
42137v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-142137v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-2/igt@kms_big_=
fb@linear-32bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-3/ig=
t@kms_big_fb@linear-32bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/s=
hard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">DMESG-=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-3/igt@kms_big=
_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1421=
37v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hfl=
ip-async-flip.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727"=
>Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/402">Intel XE#402</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142137v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_colo=
r@deep-color.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-1/ig=
t@kms_color@deep-color.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-degamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_colo=
r@deep-color@pipe-a-dp-2-degamma.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14213=
7v1/shard-bmg-1/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468=
">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-gamma:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_colo=
r@deep-color@pipe-a-dp-2-gamma.html">DMESG-WARN</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-=
1/igt@kms_color@deep-color@pipe-a-dp-2-gamma.html">DMESG-FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">=
Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw=
_crc@draw-method-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-8/igt@kms_=
draw_crc@draw-method-blt.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@kms_draw=
_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/s=
hard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-=
WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/34=
68">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/3665">Intel XE#3665</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/s=
hard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">=
DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v=
1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-adlp-4/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">I=
ntel XE#1033</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1727">Intel XE#1727</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-142137v1/shard-adlp-4/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-modifiers@pipe-d.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-4/igt@xe_fault=
_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Int=
el XE#3467</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-142137v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-functi=
on-xe_device_create.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_fault=
_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel X=
E#3467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3468">Intel XE#3468</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-=
xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test =
dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-binds-2147483648:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856/shard-bmg-8/igt@xe_vm@la=
rge-userptr-binds-2147483648.html">DMESG-WARN</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142137v1/shard-bmg-2/igt@xe_vm@larg=
e-userptr-binds-2147483648.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856 -&gt; xe-pw-142=
137v1</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2320-62d365d6c3078d7e4f34dd65735f6fcd7b53a856: 62d365d6c3078d7e4f34dd6=
5735f6fcd7b53a856<br />
  xe-pw-142137v1: 142137v1</p>

</body>
</html>

--===============6368139279034501653==--
