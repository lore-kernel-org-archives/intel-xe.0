Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D391AC021B1
	for <intel-xe@archiver.kernel.org>; Thu, 20 Feb 2025 11:12:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 894F410E952;
	Thu, 20 Feb 2025 11:12:18 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9010E93E;
 Thu, 20 Feb 2025 11:12:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1561288842010949641=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_drm_sharpness_pr?=
 =?utf-8?q?operty_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Feb 2025 11:12:16 -0000
Message-ID: <174004993677.175264.6249396432162407888@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
In-Reply-To: <20250219115359.2320992-1-nemesa.garg@intel.com>
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

--===============1561288842010949641==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev8)
URL   : https://patchwork.freedesktop.org/series/139954/
State : failure

== Summary ==

CI Bug Log - changes from xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f_full -> xe-pw-139954v8_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139954v8_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139954v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139954v8_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotreplug:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +6 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-adlp:         [PASS][3] -> [INCOMPLETE][4] +13 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_atomic_transition@modeset-transition.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][5] +466 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a1:
    - shard-adlp:         NOTRUN -> [FAIL][6] +147 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8] +1086 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [PASS][9] -> [SKIP][10] +99 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4:
    - shard-bmg:          NOTRUN -> [SKIP][11] +88 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][12] -> [SKIP][13] +65 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] +328 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][16] -> [INCOMPLETE][17] +13 other tests incomplete
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_invalid_mode@bad-vsync-end@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][18] +390 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_invalid_mode@bad-vsync-end@pipe-c-hdmi-a-6.html

  * igt@kms_pipe_stress@stress-xrgb8888-untiled:
    - shard-adlp:         [PASS][19] -> [DMESG-FAIL][20] +1 other test dmesg-fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html

  * igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][21] +6 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1.html

  * igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] +12 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-6.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][23] -> [INCOMPLETE][24] +10 other tests incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_setmode@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][25] +4 other tests incomplete
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][26] +5 other tests incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][27] -> [FAIL][28] +623 other tests fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][29] -> [FAIL][30] +855 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][31] +5 other tests dmesg-warn
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] +31 other tests dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [PASS][34] -> [DMESG-WARN][35] +8 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] +31 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][38] +4 other tests dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-dg2-set2:     [SKIP][39] ([Intel XE#455]) -> [INCOMPLETE][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][41] ([Intel XE#2327]) -> [FAIL][42] +15 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [DMESG-FAIL][43] ([Intel XE#4330]) -> [FAIL][44] +9 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][45] ([Intel XE#316]) -> [FAIL][46] +16 other tests fail
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][47] ([Intel XE#316]) -> [FAIL][48] +17 other tests fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][49] ([Intel XE#4330]) -> [SKIP][50] +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][51] ([Intel XE#3862]) -> [FAIL][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          [INCOMPLETE][53] ([Intel XE#3862] / [Intel XE#4345]) -> [FAIL][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][55] -> [FAIL][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [SKIP][57] ([Intel XE#314]) -> [FAIL][58] +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][59] ([Intel XE#314]) -> [FAIL][60] +3 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         [SKIP][61] ([Intel XE#314] / [Intel XE#455]) -> [FAIL][62] +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         [SKIP][63] ([Intel XE#1152] / [Intel XE#455]) -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_cdclk@plane-scaling.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:
    - shard-adlp:         [SKIP][65] ([Intel XE#1152]) -> [FAIL][66] +2 other tests fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][67] ([Intel XE#1152]) -> [FAIL][68] +3 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][69] ([Intel XE#2252]) -> [FAIL][70] +47 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         [SKIP][71] ([Intel XE#373]) -> [FAIL][72] +44 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][73] ([Intel XE#373]) -> [FAIL][74] +43 other tests fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         [SKIP][75] ([Intel XE#455]) -> [INCOMPLETE][76] +7 other tests incomplete
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_content_protection@legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-256x256:
    - shard-bmg:          [DMESG-WARN][77] ([Intel XE#4330]) -> [SKIP][78] +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][79] ([Intel XE#4330]) -> [SKIP][80] +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [SKIP][81] ([Intel XE#2291]) -> [SKIP][82] +4 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][83] ([Intel XE#2291]) -> [FAIL][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          [SKIP][85] ([Intel XE#1340]) -> [FAIL][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][87] ([i915#3804]) -> [FAIL][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][89] ([Intel XE#4330]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][91] ([Intel XE#301] / [Intel XE#3321]) -> [FAIL][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][93] ([Intel XE#301]) -> [FAIL][94] +7 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][95] ([Intel XE#3321]) -> [FAIL][96] +1 other test fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-FAIL][97] ([Intel XE#4330]) -> [FAIL][98] +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [DMESG-WARN][99] ([Intel XE#4330]) -> [FAIL][100] +45 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][101] ([Intel XE#2882]) -> [FAIL][102] +2 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [SKIP][103] ([Intel XE#2316]) -> [FAIL][104] +4 other tests fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset:
    - shard-dg2-set2:     [DMESG-WARN][105] ([Intel XE#2955]) -> [FAIL][106] +4 other tests fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          [SKIP][107] ([Intel XE#2293] / [Intel XE#2380]) -> [FAIL][108] +18 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#455]) -> [FAIL][110] +31 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][111] ([Intel XE#455]) -> [FAIL][112] +40 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][113] ([Intel XE#2380]) -> [FAIL][114] +1 other test fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][115] ([Intel XE#324] / [Intel XE#4330]) -> [FAIL][116] +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [SKIP][117] ([Intel XE#2293]) -> [FAIL][118] +18 other tests fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][119] ([Intel XE#2312]) -> [FAIL][120] +7 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][121] ([Intel XE#4141]) -> [FAIL][122] +43 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@bpc-switch:
    - shard-bmg:          [DMESG-WARN][123] ([Intel XE#4330]) -> [INCOMPLETE][124] +2 other tests incomplete
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_hdr@bpc-switch.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_hdr@bpc-switch.html
    - shard-dg2-set2:     [DMESG-WARN][125] ([Intel XE#4330]) -> [INCOMPLETE][126] +3 other tests incomplete
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_hdr@bpc-switch.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_hdr@bpc-switch.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][127] ([Intel XE#718]) -> [FAIL][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
    - shard-bmg:          [FAIL][129] ([Intel XE#1430]) -> [FAIL][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         [SKIP][131] ([Intel XE#734]) -> [FAIL][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][133] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [FAIL][134] +1 other test fail
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][135] ([Intel XE#1439] / [Intel XE#836]) -> [FAIL][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [INCOMPLETE][137] -> [FAIL][138]
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-adlp:         [SKIP][139] ([Intel XE#836]) -> [FAIL][140] +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [DMESG-WARN][141] ([Intel XE#2042] / [Intel XE#4330]) -> [FAIL][142]
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][143] ([Intel XE#1874]) -> [FAIL][144] +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][145] ([Intel XE#2330]) -> [FAIL][146] +2 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1127]) -> [FAIL][148] +2 other tests fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-adlp:         [SKIP][149] ([Intel XE#1127]) -> [FAIL][150] +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][151] ([Intel XE#1435]) -> [INCOMPLETE][152] +2 other tests incomplete
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#362]) -> [FAIL][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-bmg:          [DMESG-WARN][155] ([Intel XE#4330]) -> [FAIL][156] +25 other tests fail
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][158] +4 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][159] ([Intel XE#1948]) -> [FAIL][160]
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          [SKIP][161] ([Intel XE#2284]) -> [FAIL][162] +3 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html
    - shard-adlp:         [SKIP][163] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][164] +4 other tests fail
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-adlp:         [DMESG-WARN][165] ([Intel XE#4173]) -> [DMESG-WARN][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@xe_pm@s2idle-exec-after.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][167] ([Intel XE#4268]) -> [FAIL][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-bmg:          [ABORT][169] ([Intel XE#4268]) -> [FAIL][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s4-d3hot-basic-exec.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@xe_pm@s4-d3hot-basic-exec.html

  
New tests
---------

  New tests have been introduced between xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f_full and xe-pw-139954v8_full:

### New IGT tests (40) ###

  * igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.30] s

  * igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.72] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [3.79] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [2.45] s

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [2.41] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-7:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-7:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-4:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.87] s

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_rmfb@close-fd@pipe-c-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.47] s

  * igt@kms_rmfb@close-fd@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.47] s

  * igt@kms_vblank@query-busy@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_vblank@query-busy@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_vblank@wait-forked@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_vblank@wait-forked@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-139954v8_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1125])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@intel_hwmon@hwmon-read.html
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#1125])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@intel_hwmon@hwmon-read.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#3157])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#3157])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-bmg:          [PASS][175] -> [INCOMPLETE][176] ([Intel XE#4245]) +1 other test incomplete
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_atomic@atomic-plane-damage.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [PASS][177] -> [INCOMPLETE][178] ([Intel XE#2613]) +1 other test incomplete
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_atomic_transition@modeset-transition.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_atomic_transition@modeset-transition.html
    - shard-dg2-set2:     [PASS][179] -> [INCOMPLETE][180] ([Intel XE#2613])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_atomic_transition@modeset-transition.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-bmg:          [PASS][181] -> [SKIP][182] ([Intel XE#4258]) +1 other test skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#3279])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][184] ([Intel XE#3908]) +2 other tests fail
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-adlp:         [PASS][185] -> [FAIL][186] ([Intel XE#3908]) +12 other tests fail
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
    - shard-bmg:          [PASS][187] -> [FAIL][188] ([Intel XE#3908] / [Intel XE#4215]) +10 other tests fail
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          [PASS][189] -> [FAIL][190] ([Intel XE#3908])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [FAIL][191] ([Intel XE#3908]) +2 other tests fail
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7 (NEW):
    - shard-dg2-set2:     NOTRUN -> [FAIL][192] ([Intel XE#3908]) +2 other tests fail
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][193] -> [FAIL][194] ([Intel XE#3908]) +10 other tests fail
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-6.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][195] ([Intel XE#1124]) +10 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#1407]) +3 other tests skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#3658])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][198] ([Intel XE#4260])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][199] -> [SKIP][200] ([Intel XE#4260]) +11 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][201] ([Intel XE#1124]) +11 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][202] ([Intel XE#1124]) +12 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][203] ([Intel XE#1124]) +13 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [PASS][204] -> [SKIP][205] ([Intel XE#367]) +3 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
    - shard-adlp:         [PASS][206] -> [SKIP][207] ([Intel XE#367]) +1 other test skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [PASS][208] -> [SKIP][209] ([Intel XE#367]) +2 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#367]) +5 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#367]) +5 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [PASS][212] -> [SKIP][213] ([Intel XE#2191])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][214] ([Intel XE#367]) +5 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#367]) +2 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][216] ([Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#2887]) +11 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][218] ([Intel XE#787]) +87 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#3432])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][220] ([Intel XE#3432])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [SKIP][221] ([Intel XE#787]) +29 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][222] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][223] ([Intel XE#2907]) +2 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][224] ([Intel XE#2907]) +2 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][225] ([Intel XE#2652] / [Intel XE#787]) +30 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][226] ([Intel XE#2887]) +6 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][227] ([Intel XE#306]) +2 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][228] ([Intel XE#306])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_chamelium_color@ctm-max.html
    - shard-bmg:          NOTRUN -> [SKIP][229] ([Intel XE#2325]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][230] ([Intel XE#306]) +1 other test skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-lnl:          NOTRUN -> [SKIP][231] ([Intel XE#373]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         [PASS][232] -> [SKIP][233] ([Intel XE#455]) +54 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][234] ([Intel XE#2321])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][235] ([Intel XE#2321])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#308])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][237] ([Intel XE#308]) +2 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#2320]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#1424]) +3 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     [PASS][240] -> [SKIP][241] ([Intel XE#455]) +27 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][242] -> [SKIP][243] ([Intel XE#2291]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#2291])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][245] -> [SKIP][246] ([Intel XE#309]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#309])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][248] ([Intel XE#309])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][249] ([Intel XE#2286])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][250] ([Intel XE#4210])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp:
    - shard-bmg:          NOTRUN -> [SKIP][251] ([Intel XE#2244]) +1 other test skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][252] ([Intel XE#455]) +17 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][253] ([Intel XE#2244])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][254] ([Intel XE#4156])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][255] ([Intel XE#776])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-adlp:         NOTRUN -> [SKIP][256] ([Intel XE#776])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][257] ([Intel XE#776])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-dg2-set2:     [PASS][258] -> [SKIP][259] ([Intel XE#702])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_feature_discovery@display-2x.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_feature_discovery@display-2x.html

  * igt@kms_feature_discovery@psr2:
    - shard-adlp:         NOTRUN -> [SKIP][260] ([Intel XE#1135])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_feature_discovery@psr2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#1135])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][262] ([Intel XE#1421]) +9 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-busy-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][263] ([Intel XE#310]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][264] -> [FAIL][265] ([Intel XE#3333]) +1 other test fail
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][266] ([Intel XE#3333]) +1 other test fail
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][267] ([Intel XE#310]) +9 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][268] -> [SKIP][269] ([Intel XE#2316]) +4 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][270] ([Intel XE#2316])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-dg2-set2:     [PASS][271] -> [SKIP][272] ([Intel XE#310]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb-interruptible.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         NOTRUN -> [FAIL][273] ([Intel XE#3149])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][274] ([Intel XE#3149])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          [PASS][275] -> [FAIL][276] ([Intel XE#886]) +2 other tests fail
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-adlp:         [PASS][277] -> [FAIL][278] ([Intel XE#3149]) +3 other tests fail
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html
    - shard-dg2-set2:     [PASS][279] -> [FAIL][280] ([Intel XE#3149]) +2 other tests fail
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][281] ([Intel XE#1397]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][282] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][284] ([Intel XE#1401]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [PASS][285] -> [SKIP][286] ([Intel XE#2682])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][287] ([Intel XE#2311]) +28 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][288] ([Intel XE#651]) +8 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][289] -> [SKIP][290] ([Intel XE#656]) +6 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][291] ([Intel XE#651]) +27 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][292] ([Intel XE#651]) +8 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][293] ([Intel XE#656]) +31 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][294] ([Intel XE#2313]) +22 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][295] ([Intel XE#2312]) +3 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][296] ([Intel XE#656]) +8 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][297] ([Intel XE#653]) +30 other tests skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][298] ([Intel XE#656]) +32 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][299] ([Intel XE#653]) +8 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-lnl:          [PASS][300] -> [INCOMPLETE][301] ([Intel XE#2050])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][302] ([Intel XE#1503])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][303] ([Intel XE#346])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][304] ([Intel XE#2927])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-bmg:          [PASS][305] -> [FAIL][306] ([Intel XE#4243]) +8 other tests fail
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_lease@setcrtc-implicit-plane.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][307] ([Intel XE#2486])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@pixel-format:
    - shard-bmg:          [PASS][308] -> [INCOMPLETE][309] ([Intel XE#1035])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_plane@pixel-format.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_plane@pixel-format.html
    - shard-dg2-set2:     [PASS][310] -> [INCOMPLETE][311] ([Intel XE#1035])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_plane@pixel-format.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [PASS][312] -> [INCOMPLETE][313] ([Intel XE#1035] / [Intel XE#2566])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_plane@pixel-format-source-clamping.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_plane@pixel-format-source-clamping.html
    - shard-bmg:          [PASS][314] -> [INCOMPLETE][315] ([Intel XE#1035] / [Intel XE#2566])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][316] -> [SKIP][317] ([Intel XE#3380]) +1 other test skip
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-bmg:          NOTRUN -> [SKIP][318] ([Intel XE#3280])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-bmg:          [PASS][319] -> [SKIP][320] ([Intel XE#3280]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_plane_alpha_blend@coverage-7efc.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-adlp:         NOTRUN -> [SKIP][321] ([Intel XE#455]) +20 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     NOTRUN -> [SKIP][322] ([Intel XE#2763] / [Intel XE#455]) +11 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - shard-adlp:         NOTRUN -> [SKIP][323] ([Intel XE#2763] / [Intel XE#455]) +7 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][324] ([Intel XE#2763]) +24 other tests skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][325] ([Intel XE#2763]) +15 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          [PASS][326] -> [SKIP][327] ([Intel XE#2763]) +122 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][328] ([Intel XE#2763]) +17 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - shard-adlp:         [PASS][329] -> [SKIP][330] ([Intel XE#2763]) +71 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:
    - shard-adlp:         [PASS][331] -> [SKIP][332] ([Intel XE#2763] / [Intel XE#455]) +30 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][333] ([Intel XE#2763]) +14 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-dg2-set2:     [PASS][334] -> [SKIP][335] ([Intel XE#2763]) +89 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [PASS][336] -> [SKIP][337] ([Intel XE#2763] / [Intel XE#455]) +55 other tests skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     NOTRUN -> [SKIP][338] ([Intel XE#870])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-dg2-set2:     NOTRUN -> [SKIP][339] ([Intel XE#3309])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-lnl:          NOTRUN -> [SKIP][340] ([Intel XE#3309])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-adlp:         NOTRUN -> [SKIP][341] ([Intel XE#3309])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_pm_dc@dc5-retention-flops.html
    - shard-bmg:          NOTRUN -> [SKIP][342] ([Intel XE#3309])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][343] ([Intel XE#1439] / [Intel XE#3141])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][344] ([Intel XE#2893]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][345] ([Intel XE#1489]) +8 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][346] ([Intel XE#1489]) +7 other tests skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][347] ([Intel XE#1489]) +7 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][348] ([Intel XE#1406])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-cursor-blt@edp-1:
    - shard-lnl:          [PASS][349] -> [FAIL][350] ([Intel XE#3924]) +1 other test fail
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][351] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][352] ([Intel XE#2850] / [Intel XE#929]) +8 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][353] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][354] ([Intel XE#2414])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-adlp:         NOTRUN -> [SKIP][355] ([Intel XE#3414]) +1 other test skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-bmg:          NOTRUN -> [SKIP][356] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][357] ([Intel XE#3414]) +2 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-lnl:          NOTRUN -> [SKIP][358] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][359] ([Intel XE#1435]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2426])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][361] ([Intel XE#1499]) +1 other test skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_vrr@negative-basic.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][362] ([Intel XE#1499]) +1 other test skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][363] ([Intel XE#756])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][364] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug@basic-read-event:
    - shard-adlp:         NOTRUN -> [SKIP][365] ([Intel XE#2905]) +4 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_eudebug@basic-read-event.html
    - shard-bmg:          NOTRUN -> [SKIP][366] ([Intel XE#2905]) +7 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][367] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][368] ([Intel XE#688]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][369] ([Intel XE#688]) +4 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][370] ([Intel XE#1392]) +5 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][371] ([Intel XE#1392]) +5 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][372] ([Intel XE#2322]) +7 other tests skip
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#288]) +19 other tests skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][374] ([Intel XE#288]) +27 other tests skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][375] ([Intel XE#2905]) +12 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
    - shard-lnl:          NOTRUN -> [SKIP][376] ([Intel XE#2905]) +4 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][377] ([Intel XE#3970] / [Intel XE#4173])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-adlp:         [PASS][378] -> [DMESG-WARN][379] ([Intel XE#3970] / [Intel XE#4173])
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-adlp:         [PASS][380] -> [SKIP][381] ([Intel XE#4322])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@xe_live_ktest@xe_migrate.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][382] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][383] ([Intel XE#2541] / [Intel XE#3573]) +6 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_oa@oa-tlb-invalidate.html
    - shard-lnl:          NOTRUN -> [SKIP][384] ([Intel XE#2248])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html
    - shard-bmg:          NOTRUN -> [SKIP][385] ([Intel XE#2248])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][386] ([Intel XE#2838] / [Intel XE#979])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][387] ([Intel XE#2236])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][388] ([Intel XE#2427])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_peer2peer@write.html
    - shard-adlp:         NOTRUN -> [SKIP][389] ([Intel XE#1061])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][390] ([Intel XE#1061])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][391] ([Intel XE#1173]) +1 other test fail
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][392] ([Intel XE#2284])
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][393] -> [DMESG-WARN][394] ([Intel XE#569]) +2 other tests dmesg-warn
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s3-multiple-execs.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@xe_pm@s3-multiple-execs.html
    - shard-adlp:         [PASS][395] -> [DMESG-WARN][396] ([Intel XE#569]) +8 other tests dmesg-warn
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][397] ([Intel XE#569])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][398] -> [DMESG-WARN][399] ([Intel XE#569]) +1 other test dmesg-warn
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-basic:
    - shard-bmg:          NOTRUN -> [ABORT][400] ([Intel XE#4268])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_pm@s4-basic.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][401] ([Intel XE#579])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][402] ([Intel XE#579])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][403] ([Intel XE#579])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][404] -> [DMESG-WARN][405] ([Intel XE#3088]) +1 other test dmesg-warn
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-434/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][406] ([Intel XE#3088]) +2 other tests dmesg-warn
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][407] ([Intel XE#944]) +1 other test skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-lnl:          NOTRUN -> [SKIP][408] ([Intel XE#944])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-adlp:         NOTRUN -> [SKIP][409] ([Intel XE#944])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html
    - shard-bmg:          NOTRUN -> [SKIP][410] ([Intel XE#944])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@fair-allocation:
    - shard-lnl:          NOTRUN -> [SKIP][411] ([Intel XE#4130]) +1 other test skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@xe_sriov_auto_provisioning@fair-allocation.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][412] ([Intel XE#4130]) +1 other test skip
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][413] ([Intel XE#4130]) +1 other test skip
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][414] -> [DMESG-WARN][415] ([Intel XE#3970]) +20 other tests dmesg-warn
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-9/igt@xe_wedged@basic-wedged.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@xe_wedged@basic-wedged.html
    - shard-dg2-set2:     [PASS][416] -> [DMESG-WARN][417] ([Intel XE#3858])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@xe_wedged@basic-wedged.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [PASS][418] -> [DMESG-WARN][419] ([Intel XE#3858])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@xe_wedged@basic-wedged.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_lease@lease-unleased-connector@pipe-c-dp-4:
    - shard-dg2-set2:     [DMESG-WARN][420] ([Intel XE#4330]) -> [PASS][421] +9 other tests pass
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_lease@lease-unleased-connector@pipe-c-dp-4.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_lease@lease-unleased-connector@pipe-c-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][422] ([Intel XE#899]) -> [PASS][423]
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [SKIP][424] -> [PASS][425]
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-bmg:          [DMESG-WARN][426] ([Intel XE#4330]) -> [PASS][427] +3 other tests pass
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@xe_pm_residency@toggle-gt-c6.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][428] ([Intel XE#2385]) -> [INCOMPLETE][429] ([Intel XE#4245])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-dg2-set2:     [DMESG-WARN][430] ([Intel XE#4330]) -> [FAIL][431] ([Intel XE#3908]) +1 other test fail
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
    - shard-bmg:          [DMESG-WARN][432] ([Intel XE#4330]) -> [FAIL][433] ([Intel XE#3908] / [Intel XE#4215])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [DMESG-WARN][434] ([Intel XE#4330]) -> [SKIP][435] ([Intel XE#4260])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][436] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][437] ([Intel XE#367])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [DMESG-WARN][438] ([Intel XE#4330]) -> [SKIP][439] ([Intel XE#2191])
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#787]) -> [SKIP][441] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][442] ([Intel XE#1178]) -> [INCOMPLETE][443] ([Intel XE#2715]) +1 other test incomplete
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_content_protection@atomic.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][444] ([Intel XE#2341]) -> [INCOMPLETE][445] ([Intel XE#2715] / [Intel XE#4132])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_content_protection@content-type-change.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][446] ([Intel XE#2341]) -> [INCOMPLETE][447] ([Intel XE#2715]) +2 other tests incomplete
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_content_protection@legacy.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][448] ([Intel XE#1178]) -> [INCOMPLETE][449] ([Intel XE#2715] / [Intel XE#4132]) +2 other tests incomplete
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_content_protection@legacy.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#455]) -> [INCOMPLETE][451] ([Intel XE#2715] / [Intel XE#4132]) +2 other tests incomplete
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_content_protection@lic-type-1.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][452] ([Intel XE#455]) -> [INCOMPLETE][453] ([Intel XE#4132])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_content_protection@mei-interface.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-dg2-set2:     [DMESG-WARN][454] ([Intel XE#4330]) -> [SKIP][455] ([Intel XE#455]) +2 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-bmg:          [SKIP][456] ([Intel XE#2316]) -> [FAIL][457] ([Intel XE#3333]) +1 other test fail
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#651]) -> [SKIP][459] ([Intel XE#656]) +12 other tests skip
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][460] ([Intel XE#2312]) -> [SKIP][461] ([Intel XE#2311]) +15 other tests skip
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][462] ([Intel XE#4141]) -> [SKIP][463] ([Intel XE#2312]) +4 other tests skip
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][464] ([Intel XE#2311]) -> [SKIP][465] ([Intel XE#2312]) +11 other tests skip
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][466] ([Intel XE#2312]) -> [SKIP][467] ([Intel XE#2313]) +18 other tests skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#653]) -> [SKIP][469] ([Intel XE#656]) +8 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][470] ([Intel XE#2313]) -> [SKIP][471] ([Intel XE#2312]) +9 other tests skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][472] ([Intel XE#3544]) -> [SKIP][473] ([Intel XE#3374] / [Intel XE#3544])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][474] ([Intel XE#2566] / [Intel XE#4330]) -> [SKIP][475] ([Intel XE#2763])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:
    - shard-bmg:          [DMESG-WARN][476] ([Intel XE#4330]) -> [SKIP][477] ([Intel XE#2763])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html
    - shard-dg2-set2:     [DMESG-WARN][478] ([Intel XE#4330]) -> [SKIP][479] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-dg2-set2:     [DMESG-WARN][480] ([Intel XE#2566] / [Intel XE#4330]) -> [SKIP][481] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][482] ([Intel XE#1729]) -> [SKIP][483] ([Intel XE#2426])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][484] ([Intel XE#1500]) -> [SKIP][485] ([Intel XE#362])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          [SKIP][486] -> [SKIP][487] ([Intel XE#2833])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][488] ([Intel XE#4330] / [Intel XE#569]) -> [DMESG-WARN][489] ([Intel XE#569]) +5 other tests dmesg-warn
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s3-basic-exec.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][490] ([Intel XE#4330] / [Intel XE#569]) -> [DMESG-WARN][491] ([Intel XE#569]) +5 other tests dmesg-warn
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s3-d3hot-basic-exec.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3280
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3858
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3924]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4215]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4215
  [Intel XE#4243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4243
  [Intel XE#4245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245
  [Intel XE#4258]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4258
  [Intel XE#4260]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4260
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8236 -> IGT_8238
  * Linux: xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f -> xe-pw-139954v8

  IGT_8236: 8236
  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f: 3d2fe90eb7c12b62ea0b181d227de9f9381c173f
  xe-pw-139954v8: 139954v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/index.html

--===============1561288842010949641==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f_full -&gt; xe-pw-139954v8_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139954v8_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139954v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139954v8_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@core_hotunplug@hotreplug.html">DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_atomic_transition@modeset-transition.html">INCOMPLETE</a> +13 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> +466 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_flip@flip-vs-rmfb-interruptible@a-hdmi-a1.html">FAIL</a> +147 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">FAIL</a> +1086 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a> +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html">SKIP</a> +88 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">SKIP</a> +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html">SKIP</a> +328 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_hdr@static-toggle-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_hdr@static-toggle-dpms.html">INCOMPLETE</a> +13 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_invalid_mode@bad-vsync-end@pipe-c-hdmi-a-6.html">FAIL</a> +390 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-untiled:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_pipe_stress@stress-xrgb8888-untiled.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-1.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_plane_multiple@tiling-none@pipe-b-hdmi-a-6.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_setmode@basic.html">INCOMPLETE</a> +10 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">INCOMPLETE</a> +4 other tests incomplete</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_setmode@clone-exclusive-crtc.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> +623 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_vblank@ts-continuation-idle-hang@pipe-d-hdmi-a-3.html">FAIL</a> +855 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html">DMESG-WARN</a> +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> +8 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s2idle-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">FAIL</a> +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@plane-scaling.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_cdclk@plane-scaling@pipe-a-hdmi-a-1.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">FAIL</a> +47 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html">FAIL</a> +44 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_content_protection@legacy.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-256x256.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-hdmi-a6-dp4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> +45 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check@ac-dp2-hdmi-a3.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@flip-vs-dpms-off-vs-modeset.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">FAIL</a> +31 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">FAIL</a> +40 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">FAIL</a> +18 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_hdr@bpc-switch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_hdr@bpc-switch.html">INCOMPLETE</a> +2 other tests incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_hdr@bpc-switch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_hdr@bpc-switch.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_pm_dc@dc9-dpms.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_pm_rpm@dpms-lpsp.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">FAIL</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_pm_rpm@system-suspend-modeset.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">FAIL</a> +2 other tests fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_setmode@basic-clone-single-crtc.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_vblank@ts-continuation-suspend.html">FAIL</a> +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@xe_pm@d3cold-basic-exec.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@xe_pm@d3hot-mmap-vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@xe_pm@s2idle-d3cold-basic-exec.html">FAIL</a> +3 other tests fail</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_pm@s2idle-d3cold-basic-exec.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@xe_pm@s2idle-exec-after.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@xe_pm@s4-d3hot-basic-exec.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@xe_pm@s4-d3hot-basic-exec.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f_full and xe-pw-139954v8_full:</p>
<h3>New IGT tests (40)</h3>
<ul>
<li>
<p>igt@kms_atomic@plane-invalid-params@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.30] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_interruptible@atomic-setmode@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-b-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [3.79] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-c-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.45] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-d-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [2.41] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ab-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ac-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bc-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@bd-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@cd-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-opaque-fb@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.87] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.47] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139954v8_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_atomic@atomic-plane-damage.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_atomic@atomic-plane-damage.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245">Intel XE#4245</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_atomic_transition@modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>) +1 other test incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_atomic_transition@modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4258">Intel XE#4258</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +12 other tests fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4215">Intel XE#4215</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7 (NEW):</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4260">Intel XE#4260</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4260">Intel XE#4260</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +54 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_dsc@dsc-fractional-bpp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_feature_discovery@display-2x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@2x-busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-7/igt@kms_flip@plain-flip-ts-check@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-3/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +3 other tests fail</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_flip@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-8/igt@kms_lease@setcrtc-implicit-plane.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_lease@setcrtc-implicit-plane.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4243">Intel XE#4243</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_plane@pixel-format.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_plane@pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_plane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3280">Intel XE#3280</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@kms_plane_alpha_blend@coverage-7efc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_plane_alpha_blend@coverage-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3280">Intel XE#3280</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_multiple@tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +122 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +71 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +89 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-8/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3924">Intel XE#3924</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-6/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-8/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_create:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-2/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-6/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-9/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4322">Intel XE#4322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-3/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +2 other tests dmesg-warn</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-9/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +8 other tests dmesg-warn</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-2/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-434/igt@xe_pm_residency@gt-c6-freeze.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-6/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@fair-allocation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-4/igt@xe_sriov_auto_provisioning@fair-allocation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-increase-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-adlp-9/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-adlp-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +20 other tests dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3858">Intel XE#3858</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3858">Intel XE#3858</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_lease@lease-unleased-connector@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_lease@lease-unleased-connector@pipe-c-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_lease@lease-unleased-connector@pipe-c-dp-4.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@xe_pm_residency@toggle-gt-c6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245">Intel XE#4245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4215">Intel XE#4215</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4260">Intel XE#4260</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-6/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-7/igt@kms_content_protection@content-type-change.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) +2 other tests incomplete</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-433/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_content_protection@lic-type-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_content_protection@mei-interface.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-256x85.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-1/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-436/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-5/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-dg2-463/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f/shard-bmg-5/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v8/shard-bmg-3/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8236 -&gt; IGT_8238</li>
<li>Linux: xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f -&gt; xe-pw-139954v8</li>
</ul>
<p>IGT_8236: 8236<br />
  IGT_8238: 7df82badac410a7ce2505df6064d44f0e094650c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2685-3d2fe90eb7c12b62ea0b181d227de9f9381c173f: 3d2fe90eb7c12b62ea0b181d227de9f9381c173f<br />
  xe-pw-139954v8: 139954v8</p>

</body>
</html>

--===============1561288842010949641==--
