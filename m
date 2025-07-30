Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7726C87FCA
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 01:36:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3523310E34F;
	Wed, 30 Jul 2025 01:36:54 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7450510E34F;
 Wed, 30 Jul 2025 01:36:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4393440978393340654=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Driver_Managed_e?=
 =?utf-8?q?xhaustive_eviction?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 30 Jul 2025 01:36:52 -0000
Message-ID: <175383941246.197849.18313754228310313390@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250729153138.2627-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250729153138.2627-1-thomas.hellstrom@linux.intel.com>
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

--===============4393440978393340654==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Driver Managed exhaustive eviction
URL   : https://patchwork.freedesktop.org/series/152243/
State : failure

== Summary ==

CI Bug Log - changes from xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678_FULL -> xe-pw-152243v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-152243v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-152243v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-152243v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][1] -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@intel_hwmon@hwmon-read.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@legacy-format:
    - shard-adlp:         [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-1/igt@kms_addfb_basic@legacy-format.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-6/igt@kms_addfb_basic@legacy-format.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6] +4 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-463/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-433/igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         [PASS][7] -> [FAIL][8] +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-4/igt@kms_fbcon_fbt@fbc-suspend.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][9] -> [SKIP][10] +79 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-adlp:         [PASS][11] -> [SKIP][12] +6 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - shard-bmg:          [PASS][13] -> [ABORT][14] +12 other tests abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [PASS][15] -> [ABORT][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-464/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@xe_exec_system_allocator@twice-large-new-race:
    - shard-bmg:          [SKIP][17] ([Intel XE#4945]) -> [ABORT][18] +5 other tests abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_exec_system_allocator@twice-large-new-race.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-3/igt@xe_exec_system_allocator@twice-large-new-race.html

  
Known issues
------------

  Here are the changes found in xe-pw-152243v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#4672])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@core_getversion@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@core_getversion@basic.html

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#4963]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#4674])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@core_setmaster@master-drop-set-user.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@read:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#2134])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@fbdev@read.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@fbdev@read.html

  * igt@kms_addfb_basic@size-max:
    - shard-adlp:         [PASS][27] -> [SKIP][28] ([Intel XE#4950]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_addfb_basic@size-max.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_addfb_basic@size-max.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-adlp:         [PASS][29] -> [DMESG-FAIL][30] ([Intel XE#4543]) +4 other tests dmesg-fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-6/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#4947]) +18 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#3862]) +2 other tests incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][35] ([Intel XE#3862])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#787]) +97 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2.html

  * igt@kms_content_protection@legacy@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][38] ([Intel XE#1178])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@kms_content_protection@legacy@pipe-a-dp-2.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4494] / [i915#3804])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#301]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-panning@a-hdmi-a1:
    - shard-adlp:         [PASS][42] -> [DMESG-WARN][43] ([Intel XE#4543]) +9 other tests dmesg-warn
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-2/igt@kms_flip@flip-vs-panning@a-hdmi-a1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-9/igt@kms_flip@flip-vs-panning@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953] / [Intel XE#4173]) +6 other tests dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-adlp:         [PASS][46] -> [DMESG-FAIL][47] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:
    - shard-adlp:         [PASS][48] -> [SKIP][49] ([Intel XE#4947]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#651]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#4950]) +74 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_lease@setcrtc-implicit-plane.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][53] -> [SKIP][54] ([Intel XE#4962]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [PASS][55] -> [SKIP][56] ([Intel XE#4945]) +403 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [PASS][57] -> [SKIP][58] ([Intel XE#1392]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-433/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunmap:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#4915])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-436/igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:
    - shard-bmg:          [PASS][60] -> [INCOMPLETE][61] ([Intel XE#5401])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-8/igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2229])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [PASS][64] -> [FAIL][65] ([Intel XE#5679])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@many-reload.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@many-reload.html

  * igt@xe_vm@large-userptr-split-binds-2147483648:
    - shard-adlp:         [PASS][66] -> [SKIP][67] ([Intel XE#4945]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_vm@large-userptr-split-binds-2147483648.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@xe_vm@large-userptr-split-binds-2147483648.html

  
#### Possible fixes ####

  * igt@kms_atomic_interruptible@universal-setplane-cursor:
    - shard-bmg:          [SKIP][68] ([Intel XE#4950]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_atomic_interruptible@universal-setplane-cursor.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@kms_atomic_interruptible@universal-setplane-cursor.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-adlp:         [DMESG-WARN][70] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][71] +5 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-4/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-3/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][72] ([Intel XE#4947]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][74] ([Intel XE#4543]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][76] ([Intel XE#4543]) -> [PASS][77] +7 other tests pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     [FAIL][78] ([Intel XE#616]) -> [PASS][79] +5 other tests pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][80] ([Intel XE#718]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-9/igt@kms_pm_dc@dc6-dpms.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1392]) -> [PASS][83] +9 other tests pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-464/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][84], [PASS][85], [PASS][86], [PASS][87], [PASS][88], [PASS][89], [PASS][90], [PASS][91], [PASS][92], [PASS][93], [PASS][94], [PASS][95], [PASS][96], [PASS][97], [PASS][98], [PASS][99], [PASS][100], [PASS][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [SKIP][107], [PASS][108], [PASS][109]) ([Intel XE#2457]) -> ([PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-4/igt@xe_module_load@load.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_module_load@load.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-3/igt@xe_module_load@load.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-1/igt@xe_module_load@load.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_module_load@load.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-1/igt@xe_module_load@load.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_module_load@load.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-4/igt@xe_module_load@load.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-3/igt@xe_module_load@load.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-4/igt@xe_module_load@load.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-1/igt@xe_module_load@load.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@load.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@load.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@load.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-4/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-2/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-2/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-2/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-3/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-4/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-4/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-8/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-8/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-7/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-3/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-7/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][134] ([Intel XE#5166]) -> [PASS][135] +1 other test pass
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@xe_pmu@gt-frequency.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-464/igt@xe_pmu@gt-frequency.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-bmg:          [SKIP][136] ([Intel XE#4945]) -> [PASS][137] +9 other tests pass
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_vm@large-misaligned-binds-2147483648.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-bmg:          [SKIP][138] ([Intel XE#3768]) -> [SKIP][139] ([Intel XE#4950])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_async_flips@invalid-async-flip-atomic.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][140] ([Intel XE#2370]) -> [SKIP][141] ([Intel XE#4950])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][142] ([Intel XE#2327]) -> [SKIP][143] ([Intel XE#4947]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][144] ([Intel XE#4543]) -> [SKIP][145] ([Intel XE#4947])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][146] ([Intel XE#2328]) -> [SKIP][147] ([Intel XE#4947])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_big_fb@y-tiled-addfb.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][148] ([Intel XE#607]) -> [SKIP][149] ([Intel XE#4947])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][150] ([Intel XE#1124]) -> [SKIP][151] ([Intel XE#4947]) +7 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-bmg:          [SKIP][152] ([Intel XE#610]) -> [SKIP][153] ([Intel XE#4947])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         [SKIP][154] ([Intel XE#2191]) -> [SKIP][155] ([Intel XE#4950])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [SKIP][156] ([Intel XE#367]) -> [SKIP][157] ([Intel XE#4950]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][158] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][159] ([Intel XE#4947])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          [SKIP][160] ([Intel XE#2887]) -> [SKIP][161] ([Intel XE#4947]) +13 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][162] ([Intel XE#3432]) -> [SKIP][163] ([Intel XE#4947]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][164] ([Intel XE#2724]) -> [SKIP][165] ([Intel XE#4947]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_cdclk@plane-scaling.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][166] ([Intel XE#2325]) -> [SKIP][167] ([Intel XE#4950])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_chamelium_color@ctm-green-to-red.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:
    - shard-adlp:         [SKIP][168] ([Intel XE#373]) -> [SKIP][169] ([Intel XE#4950]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-bmg:          [SKIP][170] ([Intel XE#4950]) -> [SKIP][171] ([Intel XE#2252])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][172] ([Intel XE#2252]) -> [SKIP][173] ([Intel XE#4950]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          [SKIP][174] ([Intel XE#2390]) -> [SKIP][175] ([Intel XE#4950])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-adlp:         [SKIP][176] ([Intel XE#455]) -> [SKIP][177] ([Intel XE#4950]) +1 other test skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_content_protection@type1.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-random-32x32:
    - shard-bmg:          [SKIP][178] ([Intel XE#2320]) -> [SKIP][179] ([Intel XE#4950]) +5 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_cursor_crc@cursor-random-32x32.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][180] ([Intel XE#4950]) -> [SKIP][181] ([Intel XE#2321])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x512.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][182] ([Intel XE#2321]) -> [SKIP][183] ([Intel XE#4950])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][184] ([Intel XE#2291]) -> [SKIP][185] ([Intel XE#4950]) +1 other test skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][186] ([Intel XE#4950]) -> [SKIP][187] ([Intel XE#2286])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][188] ([Intel XE#1508]) -> [SKIP][189] ([Intel XE#4947])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][190] ([Intel XE#4302]) -> [SKIP][191] ([Intel XE#4950])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          [SKIP][192] ([Intel XE#2244]) -> [SKIP][193] ([Intel XE#4947]) +1 other test skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_dsc@dsc-with-bpc-formats.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][194] ([Intel XE#2375]) -> [SKIP][195] ([Intel XE#4950])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_feature_discovery@dp-mst.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [SKIP][196] ([Intel XE#2316]) -> [SKIP][197] ([Intel XE#4950])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-adlp:         [SKIP][198] ([Intel XE#310]) -> [SKIP][199] ([Intel XE#4950])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][200] ([Intel XE#2380]) -> [SKIP][201] ([Intel XE#4947])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][202] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][203] ([Intel XE#4947]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][204] ([Intel XE#2311]) -> [SKIP][205] ([Intel XE#4947]) +23 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][206] ([Intel XE#5390]) -> [SKIP][207] ([Intel XE#4947]) +14 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][208] ([Intel XE#4947]) -> [SKIP][209] ([Intel XE#2311])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:
    - shard-adlp:         [SKIP][210] ([Intel XE#651]) -> [SKIP][211] ([Intel XE#4947]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][212] ([Intel XE#2313]) -> [SKIP][213] ([Intel XE#4947]) +26 other tests skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#4947]) -> [SKIP][215] ([Intel XE#2313]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][216] ([Intel XE#2312]) -> [SKIP][217] ([Intel XE#4947]) +8 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][218] ([Intel XE#4947]) -> [SKIP][219] ([Intel XE#2312])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][220] ([Intel XE#1503]) -> [SKIP][221] ([Intel XE#4950]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-adlp:         [SKIP][222] ([Intel XE#2925]) -> [SKIP][223] ([Intel XE#4947])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][224] ([Intel XE#2393]) -> [SKIP][225] ([Intel XE#4950])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_plane_lowres@tiling-yf.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [SKIP][226] ([Intel XE#2763]) -> [SKIP][227] ([Intel XE#4950])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][228] ([Intel XE#870]) -> [SKIP][229] ([Intel XE#4947])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_pm_backlight@fade.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-bmg:          [SKIP][230] ([Intel XE#2392]) -> [SKIP][231] ([Intel XE#4947])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_pm_dc@dc5-psr.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][232] ([Intel XE#1489]) -> [SKIP][233] ([Intel XE#4947]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          [SKIP][234] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][235] ([Intel XE#4947]) +15 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_psr@fbc-psr-primary-render.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][236] ([Intel XE#2414]) -> [SKIP][237] ([Intel XE#4947])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][238] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][239] ([Intel XE#4950]) +1 other test skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_rotation_crc@primary-rotation-90.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][240] ([Intel XE#1435]) -> [SKIP][241] ([Intel XE#4950])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1500]) -> [SKIP][243] ([Intel XE#362])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][244] ([Intel XE#1499]) -> [SKIP][245] ([Intel XE#4950]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-vrr.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][246] ([Intel XE#2504]) -> [SKIP][247] ([Intel XE#4945])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_create@multigpu-create-massive-size.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][248] ([Intel XE#4837]) -> [SKIP][249] ([Intel XE#4945]) +12 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_eudebug_online@single-step.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_eudebug_online@single-step.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:
    - shard-bmg:          [SKIP][250] ([Intel XE#4945]) -> [SKIP][251] ([Intel XE#4837]) +2 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][252] ([Intel XE#2322]) -> [SKIP][253] ([Intel XE#4945]) +8 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         [SKIP][254] ([Intel XE#1392] / [Intel XE#5575]) -> [SKIP][255] ([Intel XE#4945]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm:
    - shard-adlp:         [SKIP][256] ([Intel XE#288] / [Intel XE#5561]) -> [SKIP][257] ([Intel XE#4945]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         [SKIP][258] ([Intel XE#4915] / [Intel XE#5560]) -> [SKIP][259] ([Intel XE#4945]) +15 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_exec_system_allocator@processes-evict-malloc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [SKIP][260] ([Intel XE#4943]) -> [SKIP][261] ([Intel XE#4945]) +25 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][262] ([Intel XE#4945]) -> [SKIP][263] ([Intel XE#4943])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          [SKIP][264] ([Intel XE#2245]) -> [SKIP][265] ([Intel XE#4945])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_pat@pat-index-xelp.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][266] ([Intel XE#2236]) -> [SKIP][267] ([Intel XE#4945])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [FAIL][268] ([Intel XE#1173]) -> [SKIP][269] ([Intel XE#1061])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-433/igt@xe_peer2peer@read.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][270] ([Intel XE#4945]) -> [SKIP][271] ([Intel XE#2284])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_pm@d3cold-basic.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][272] ([Intel XE#579]) -> [SKIP][273] ([Intel XE#4945])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-black-pxp-fb:
    - shard-bmg:          [SKIP][274] ([Intel XE#4733]) -> [SKIP][275] ([Intel XE#4945]) +2 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_pxp@display-black-pxp-fb.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pxp@display-black-pxp-fb.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          [SKIP][276] ([Intel XE#944]) -> [SKIP][277] ([Intel XE#4945]) +1 other test skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_query@multigpu-query-mem-usage.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          [SKIP][278] ([Intel XE#4945]) -> [SKIP][279] ([Intel XE#944])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          [SKIP][280] ([Intel XE#4945]) -> [SKIP][281] ([Intel XE#4130])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5401
  [Intel XE#5560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5624
  [Intel XE#5679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5679
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678 -> xe-pw-152243v1

  IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678: b6a72d53a8082ee6ef701042e7cb8a93d6a2b678
  xe-pw-152243v1: 152243v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/index.html

--===============4393440978393340654==
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
<tr><td><b>Series:</b></td><td>drm/xe: Driver Managed exhaustive eviction</=
td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/152243/">https://patchwork.freedesktop.org/series/152243/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152243v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152243v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d=
6a2b678_FULL -&gt; xe-pw-152243v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-152243v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-152243v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1522=
43v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@intel_hwmon@hwmon-read.html">S=
KIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@legacy-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-1/igt@kms_add=
fb_basic@legacy-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-6/igt@kms_addfb_basic@legac=
y-format.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-463/igt@kms_di=
rtyfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-433/igt@kms_dirt=
yfb@fbc-dirtyfb-ioctl@a-hdmi-a-6.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-4/igt@kms_fbc=
on_fbt@fbc-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152243v1/shard-adlp-3/igt@kms_fbcon_fbt@fbc-suspend=
.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-d=
g2-432/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html=
">SKIP</a> +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbc-tiling-linear.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-2/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/s=
hard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-n=
omemset.html">ABORT</a> +12 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-434/igt@xe_wed=
ged@wedged-mode-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-464/igt@xe_wedged@wedged-mod=
e-toggle.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_system_allocator@twice-large-new-race:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_exec_=
system_allocator@twice-large-new-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg=
-3/igt@xe_exec_system_allocator@twice-large-new-race.html">ABORT</a> +5 oth=
er tests abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152243v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@core_get=
version@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@core_getversion@basic.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4672"=
>Intel XE#4672</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@core_hot=
unplug@unplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@core_hotunplug@unplug-re=
scan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4963">Intel XE#4963</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@core_set=
master@master-drop-set-user.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@core_setmaster@ma=
ster-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@fbdev@re=
ad.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152243v1/shard-bmg-5/igt@fbdev@read.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@size-max:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_add=
fb_basic@size-max.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_addfb_basic@size-max.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-1/igt@kms_big=
_fb@y-tiled-16bpp-rotate-180.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-6/igt@kms_big_fb@y-ti=
led-16bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 other tests dmes=
g-fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-466/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend=
-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-=
6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-463/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +97 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-t=
iled-mtl-rc-ccs-cc@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@kms_content_protection@lega=
cy@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-2/igt@kms_fli=
p@flip-vs-panning@a-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-9/igt@kms_flip@flip-vs=
-panning@a-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +9 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-8/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-2/igt@kms_flip@fli=
p-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)=
 +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shar=
d-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscalin=
g.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4543">Intel XE#4543</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +1 other test dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/i=
gt@kms_frontbuffer_tracking@fbc-1p-pri-indfb-multidraw.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_leas=
e@setcrtc-implicit-plane.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_lease@setcrtc-im=
plicit-plane.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4950">Intel XE#4950</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_pm_r=
pm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_pm_rpm@dpms-m=
ode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4962">Intel XE#4962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_exec_=
basic@many-bindexecqueue-rebind.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_exec_basic=
@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +403 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152243v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-b=
indexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-remap-ro-dontunm=
ap:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-dg2-436/igt@xe_exec_system_allocator@ma=
ny-large-execqueues-mmap-remap-ro-dontunmap.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc-mix-bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_exec_=
system_allocator@processes-evict-malloc-mix-bo.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-8/ig=
t@xe_exec_system_allocator@processes-evict-malloc-mix-bo.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5401">In=
tel XE#5401</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_live_=
ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_liv=
e_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_modul=
e_load@many-reload.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@many-reload=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5679">Intel XE#5679</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_vm@l=
arge-userptr-split-binds-2147483648.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@xe_vm@la=
rge-userptr-split-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +4 other te=
sts skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_interruptible@universal-setplane-cursor:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_atom=
ic_interruptible@universal-setplane-cursor.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shar=
d-bmg-1/igt@kms_atomic_interruptible@universal-setplane-cursor.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-4/igt@kms_big=
_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1=
/shard-adlp-3/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> +5 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_big_=
fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/ig=
t@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">I=
ntel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152243v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-ro=
tate-0-hflip-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-8/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-=
adlp-3/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> +7 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-463/igt@kms_pl=
ane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard=
-dg2-463/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">PASS</=
a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-9/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-464/igt@xe=
_exec_basic@multigpu-once-null.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-3/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2=
b678/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93=
d6a2b678/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb=
8a93d6a2b678/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042=
e7cb8a93d6a2b678/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef70=
1042e7cb8a93d6a2b678/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6=
ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a808=
2ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53=
a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-b6a7=
2d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3486-=
b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-=
bmg-4/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b67=
8/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152243v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152243v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-b=
mg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-3/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-7/igt@xe_mod=
ule_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-464/igt@xe_pmu@gt-frequ=
ency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_vm@la=
rge-misaligned-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/ig=
t@xe_vm@large-misaligned-binds-2147483648.html">PASS</a> +9 other tests pas=
s</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_asyn=
c_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/i=
gt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152243v1/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_big=
_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/i=
gt@kms_big_fb@x-tiled-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_big_=
fb@y-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_big_fb@y-t=
iled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_big_=
fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5=
/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/s=
hard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
47">Intel XE#4947</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_big_=
fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@k=
ms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_bw@=
connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/s=
hard-adlp-1/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_bw@l=
inear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/ig=
t@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_ccs=
@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/s=
hard-adlp-1/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_ccs@=
crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-=
5/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bm=
g-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_cdcl=
k@plane-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2724">Intel XE#2724</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_cdclk@plane=
-scaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_cham=
elium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@km=
s_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-4k:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_cha=
melium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-ad=
lp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-4k.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE=
#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_cham=
elium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-=
1/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/ig=
t@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +8 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/ig=
t@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_con=
tent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x32:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_curs=
or_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_=
cursor_crc@cursor-random-32x32.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@km=
s_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel =
XE#4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152243v1/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_disp=
lay_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@k=
ms_display_modes@extended-mode-basic.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_dsc@ds=
c-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_feat=
ure_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_featur=
e_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_flip=
@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg=
-5/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#495=
0</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_fli=
p@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-adlp-=
1/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-152243v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-152243v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-ind=
fb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4947">Intel XE#4947</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
43v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-indfb-pgflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4947">Intel XE#4947</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel=
 XE#4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-152243v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/sha=
rd-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-shrfb-scaledprimary.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-152243v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4=
947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
43v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-=
onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#=
4947</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
152243v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_hdr@static-to=
ggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@kms_joi=
ner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shar=
d-adlp-1/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">In=
tel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-152243v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-do=
wnscale-factor-0-75.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_pm_b=
acklight@fade.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_pm_backlight@fa=
de.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_pm_d=
c@dc5-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2392">Intel XE#2392</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_pm_dc@dc5-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_psr2=
_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-b=
mg-5/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_psr@=
fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-=
5/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) +15 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/sha=
rd-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_rota=
tion_crc@primary-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shar=
d-bmg-5/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a=
>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-432/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/s=
hard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/36=
2">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_creat=
e@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/ig=
t@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_eudeb=
ug_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_eudebu=
g_online@single-step.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-vram:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_eudeb=
ug_online@writes-caching-sram-bb-vram-target-vram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1522=
43v1/shard-bmg-1/igt@xe_eudebug_online@writes-caching-sram-bb-vram-target-v=
ram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) =
+8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_exec=
_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-imm.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">I=
ntel XE#288</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5561">Intel XE#5561</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-152243v1/shard-adlp-1/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-adlp-6/igt@xe_exec=
_system_allocator@processes-evict-malloc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5560">Intel XE#5=
560</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
52243v1/shard-adlp-1/igt@xe_exec_system_allocator@processes-evict-malloc.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4945">Intel XE#4945</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge-nome=
mset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_exec_=
system_allocator@threads-many-execqueues-mmap-free-huge-nomemset.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">=
Intel XE#4943</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-152243v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-exe=
cqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +25 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nome=
mset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Int=
el XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_pat@p=
at-index-xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2245">Intel XE#2245</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pat@pat-index-=
xelp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2236">Intel XE#2236</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-dg2-433/igt@xe_pee=
r2peer@read.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-dg2-432/igt@xe_peer2peer@read=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-6/igt@xe_pm@d3cold-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-6/igt@xe_pm@vr=
am-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pm@vram-d3=
cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-black-pxp-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-2/igt@xe_pxp@d=
isplay-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_pxp@disp=
lay-black-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-7/igt@xe_query=
@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-5/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_query=
@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-1/i=
gt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678/shard-bmg-5/igt@xe_sriov=
_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152243v1/shard-bmg-4=
/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a=
>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678 -&gt; xe-pw-152=
243v1</li>
</ul>
<p>IGT_8478: 3e7c2bd685397f852853878aef4d9c1e4889a28b @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-3486-b6a72d53a8082ee6ef701042e7cb8a93d6a2b678: b6a72d53a8082ee6ef70104=
2e7cb8a93d6a2b678<br />
  xe-pw-152243v1: 152243v1</p>

</body>
</html>

--===============4393440978393340654==--
