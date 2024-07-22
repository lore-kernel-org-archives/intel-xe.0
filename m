Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE871C3DA5D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jul 2024 18:51:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABCA10E298;
	Mon, 22 Jul 2024 18:51:18 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6CD10E2BE;
 Mon, 22 Jul 2024 18:51:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3395680920010399317=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Add_assert_for_XE=5FW?=
 =?utf-8?q?A=28=29_usage_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Jul 2024 18:51:16 -0000
Message-ID: <172167427611.342859.2296688523848852689@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722160815.4085605-1-lucas.demarchi@intel.com>
In-Reply-To: <20240722160815.4085605-1-lucas.demarchi@intel.com>
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

--===============3395680920010399317==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add assert for XE_WA() usage (rev2)
URL   : https://patchwork.freedesktop.org/series/136146/
State : failure

== Summary ==

CI Bug Log - changes from xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b_full -> xe-pw-136146v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136146v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136146v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136146v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-dg2-set2:     [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  
Known issues
------------

  Here are the changes found in xe-pw-136146v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][3] -> [FAIL][4] ([Intel XE#1426]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#1659])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][7] ([Intel XE#1201] / [Intel XE#316])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][8] -> [FAIL][9] ([Intel XE#1231])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         [PASS][10] -> [SKIP][11] ([Intel XE#1201]) +4 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][12] ([Intel XE#1124] / [Intel XE#1201])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#1512])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#373])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1421])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#310])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:
    - shard-lnl:          [PASS][22] -> [FAIL][23] ([Intel XE#886]) +3 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         NOTRUN -> [FAIL][24] ([Intel XE#1874]) +5 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#656]) +7 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-rte.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1201] / [Intel XE#651]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#651])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#651])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1158] / [Intel XE#1201])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#1341])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane@pixel-format:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][32] ([Intel XE#1035] / [Intel XE#1195])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane@pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-adlp:         [PASS][33] -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#455]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#836])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#327])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:
    - shard-lnl:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#2052] / [Intel XE#2225]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1126] / [Intel XE#1201])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#261])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][45] -> [TIMEOUT][46] ([Intel XE#1473] / [Intel XE#402])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][47] -> [TIMEOUT][48] ([Intel XE#1473])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][49] -> [TIMEOUT][50] ([Intel XE#1473] / [Intel XE#392])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-434/igt@xe_evict@evict-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#1392])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [PASS][52] -> [DMESG-WARN][53] ([Intel XE#2226]) +8 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#288])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-432/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-basic:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - shard-lnl:          [PASS][56] -> [FAIL][57] ([Intel XE#2262])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-4/igt@xe_gt_freq@freq_fixed_idle.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [PASS][58] -> [DMESG-WARN][59] ([Intel XE#1191] / [Intel XE#1727] / [Intel XE#2226])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][60] -> [ABORT][61] ([Intel XE#1358])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [PASS][62] -> [ABORT][63] ([Intel XE#1794])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#944])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-adlp:         [PASS][65] -> [ABORT][66] ([Intel XE#2271])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-9/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  
#### Possible fixes ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [FAIL][67] ([Intel XE#1659]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_cursor_crc@cursor-random-64x21:
    - shard-adlp:         [INCOMPLETE][69] ([Intel XE#1195]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-9/igt@kms_cursor_crc@cursor-random-64x21.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random-64x21.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-legacy:
    - shard-lnl:          [DMESG-WARN][71] ([Intel XE#1638]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html

  * {igt@kms_plane@plane-position-covered@pipe-a-plane-4}:
    - shard-lnl:          [DMESG-FAIL][73] ([Intel XE#324]) -> [PASS][74] +2 other tests pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html

  * {igt@kms_plane@plane-position-covered@pipe-b-plane-4}:
    - shard-lnl:          [DMESG-WARN][75] ([Intel XE#324]) -> [PASS][76] +2 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:
    - shard-lnl:          [DMESG-WARN][77] -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][79] ([Intel XE#771] / [Intel XE#899]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#771] / [Intel XE#899]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][83] ([Intel XE#899]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][85] ([Intel XE#899]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          [DMESG-WARN][87] ([Intel XE#2052]) -> [PASS][88] +3 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * {igt@xe_exec_mix_modes@exec-simple-batch-store-lr}:
    - shard-lnl:          [FAIL][89] ([Intel XE#1069]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-7/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-4/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][91] ([Intel XE#2105] / [Intel XE#2345]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-dg2-set2:     [ABORT][93] ([Intel XE#2271]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-lnl:          [FAIL][95] -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@xe_gt_freq@freq_low_max.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-adlp:         [FAIL][97] ([Intel XE#1924] / [Intel XE#2028]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-4/igt@xe_pm@s3-vm-bind-userptr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-1/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][99] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][100]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@xe_pm@s4-exec-after.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-adlp:         [SKIP][101] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][102] ([Intel XE#1201]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-WARN][103] ([Intel XE#324]) -> [FAIL][104] ([Intel XE#1231])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][105] ([Intel XE#324]) -> [FAIL][106] ([Intel XE#1231])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][107] ([Intel XE#324]) -> [FAIL][108] ([Intel XE#1242])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][109] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][110] ([Intel XE#1201]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][111] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][112] ([Intel XE#1201])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][113] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][114] ([Intel XE#1201]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][115] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][116] ([Intel XE#1201]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         [FAIL][117] ([Intel XE#1874]) -> [SKIP][118] ([Intel XE#1201])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         [SKIP][119] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][120] ([Intel XE#1201])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#1201] / [Intel XE#362]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#1500])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-dg2-set2:     [DMESG-WARN][123] ([Intel XE#1760]) -> [DMESG-FAIL][124] ([Intel XE#1760])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052
  [Intel XE#2078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2078
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2225
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2345
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b -> xe-pw-136146v2

  IGT_7933: 7933
  xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b: 14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b
  xe-pw-136146v2: 136146v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/index.html

--===============3395680920010399317==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add assert for XE_WA() usage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136146/">https://patchwork.freedesktop.org/series/136146/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b_full -&gt; xe-pw-136146v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136146v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136146v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136146v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-436/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136146v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_frontbuffer_tracking@drrs-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-8/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-1/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-system.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052">Intel XE#2052</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2225">Intel XE#2225</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_evict@evict-beng-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-432/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-4/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-9/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-6/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x21:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-9/igt@kms_cursor_crc@cursor-random-64x21.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-4/igt@kms_cursor_crc@cursor-random-64x21.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-4/igt@kms_cursor_legacy@cursora-vs-flipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-a-plane-4}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-covered@pipe-b-plane-4}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-2/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2052">Intel XE#2052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_mix_modes@exec-simple-batch-store-lr}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-7/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-4/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2345">Intel XE#2345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-466/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-432/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@xe_gt_freq@freq_low_max.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@xe_gt_freq@freq_low_max.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-4/igt@xe_pm@s3-vm-bind-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1924">Intel XE#1924</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-1/igt@xe_pm@s3-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b/shard-dg2-433/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136146v2/shard-dg2-464/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b -&gt; xe-pw-136146v2</li>
</ul>
<p>IGT_7933: 7933<br />
  xe-1643-14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b: 14a3cba64e7d9a418b7f9cffdc266c6bdf546a3b<br />
  xe-pw-136146v2: 136146v2</p>

</body>
</html>

--===============3395680920010399317==--
