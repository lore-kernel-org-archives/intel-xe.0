Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0FA2D44148
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 11:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4AD010E62E;
	Tue, 19 Nov 2024 11:45:01 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7FBF10E0A9;
 Tue, 19 Nov 2024 11:44:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5021379893750772410=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_UMD_direct_submission_in_Xe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 11:44:59 -0000
Message-ID: <173201669995.281726.9451663843529257418@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118233757.2374041-1-matthew.brost@intel.com>
In-Reply-To: <20241118233757.2374041-1-matthew.brost@intel.com>
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

--===============5021379893750772410==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: UMD direct submission in Xe
URL   : https://patchwork.freedesktop.org/series/141524/
State : failure

== Summary ==

CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_full -> xe-pw-141524v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141524v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141524v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141524v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][2] -> [DMESG-FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_color@degamma@pipe-a-dp-2:
    - shard-bmg:          [PASS][4] -> [SKIP][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_color@degamma@pipe-a-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_color@degamma@pipe-a-dp-2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-bmg:          [PASS][8] -> [DMESG-WARN][9] +8 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_force_connector_basic@force-edid.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_psr@psr-sprite-render@edp-1:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] +10 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_psr@psr-sprite-render@edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_psr@psr-sprite-render@edp-1.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][12]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-dg2-set2:     [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
    - shard-lnl:          [PASS][17] -> [ABORT][18] +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][19] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][20] +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [DMESG-FAIL][21] ([Intel XE#2705]) -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:
    - shard-bmg:          [DMESG-WARN][23] ([Intel XE#2705]) -> [DMESG-FAIL][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [DMESG-FAIL][25] ([Intel XE#3468]) -> [SKIP][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [FAIL][27] ([Intel XE#2333]) -> [DMESG-FAIL][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:
    - shard-bmg:          [DMESG-WARN][29] ([Intel XE#3468]) -> [DMESG-FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][31] ([Intel XE#1727]) -> [DMESG-WARN][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr:
    - shard-bmg:          [DMESG-WARN][33] ([Intel XE#2705]) -> [DMESG-WARN][34]
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-bmg:          [DMESG-WARN][35] -> [ABORT][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-adlp:         [DMESG-WARN][37] ([Intel XE#3086]) -> [ABORT][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
    - shard-dg2-set2:     [DMESG-WARN][39] ([Intel XE#3467]) -> [ABORT][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [DMESG-WARN][41] ([Intel XE#3467]) -> [ABORT][42] +1 other test abort
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-bmg:          [DMESG-WARN][43] ([Intel XE#3468]) -> [INCOMPLETE][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@xe_pm@d3hot-mmap-vram.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#1130]) -> [ABORT][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [DMESG-WARN][47] ([Intel XE#3468]) -> [DMESG-WARN][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html

  
Known issues
------------

  Here are the changes found in xe-pw-141524v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][49] -> [SKIP][50] ([Intel XE#1885])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1885])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][52] -> [SKIP][53] ([Intel XE#2134])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@fbdev@info.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2370])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][55] ([Intel XE#1033])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#1124])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#2136]) +19 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#2314] / [Intel XE#2894])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2314] / [Intel XE#2894])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#787]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2887]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#787]) +20 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#306])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#2325])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#373])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2252]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_content_protection@lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [FAIL][71] ([Intel XE#1178]) +1 other test fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2321])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][73] -> [SKIP][74] ([Intel XE#2423] / [i915#2575]) +100 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][75] ([Intel XE#877])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [PASS][76] -> [SKIP][77] ([Intel XE#2423])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_dp_aux_dev.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_dp_aux_dev.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2244])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][79] -> [FAIL][80] ([Intel XE#3486])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][81] -> [FAIL][82] ([Intel XE#2882]) +1 other test fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#310])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#877]) +1 other test dmesg-warn
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][86] -> [SKIP][87] ([Intel XE#2316]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][88] -> [FAIL][89] ([Intel XE#301]) +1 other test fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#2953] / [Intel XE#3086]) +3 other tests dmesg-warn
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#886]) +3 other tests fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][94] -> [FAIL][95] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][96] -> [SKIP][97] ([Intel XE#2351])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2311]) +4 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#656]) +3 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [FAIL][100] ([Intel XE#2333]) +1 other test fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][101] -> [SKIP][102] ([Intel XE#2136]) +30 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#651])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2313]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#653]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][109] -> [SKIP][110] ([Intel XE#455])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - shard-bmg:          [PASS][111] -> [DMESG-WARN][112] ([Intel XE#2705])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          [PASS][113] -> [DMESG-WARN][114] ([Intel XE#2566] / [Intel XE#3466])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - shard-lnl:          [PASS][115] -> [DMESG-WARN][116] ([Intel XE#3466]) +1 other test dmesg-warn
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763]) +2 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2763] / [Intel XE#455])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2423] / [i915#2575]) +18 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
    - shard-lnl:          [PASS][120] -> [DMESG-WARN][121] ([Intel XE#2566]) +1 other test dmesg-warn
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_rpm@cursor:
    - shard-dg2-set2:     [PASS][122] -> [SKIP][123] ([Intel XE#2446]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_rpm@cursor.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#2446]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html
    - shard-lnl:          [PASS][125] -> [DMESG-WARN][126] ([Intel XE#2042])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-59:
    - shard-lnl:          [PASS][127] -> [DMESG-WARN][128] ([Intel XE#3514]) +5 other tests dmesg-warn
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#1489])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2234] / [Intel XE#2850])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2426])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][133] -> [FAIL][134] ([Intel XE#899]) +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2504])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2905])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2905]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][138] -> [TIMEOUT][139] ([Intel XE#1473] / [Intel XE#2472])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#2322])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@no-exec-basic-defer-bind:
    - shard-dg2-set2:     [PASS][141] -> [SKIP][142] ([Intel XE#1130]) +190 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_exec_basic@no-exec-basic-defer-bind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][143] ([Intel XE#1727])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-prefetch:
    - shard-bmg:          [PASS][144] -> [DMESG-WARN][145] ([Intel XE#3468]) +6 other tests dmesg-warn
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#288]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][147] -> [SKIP][148] ([Intel XE#2229]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#2541]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@stress-open-close@rcs-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][150] ([Intel XE#3466])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-5/igt@xe_oa@stress-open-close@rcs-0.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#2284])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [PASS][152] -> [ABORT][153] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@xe_pm@s4-basic-exec.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][154] -> [ABORT][155] ([Intel XE#1607] / [Intel XE#1794])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][156] -> [ABORT][157] ([Intel XE#1794])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-adlp:         [PASS][158] -> [FAIL][159] ([Intel XE#3507])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@xe_sriov_flr@flr-vf1-clear.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-8/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#1130]) +30 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1885]) -> [PASS][162]
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_hotunplug@hotrebind.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#3453]) -> [PASS][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [FAIL][165] ([Intel XE#3105]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][167] ([Intel XE#1426]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][169] ([Intel XE#3321] / [Intel XE#3486]) -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][171] ([Intel XE#2882]) -> [PASS][172] +1 other test pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][173] ([Intel XE#886]) -> [PASS][174] +1 other test pass
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][175] ([Intel XE#1727]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][177] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][179] ([Intel XE#3468]) -> [PASS][180] +2 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@c-dp2:
    - shard-bmg:          [DMESG-FAIL][181] ([Intel XE#1727]) -> [PASS][182] +3 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-dp2.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [DMESG-WARN][183] ([Intel XE#2932]) -> [PASS][184] +2 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:
    - shard-bmg:          [INCOMPLETE][185] ([Intel XE#2635]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][187] ([Intel XE#3468]) -> [PASS][188] +1 other test pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][190] +2 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2136]) -> [PASS][192] +3 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][193] ([Intel XE#1503]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [DMESG-WARN][195] ([Intel XE#3086]) -> [PASS][196] +3 other tests pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#2566]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_prop_blob@blob-prop-lifetime:
    - shard-bmg:          [DMESG-WARN][199] ([Intel XE#2705]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_prop_blob@blob-prop-lifetime.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_prop_blob@blob-prop-lifetime.html

  * igt@kms_rotation_crc@sprite-rotation-180:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#2423] / [i915#2575]) -> [PASS][202] +26 other tests pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-180.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][203] ([Intel XE#899]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          [DMESG-WARN][205] ([Intel XE#3468]) -> [PASS][206] +21 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1130]) -> [PASS][208] +39 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [FAIL][209] ([Intel XE#2667]) -> [PASS][210]
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][211] ([Intel XE#1473]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][213] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][215] ([Intel XE#2998]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_module_load@unload:
    - shard-dg2-set2:     [DMESG-WARN][217] ([Intel XE#3467]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_module_load@unload.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_module_load@unload.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][219] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-basic.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][221] ([Intel XE#958]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#2423] / [i915#2575]) -> [SKIP][224] ([Intel XE#623])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [DMESG-FAIL][225] ([Intel XE#3468]) -> [DMESG-WARN][226] ([Intel XE#3468])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@test-only:
    - shard-dg2-set2:     [DMESG-WARN][227] ([Intel XE#1727]) -> [SKIP][228] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_atomic@test-only.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_atomic@test-only.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][229] ([Intel XE#3225]) -> [INCOMPLETE][230] ([Intel XE#3225] / [Intel XE#3466]) +3 other tests incomplete
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#316]) -> [SKIP][232] ([Intel XE#2136] / [Intel XE#2351]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-dg2-set2:     [DMESG-WARN][233] ([Intel XE#1727]) -> [SKIP][234] ([Intel XE#2136])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - shard-bmg:          [DMESG-WARN][235] ([Intel XE#3468]) -> [DMESG-FAIL][236] ([Intel XE#3468]) +4 other tests dmesg-fail
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][237] ([Intel XE#3468]) -> [INCOMPLETE][238] ([Intel XE#3225] / [Intel XE#3468])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#316]) -> [SKIP][240] ([Intel XE#2136]) +1 other test skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1124]) -> [SKIP][242] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#607]) -> [SKIP][244] ([Intel XE#2136] / [Intel XE#2351])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][246] ([Intel XE#1124])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1124]) -> [SKIP][248] ([Intel XE#2136]) +6 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#619]) -> [SKIP][250] ([Intel XE#2136] / [Intel XE#2351])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2136]) -> [SKIP][252] ([Intel XE#1124]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2191]) -> [SKIP][254] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2423] / [i915#2575]) -> [SKIP][256] ([Intel XE#367]) +2 other tests skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#367]) -> [SKIP][258] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2907]) -> [SKIP][260] ([Intel XE#2136]) +3 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#2136]) -> [SKIP][262] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][263] -> [SKIP][264] ([Intel XE#3442])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][265] -> [SKIP][266] ([Intel XE#2136])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][268] ([Intel XE#2136] / [Intel XE#2351])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][270] ([Intel XE#2136]) +13 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#306]) -> [SKIP][272] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#373]) -> [SKIP][274] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2423] / [i915#2575]) -> [SKIP][276] ([Intel XE#373]) +3 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [FAIL][277] ([Intel XE#1178]) -> [SKIP][278] ([Intel XE#2423] / [i915#2575])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@srm.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][279] ([Intel XE#1188]) -> [SKIP][280] ([Intel XE#2423] / [i915#2575])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@uevent.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#308]) -> [SKIP][282] ([Intel XE#2423] / [i915#2575])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#323]) -> [SKIP][284] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#307]) -> [SKIP][286] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#455]) -> [SKIP][288] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#2136]) -> [SKIP][290] ([Intel XE#455])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1137]) -> [SKIP][292] ([Intel XE#2423] / [i915#2575])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#1135])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_feature_discovery@psr2.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][295] ([Intel XE#301]) -> [SKIP][296] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-panning-interruptible:
    - shard-bmg:          [DMESG-WARN][297] ([Intel XE#3468]) -> [DMESG-WARN][298] ([Intel XE#2705] / [Intel XE#3468])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-FAIL][299] ([Intel XE#1727]) -> [SKIP][300] ([Intel XE#2423] / [i915#2575])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#455]) -> [SKIP][302] ([Intel XE#2136]) +4 other tests skip
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:
    - shard-bmg:          [DMESG-FAIL][303] ([Intel XE#3468]) -> [DMESG-FAIL][304] ([Intel XE#2705] / [Intel XE#3468])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#651]) -> [SKIP][306] ([Intel XE#2136]) +25 other tests skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][307] ([Intel XE#2311]) -> [SKIP][308] ([Intel XE#2312]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][310] ([Intel XE#651]) +3 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][311] ([Intel XE#2050]) -> [INCOMPLETE][312] ([Intel XE#2050] / [Intel XE#3468])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          [DMESG-FAIL][313] ([Intel XE#3468]) -> [FAIL][314] ([Intel XE#2333]) +1 other test fail
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#2136]) -> [SKIP][316] ([Intel XE#651]) +4 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][317] ([Intel XE#651]) -> [SKIP][318] ([Intel XE#2136] / [Intel XE#2351]) +14 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#653]) -> [SKIP][320] ([Intel XE#2136]) +32 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][321] ([Intel XE#2313]) -> [SKIP][322] ([Intel XE#2312]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][324] ([Intel XE#653])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#653]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2351]) +8 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][328] ([Intel XE#658])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#2136]) -> [SKIP][330] ([Intel XE#653]) +7 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#605]) -> [SKIP][332] ([Intel XE#2423] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#346]) -> [SKIP][334] ([Intel XE#2136])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2925]) -> [SKIP][336] ([Intel XE#2136])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2927]) -> [SKIP][338] ([Intel XE#2136])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@lessee-list:
    - shard-dg2-set2:     [DMESG-WARN][339] -> [SKIP][340] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_lease@lessee-list.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_lease@lessee-list.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2423] / [i915#2575]) -> [SKIP][342] ([Intel XE#2763] / [Intel XE#455])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#870]) -> [SKIP][344] ([Intel XE#2136]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1129]) -> [SKIP][346] ([Intel XE#2136] / [Intel XE#2351])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#2136]) -> [SKIP][348] ([Intel XE#908])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [FAIL][349] -> [SKIP][350] ([Intel XE#2136])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#2136]) -> [SKIP][352] ([Intel XE#1489]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1489]) -> [SKIP][354] ([Intel XE#2136]) +9 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#1122]) -> [SKIP][356] ([Intel XE#2136])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][358] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][360] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][362] ([Intel XE#2136]) +12 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#2136]) -> [SKIP][364] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@psr2-primary-render.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1127]) -> [SKIP][366] ([Intel XE#2423] / [i915#2575])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#3414]) -> [SKIP][368] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2423] / [i915#2575]) -> [SKIP][370] ([Intel XE#3414])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2423] / [i915#2575]) -> [SKIP][372] ([Intel XE#455]) +1 other test skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][373] ([Intel XE#1729]) -> [SKIP][374] ([Intel XE#2423] / [i915#2575])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#1500]) -> [SKIP][376] ([Intel XE#2423] / [i915#2575])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#330]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@accuracy-idle@pipe-a-dp-2:
    - shard-bmg:          [DMESG-FAIL][379] ([Intel XE#3468]) -> [DMESG-WARN][380] ([Intel XE#3468]) +2 other tests dmesg-warn
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_vblank@accuracy-idle@pipe-a-dp-2.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_vblank@accuracy-idle@pipe-a-dp-2.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][381] ([Intel XE#2168]) -> [SKIP][382] ([Intel XE#2423] / [i915#2575])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_vrr@cmrr.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-suspend:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#455]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_vrr@flip-suspend.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_vrr@flip-suspend.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#756]) -> [SKIP][386] ([Intel XE#2423] / [i915#2575])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][388] ([Intel XE#2423] / [i915#2575])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-dg2-set2:     [DMESG-FAIL][389] ([Intel XE#3468]) -> [SKIP][390] ([Intel XE#1130])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_ccs@suspend-resume.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_ccs@suspend-resume.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][392] ([Intel XE#1130])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#1123]) -> [SKIP][394] ([Intel XE#1130])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1126]) -> [SKIP][396] ([Intel XE#1130])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1130]) -> [SKIP][398] ([Intel XE#2905]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2905]) -> [SKIP][400] ([Intel XE#1130]) +13 other tests skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][401] ([Intel XE#1473]) -> [FAIL][402] ([Intel XE#1000])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@twice-userptr-prefetch:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#1130]) -> [SKIP][404] ([Intel XE#288]) +7 other tests skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#288]) -> [SKIP][406] ([Intel XE#1130]) +32 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exercise_blt@fast-copy:
    - shard-dg2-set2:     [INCOMPLETE][407] ([Intel XE#1195]) -> [SKIP][408] ([Intel XE#1130])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_exercise_blt@fast-copy.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_exercise_blt@fast-copy.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][409] ([Intel XE#3343]) -> [SKIP][410] ([Intel XE#1130])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#1130]) -> [DMESG-WARN][412] ([Intel XE#3467])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
    - shard-bmg:          [FAIL][413] ([Intel XE#3499]) -> [DMESG-FAIL][414] ([Intel XE#3467])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-dg2-set2:     [DMESG-WARN][415] ([Intel XE#3467]) -> [SKIP][416] ([Intel XE#1130]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#560]) -> [SKIP][418] ([Intel XE#1130])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#1130]) -> [SKIP][420] ([Intel XE#2541]) +1 other test skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#2541]) -> [SKIP][422] ([Intel XE#1130]) +9 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_oa@mi-rpc.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_oa@mi-rpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][423] ([Intel XE#1173]) -> [SKIP][424] ([Intel XE#1061])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_peer2peer@read.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#1130]) -> [SKIP][426] ([Intel XE#2284] / [Intel XE#366])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][428] ([Intel XE#1130]) +1 other test skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [DMESG-WARN][429] ([Intel XE#3468]) -> [SKIP][430] ([Intel XE#1130])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_pm@s2idle-basic.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     [DMESG-WARN][431] ([Intel XE#569]) -> [SKIP][432] ([Intel XE#1130])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][433] ([Intel XE#2280]) -> [SKIP][434] ([Intel XE#1130])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     [SKIP][435] ([Intel XE#944]) -> [SKIP][436] ([Intel XE#1130]) +2 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#1130]) -> [SKIP][438] ([Intel XE#944]) +1 other test skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#1130]) -> [SKIP][440] ([Intel XE#3342])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-dg2-set2:     [DMESG-WARN][441] -> [SKIP][442] ([Intel XE#1130])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_vm@large-split-binds-2147483648.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_vm@large-split-binds-2147483648.html

  * igt@xe_vm@large-split-misaligned-binds-8388608:
    - shard-dg2-set2:     [DMESG-WARN][443] ([Intel XE#1727]) -> [SKIP][444] ([Intel XE#1130]) +2 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_vm@large-split-misaligned-binds-8388608.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_vm@large-split-misaligned-binds-8388608.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507
  [Intel XE#3514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -> xe-pw-141524v1

  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
  xe-pw-141524v1: 141524v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/index.html

--===============5021379893750772410==
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
<tr><td><b>Series:</b></td><td>UMD direct submission in Xe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141524/">https://patchwork.freedesktop.org/series/141524/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_full -&gt; xe-pw-141524v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141524v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141524v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141524v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_atomic_interruptible@legacy-setmode@pipe-a-hdmi-a-3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_color@degamma@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_color@degamma@pipe-a-dp-2.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_force_connector_basic@force-edid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_force_connector_basic@force-edid.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_psr@psr-sprite-render@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_psr@psr-sprite-render@edp-1.html">DMESG-WARN</a> +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_ccs@large-ctrl-surf-copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-433/igt@xe_exec_threads@threads-bal-fd-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-256.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@xe_exec_threads@threads-bal-shared-vm-userptr.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-8/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">ABORT</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-435/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@xe_pm@d3hot-mmap-vram.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_wedged@wedged-at-any-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@xe_wedged@wedged-at-any-timeout.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141524v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +100 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_dp_aux_dev.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning@bd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-1/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_rpm@cursor.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_pm_rpm@universal-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_pm_rpm@universal-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-59:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@kms_pm_rpm@universal-planes@plane-59.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-59.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3514">Intel XE#3514</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_exec_basic@no-exec-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_exec_basic@no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +190 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-5/igt@xe_oa@stress-open-close@rcs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-8/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507">Intel XE#3507</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_vm@munmap-style-unbind-userptr-inval-many-either-side-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +30 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@core_hotunplug@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105">Intel XE#3105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@a-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-6/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@b-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_flip@flip-vs-suspend@c-dp2.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-render.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-8/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@blob-prop-lifetime:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_prop_blob@blob-prop-lifetime.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_prop_blob@blob-prop-lifetime.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-180.html">PASS</a> +26 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@xe_ccs@block-copy-compressed@xmajor-compressed-compfmt0-vram01-vram01.html">PASS</a> +21 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_ccs@ctrl-surf-copy-new-ctx.html">PASS</a> +39 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-3/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@unload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_module_load@unload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_module_load@unload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-adlp-2/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-464/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_atomic@test-only.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_atomic@test-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-lnl-5/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-1/igt@kms_big_fb@linear-16bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_flip@flip-vs-panning-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_lease@lessee-list.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_lease@lessee-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@kms_scaling_modes@scaling-mode-full-aspect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_vblank@accuracy-idle@pipe-a-dp-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@kms_vblank@accuracy-idle@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_ccs@suspend-resume.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-464/igt@xe_evict@evict-mixed-many-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exercise_blt@fast-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_exercise_blt@fast-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_exercise_blt@fast-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-bmg-6/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@xe_oa@closed-fd-and-unmapped-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_oa@mi-rpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_pm@s2idle-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-436/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-463/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_vm@large-split-binds-2147483648.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-434/igt@xe_vm@large-split-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-8388608:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_vm@large-split-misaligned-binds-8388608.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141524v1/shard-dg2-466/igt@xe_vm@large-split-misaligned-binds-8388608.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -&gt; xe-pw-141524v1</li>
</ul>
<p>IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6<br />
  xe-pw-141524v1: 141524v1</p>

</body>
</html>

--===============5021379893750772410==--
