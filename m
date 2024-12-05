Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 528E7E77171
	for <intel-xe@archiver.kernel.org>; Thu,  5 Dec 2024 06:37:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17E3810E383;
	Thu,  5 Dec 2024 06:37:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 318E310E383;
 Thu,  5 Dec 2024 06:37:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0753324195711867291=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Make_OA_buffer_size_config?=
 =?utf-8?q?urable_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Dec 2024 06:37:15 -0000
Message-ID: <173338063519.2861566.16198592221505537910@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241205041913.883767-1-sai.teja.pottumuttu@intel.com>
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

--===============0753324195711867291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make OA buffer size configurable (rev3)
URL   : https://patchwork.freedesktop.org/series/141795/
State : failure

== Summary ==

CI Bug Log - changes from xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e_full -> xe-pw-141795v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141795v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141795v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141795v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_properties@connector-properties-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2] +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_properties@connector-properties-atomic@pipe-a-dp-2.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-1/igt@kms_properties@connector-properties-atomic@pipe-a-dp-2.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind:
    - shard-lnl:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html

  
#### Warnings ####

  * igt@kms_properties@connector-properties-atomic:
    - shard-bmg:          [DMESG-WARN][5] ([Intel XE#3468]) -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_properties@connector-properties-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-1/igt@kms_properties@connector-properties-atomic.html

  
Known issues
------------

  Here are the changes found in xe-pw-141795v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#1033] / [Intel XE#1727]) +3 other tests dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#455])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-8/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#3321])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#2333]) +2 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2311]) +3 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2313]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2234] / [Intel XE#2850])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#2883]) +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_setmode@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-2:
    - shard-bmg:          [PASS][21] -> [DMESG-WARN][22] ([Intel XE#3468]) +10 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-2.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-2.html

  * igt@kms_vrr@cmrr:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2168])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_vrr@cmrr.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1091] / [Intel XE#2849])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2905])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2322])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2360])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_reset@spin-signaled:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][28] ([Intel XE#3468])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@xe_exec_reset@spin-signaled.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#3086] / [Intel XE#3343])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:
    - shard-adlp:         [PASS][31] -> [DMESG-WARN][32] ([Intel XE#3086])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         NOTRUN -> [ABORT][33] ([Intel XE#1694]) +1 other test abort
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [PASS][34] -> [ABORT][35] ([Intel XE#1358] / [Intel XE#1607])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-8/igt@xe_pm@s4-basic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][36] -> [ABORT][37] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [PASS][38] -> [FAIL][39] ([Intel XE#958])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][40] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) -> [PASS][41] +1 other test pass
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][42] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][43]
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][44] ([Intel XE#324]) -> [PASS][45] +3 other tests pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][46] ([Intel XE#1701]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-toggle:
    - shard-adlp:         [DMESG-WARN][48] ([Intel XE#3086]) -> [PASS][49] +1 other test pass
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][50] ([Intel XE#2882]) -> [PASS][51] +4 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][52] ([Intel XE#3640]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][54] ([Intel XE#886]) -> [PASS][55] +2 other tests pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][56] ([Intel XE#3468]) -> [PASS][57] +14 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][58] ([Intel XE#2029]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-lnl:          [DMESG-WARN][60] ([Intel XE#3184]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][62] ([Intel XE#899]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@query-forked-busy@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][64] ([Intel XE#3468]) -> [PASS][65] +4 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [TIMEOUT][66] ([Intel XE#1473]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_exec_reset@virtual-close-execqueues-close-fd:
    - shard-bmg:          [DMESG-WARN][68] ([Intel XE#1727]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-8/igt@xe_module_load@many-reload.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         [DMESG-WARN][72] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@xe_module_load@reload-no-display.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@short-reads:
    - shard-lnl:          [DMESG-WARN][74] -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-3/igt@xe_oa@short-reads.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-4/igt@xe_oa@short-reads.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][76] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][78] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-misaligned-binds-536870912:
    - shard-bmg:          [DMESG-WARN][80] -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_vm@large-misaligned-binds-536870912.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@xe_vm@large-misaligned-binds-536870912.html

  * igt@xe_vm@large-userptr-split-binds-1073741824:
    - shard-adlp:         [TIMEOUT][82] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][83]
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@xe_vm@large-userptr-split-binds-1073741824.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-1073741824.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-bmg:          [DMESG-FAIL][84] ([Intel XE#3468]) -> [DMESG-WARN][85] ([Intel XE#3468] / [Intel XE#877])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-WARN][86] ([Intel XE#3468]) -> [DMESG-FAIL][87] ([Intel XE#3468]) +2 other tests dmesg-fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][88] ([Intel XE#3468]) -> [DMESG-WARN][89] ([Intel XE#3468])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [DMESG-WARN][90] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-FAIL][91] ([Intel XE#1727] / [Intel XE#3468])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][92] -> [FAIL][93] ([Intel XE#1231])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_color@deep-color:
    - shard-bmg:          [DMESG-WARN][94] ([Intel XE#3468]) -> [DMESG-FAIL][95] ([Intel XE#3468] / [Intel XE#877])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_color@deep-color.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_color@deep-color.html

  * igt@kms_color@deep-color@pipe-a-dp-2-degamma:
    - shard-bmg:          [DMESG-WARN][96] ([Intel XE#3468]) -> [DMESG-WARN][97] ([Intel XE#3468] / [Intel XE#877])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][98] ([Intel XE#3468]) -> [DMESG-WARN][99] ([Intel XE#877])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:
    - shard-bmg:          [DMESG-FAIL][100] ([Intel XE#2705] / [Intel XE#3468]) -> [DMESG-WARN][101] ([Intel XE#3468])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html

  * igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:
    - shard-bmg:          [DMESG-FAIL][102] ([Intel XE#2705]) -> [DMESG-FAIL][103] ([Intel XE#2705] / [Intel XE#3468])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][104] -> [FAIL][105] ([Intel XE#886])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [FAIL][106] ([Intel XE#3036]) -> [FAIL][107] ([Intel XE#886])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [TIMEOUT][108] ([Intel XE#1033] / [Intel XE#1727]) -> [FAIL][109] ([Intel XE#1861])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:
    - shard-bmg:          [INCOMPLETE][110] ([Intel XE#1727] / [Intel XE#2050]) -> [FAIL][111] ([Intel XE#2333])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         [TIMEOUT][112] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][113] ([Intel XE#656])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [TIMEOUT][114] ([Intel XE#1727]) -> [SKIP][115] ([Intel XE#656])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][116] ([Intel XE#1729]) -> [SKIP][117] ([Intel XE#2426])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][118] ([Intel XE#3468]) -> [DMESG-WARN][119] ([Intel XE#1727] / [Intel XE#3468])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][120] ([Intel XE#1727] / [Intel XE#3468]) -> [DMESG-WARN][121] ([Intel XE#3468])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-adlp:         [TIMEOUT][122] ([Intel XE#1033] / [Intel XE#1727]) -> [SKIP][123] ([Intel XE#1392])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          [DMESG-WARN][124] ([Intel XE#3467]) -> [DMESG-WARN][125] ([Intel XE#3467] / [Intel XE#3468]) +1 other test dmesg-warn
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][126] ([Intel XE#3467] / [Intel XE#3468]) -> [DMESG-WARN][127] ([Intel XE#3467])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][128] ([Intel XE#3468]) -> [DMESG-WARN][129] ([Intel XE#3467])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3036]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3640]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e -> xe-pw-141795v3

  IGT_8138: 8138
  xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e: bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e
  xe-pw-141795v3: 141795v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/index.html

--===============0753324195711867291==
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
<tr><td><b>Series:</b></td><td>Make OA buffer size configurable (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141795/">https://patchwork.freedesktop.org/series/141795/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e_full -&gt; xe-pw-141795v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141795v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141795v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141795v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_properties@connector-properties-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_properties@connector-properties-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-1/igt@kms_properties@connector-properties-atomic@pipe-a-dp-2.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-3/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-userptr-rebind.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_properties@connector-properties-atomic:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_properties@connector-properties-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-1/igt@kms_properties@connector-properties-atomic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141795v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-8/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-indfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_vblank@ts-continuation-modeset@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_eudebug@discovery-empty-clients.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@spin-signaled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@xe_exec_reset@spin-signaled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-8/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-8/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@kms_cursor_legacy@short-flip-before-cursor-toggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3640">Intel XE#3640</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_plane_cursor@overlay@pipe-d-dp-2-size-64.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-8/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-8/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-7/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-busy@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_vblank@query-forked-busy@pipe-a-dp-2.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-execqueues-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_exec_reset@virtual-close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-8/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-9/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-3/igt@xe_oa@short-reads.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-4/igt@xe_oa@short-reads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-536870912:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_vm@large-misaligned-binds-536870912.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@xe_vm@large-misaligned-binds-536870912.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-1073741824:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@xe_vm@large-userptr-split-binds-1073741824.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_vm@large-userptr-split-binds-1073741824.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-4/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_color@deep-color.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_color@deep-color.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@deep-color@pipe-a-dp-2-degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-5/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_color@deep-color@pipe-a-dp-2-degamma.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb2101010-xtiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_draw_crc@draw-method-blt@xrgb8888-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3036">Intel XE#3036</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-3/igt@kms_vblank@ts-continuation-dpms-rpm@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-8/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v3/shard-bmg-8/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e -&gt; xe-pw-141795v3</li>
</ul>
<p>IGT_8138: 8138<br />
  xe-2322-bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e: bfd3bde7e3c3d30d3b3f9a155ea8c5d3c8d3871e<br />
  xe-pw-141795v3: 141795v3</p>

</body>
</html>

--===============0753324195711867291==--
