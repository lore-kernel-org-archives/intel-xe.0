Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259BCCDE00C
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 22:09:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBCE910F3A1;
	Thu, 25 Jun 2026 22:09:12 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AE210E2DA;
 Thu, 25 Jun 2026 22:09:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2937448176793679614=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/hdcp=3A_check_str?=
 =?utf-8?q?eams=5B=5D_bounds_before_overflow?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 22:09:11 -0000
Message-ID: <178242535197.118463.8794898171664991045@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625170304.1104723-1-jani.nikula@intel.com>
In-Reply-To: <20260625170304.1104723-1-jani.nikula@intel.com>
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

--===============2937448176793679614==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/hdcp: check streams[] bounds before overflow
URL   : https://patchwork.freedesktop.org/series/169210/
State : failure

== Summary ==

CI Bug Log - changes from xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e_FULL -> xe-pw-169210v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169210v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169210v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169210v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap:
    - shard-bmg:          NOTRUN -> [FAIL][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontunmap.html

  
Known issues
------------

  Here are the changes found in xe-pw-169210v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#5177] / [Intel XE#8440] / [Intel XE#8480])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@intel_hwmon@hwmon-read.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][7] -> [FAIL][8] ([Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2370]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][11] -> [TIMEOUT][12] ([Intel XE#8446] / [Intel XE#8479]) +2 other tests timeout
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][14] ([Intel XE#5643] / [Intel XE#8479]) +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#1124]) +14 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7679])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2652]) +8 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#3432]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2887]) +16 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2252]) +10 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2390] / [Intel XE#6974])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7642])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2320]) +2 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][28] -> [INCOMPLETE][29] ([Intel XE#8151])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2286] / [Intel XE#6035])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#1508])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4354] / [Intel XE#5882])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8265]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4156] / [Intel XE#7425])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#1138] / [Intel XE#7344])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][36] ([Intel XE#8155] / [Intel XE#8479])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][37] -> [CRASH][38] ([Intel XE#8461])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#301])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2:
    - shard-bmg:          [PASS][41] -> [INCOMPLETE][42] ([Intel XE#8155] / [Intel XE#8479]) +1 other test incomplete
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-bmg:          [PASS][43] -> [TIMEOUT][44] ([Intel XE#8467] / [Intel XE#8479]) +1 other test timeout
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode:
    - shard-lnl:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#8479]) +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:
    - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#8479]) +7 other tests incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [TIMEOUT][49] ([Intel XE#8467] / [Intel XE#8479]) +1 other test timeout
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7061]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4141]) +21 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2311]) +53 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [TIMEOUT][54] ([Intel XE#8466] / [Intel XE#8479]) +1 other test timeout
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [TIMEOUT][55] ([Intel XE#8479])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2313]) +61 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#6912] / [Intel XE#7375])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-bmg:          NOTRUN -> [TIMEOUT][59] ([Intel XE#8465]) +1 other test timeout
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7283]) +6 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][61] ([Intel XE#8459] / [Intel XE#8479]) +1 other test incomplete
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a:
    - shard-bmg:          [PASS][62] -> [INCOMPLETE][63] ([Intel XE#8459] / [Intel XE#8479]) +5 other tests incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [PASS][64] -> [INCOMPLETE][65] ([Intel XE#8437] / [Intel XE#8459] / [Intel XE#8479]) +1 other test incomplete
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][67] ([Intel XE#8437] / [Intel XE#8459] / [Intel XE#8479]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#8395]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8396])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@psr2.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#1489]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2387] / [Intel XE#7429])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2234] / [Intel XE#2850]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2330] / [Intel XE#5813])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2413])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#6503]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2168] / [Intel XE#7444])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_vrr@lobf.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][79] ([Intel XE#8437] / [Intel XE#8479]) +5 other tests incomplete
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#7636]) +14 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][81] ([Intel XE#6321] / [Intel XE#8355])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#8370]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#8440] / [Intel XE#8480]) +117 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@rcs0:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][84] ([Intel XE#8479]) +5 other tests incomplete
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@rcs0.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#8374]) +12 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#8364]) +31 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#8369])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][89] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) +1 other test incomplete
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [FAIL][90] ([Intel XE#8479]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:
    - shard-bmg:          [PASS][91] -> [FAIL][92] ([Intel XE#8479]) +10 other tests fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#8480]) +151 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-many-execqueues-mmap.html

  * igt@xe_exec_system_allocator@threads-many-malloc-mlock:
    - shard-lnl:          NOTRUN -> [ABORT][95] ([Intel XE#8007])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-4/igt@xe_exec_system_allocator@threads-many-malloc-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][96] ([Intel XE#7928] / [Intel XE#8159] / [Intel XE#8479])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#8480]) +110 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise:
    - shard-bmg:          [PASS][98] -> [TIMEOUT][99] ([Intel XE#8447] / [Intel XE#8479])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock:
    - shard-bmg:          [PASS][100] -> [INCOMPLETE][101] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) +3 other tests incomplete
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][102] ([Intel XE#8159] / [Intel XE#8479]) +15 other tests incomplete
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared:
    - shard-bmg:          [PASS][103] -> [INCOMPLETE][104] ([Intel XE#8159] / [Intel XE#8479]) +26 other tests incomplete
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap:
    - shard-bmg:          [PASS][105] -> [INCOMPLETE][106] ([Intel XE#7928] / [Intel XE#8159] / [Intel XE#8479])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-bmg:          [PASS][107] -> [TIMEOUT][108] ([Intel XE#8479])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][109] ([Intel XE#8366] / [Intel XE#8479]) +1 other test incomplete
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][110] -> [TIMEOUT][111] ([Intel XE#8479])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-1/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#8378]) +8 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [PASS][113] -> [INCOMPLETE][114] ([Intel XE#8479] / [Intel XE#8486])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][115] ([Intel XE#8479] / [Intel XE#8486]) +1 other test incomplete
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          NOTRUN -> [CRASH][116] ([Intel XE#8448]) +1 other test crash
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][117] -> [FAIL][118] ([Intel XE#8464]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_live_ktest@xe_dma_buf.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][119] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125], [PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143]) -> ([PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156], [PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [SKIP][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169]) ([Intel XE#2457] / [Intel XE#7405])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-basic:
    - shard-bmg:          NOTRUN -> [SKIP][170] ([Intel XE#6964]) +5 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-concurrent-access-basic.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          NOTRUN -> [SKIP][171] ([Intel XE#7793]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][172] ([Intel XE#2236] / [Intel XE#7590])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][173] ([Intel XE#7695])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2284] / [Intel XE#7370])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][175] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#7599])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][177] ([Intel XE#4733] / [Intel XE#7417]) +3 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][178] ([Intel XE#944]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][179] ([Intel XE#8477] / [Intel XE#8479]) +1 other test incomplete
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][180] -> [ABORT][181] ([Intel XE#8007])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-bmg:          [INCOMPLETE][182] ([Intel XE#8174] / [Intel XE#8479]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#5643] / [Intel XE#8479]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [TIMEOUT][186] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][188] ([Intel XE#8151] / [Intel XE#8479]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][190] ([Intel XE#8151]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][192] ([Intel XE#3098]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [INCOMPLETE][194] ([Intel XE#8155] / [Intel XE#8479]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][196] ([Intel XE#301]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [TIMEOUT][198] ([Intel XE#8467] / [Intel XE#8479]) -> [PASS][199] +7 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [TIMEOUT][200] ([Intel XE#8466] / [Intel XE#8479]) -> [PASS][201] +5 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][202] ([Intel XE#1503]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#8459] / [Intel XE#8479]) -> [PASS][205] +5 other tests pass
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-bmg:          [TIMEOUT][206] -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system:
    - shard-bmg:          [INCOMPLETE][208] ([Intel XE#8479]) -> [PASS][209] +9 other tests pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.html

  * igt@xe_exec_system_allocator@once-large-mmap-nomemset:
    - shard-bmg:          [SKIP][210] ([Intel XE#8440] / [Intel XE#8480]) -> [PASS][211] +5 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_system_allocator@once-large-mmap-nomemset.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma:
    - shard-bmg:          [CRASH][212] ([Intel XE#8450]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:
    - shard-bmg:          [FAIL][214] -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset:
    - shard-bmg:          [FAIL][216] ([Intel XE#8479]) -> [PASS][217] +6 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:
    - shard-bmg:          [INCOMPLETE][218] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro:
    - shard-bmg:          [INCOMPLETE][220] ([Intel XE#8159] / [Intel XE#8479]) -> [PASS][221] +36 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-bmg:          [INCOMPLETE][222] ([Intel XE#8486]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [CRASH][224] ([Intel XE#8448]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][226] ([Intel XE#8007]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-6/igt@xe_wedged@wedged-mode-toggle.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:
    - shard-bmg:          [TIMEOUT][228] ([Intel XE#8479]) -> [INCOMPLETE][229] ([Intel XE#8437] / [Intel XE#8479])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [INCOMPLETE][230] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][231] ([Intel XE#8446] / [Intel XE#8479]) +2 other tests timeout
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][232] ([Intel XE#8446]) -> [INCOMPLETE][233] ([Intel XE#5643] / [Intel XE#8479])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-bmg:          [TIMEOUT][234] ([Intel XE#8446] / [Intel XE#8479]) -> [INCOMPLETE][235] ([Intel XE#5643] / [Intel XE#8479]) +1 other test incomplete
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [TIMEOUT][236] ([Intel XE#8446] / [Intel XE#8479]) -> [INCOMPLETE][237] ([Intel XE#5643] / [Intel XE#8479])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [INCOMPLETE][238] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][239] ([Intel XE#8479])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [INCOMPLETE][240] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][241] ([Intel XE#8446] / [Intel XE#8479])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [TIMEOUT][242] ([Intel XE#8446] / [Intel XE#8479]) -> [SKIP][243] ([Intel XE#8480])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          [INCOMPLETE][244] ([Intel XE#5643]) -> [INCOMPLETE][245] ([Intel XE#5643] / [Intel XE#8479])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][246] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][247] ([Intel XE#1124])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][248] ([Intel XE#1124]) -> [SKIP][249] ([Intel XE#8480]) +2 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][250] ([Intel XE#1124]) -> [INCOMPLETE][251] ([Intel XE#5643] / [Intel XE#8479])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][252] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][253] ([Intel XE#8440] / [Intel XE#8480]) +26 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][254] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][255] ([Intel XE#1124])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [CRASH][256] ([Intel XE#8449]) -> [TIMEOUT][257] ([Intel XE#8469] / [Intel XE#8476])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][258] ([Intel XE#8479]) -> [SKIP][259] ([Intel XE#367]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][260] ([Intel XE#367]) -> [SKIP][261] ([Intel XE#8480])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][262] ([Intel XE#367]) -> [INCOMPLETE][263] ([Intel XE#8479]) +2 other tests incomplete
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [INCOMPLETE][264] ([Intel XE#8150] / [Intel XE#8437] / [Intel XE#8479]) -> [SKIP][265] ([Intel XE#2887])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][266] ([Intel XE#8150] / [Intel XE#8479]) -> [SKIP][267] ([Intel XE#8480])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][268] ([Intel XE#2652]) -> [INCOMPLETE][269] ([Intel XE#8150] / [Intel XE#8479])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][270] ([Intel XE#2887]) -> [INCOMPLETE][271] ([Intel XE#8150] / [Intel XE#8437] / [Intel XE#8479])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][272] ([Intel XE#2887]) -> [SKIP][273] ([Intel XE#8480]) +4 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          [SKIP][274] ([Intel XE#2252]) -> [SKIP][275] ([Intel XE#8480]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][276] ([Intel XE#6507]) -> [SKIP][277] ([Intel XE#8480])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_chamelium_sharpness_filter@filter-basic.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          [SKIP][278] ([Intel XE#6969] / [Intel XE#7006]) -> [SKIP][279] ([Intel XE#8480])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_color_pipeline@plane-lut3d-green-only.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [FAIL][280] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][281] ([Intel XE#8480])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][282] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][283] ([Intel XE#8480])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][284] ([Intel XE#2320]) -> [SKIP][285] ([Intel XE#8480])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][286] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][287] ([Intel XE#309] / [Intel XE#7343])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][288] ([Intel XE#8451] / [Intel XE#8479]) -> [SKIP][289] ([Intel XE#8480])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][290] ([Intel XE#8151] / [Intel XE#8479]) -> [INCOMPLETE][291] ([Intel XE#8151])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][292] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][293] ([Intel XE#8480])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][294] ([Intel XE#6126] / [Intel XE#776]) -> [SKIP][295] ([Intel XE#8480])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [CRASH][296] ([Intel XE#8461]) -> [INCOMPLETE][297] ([Intel XE#8155] / [Intel XE#8479])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-bmg:          [TIMEOUT][298] ([Intel XE#8467] / [Intel XE#8479]) -> [SKIP][299] ([Intel XE#8480])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [INCOMPLETE][300] ([Intel XE#8479]) -> [SKIP][301] ([Intel XE#7178] / [Intel XE#7349])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          [SKIP][302] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][303] ([Intel XE#8480])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-rte:
    - shard-bmg:          [SKIP][304] ([Intel XE#4141]) -> [SKIP][305] ([Intel XE#8480])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-rte.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][306] ([Intel XE#2311]) -> [TIMEOUT][307] ([Intel XE#8466])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][308] ([Intel XE#2311]) -> [SKIP][309] ([Intel XE#8480]) +16 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][310] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][311] ([Intel XE#2311])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][312] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][313] ([Intel XE#8480])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][314] ([Intel XE#8368] / [Intel XE#8479]) -> [TIMEOUT][315] ([Intel XE#8466] / [Intel XE#8479]) +1 other test timeout
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][316] ([Intel XE#8466] / [Intel XE#8479]) -> [INCOMPLETE][317] ([Intel XE#8368] / [Intel XE#8479])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][318] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][319] ([Intel XE#2313])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][320] ([Intel XE#2313]) -> [SKIP][321] ([Intel XE#8480]) +14 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [INCOMPLETE][322] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][323] ([Intel XE#2313])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][324] ([Intel XE#7061]) -> [SKIP][325] ([Intel XE#8480])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][326] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][327] ([Intel XE#8480]) +1 other test skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][328] ([Intel XE#2486]) -> [SKIP][329] ([Intel XE#8480])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-bmg:          [TIMEOUT][330] ([Intel XE#8465]) -> [INCOMPLETE][331] ([Intel XE#1035] / [Intel XE#8479])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][332] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][333] ([Intel XE#7283])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][334] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][335] ([Intel XE#8480])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-yf.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-bmg:          [SKIP][336] ([Intel XE#2763] / [Intel XE#6886]) -> [INCOMPLETE][337] ([Intel XE#8459] / [Intel XE#8479]) +1 other test incomplete
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_dc@dc5-pageflip-negative:
    - shard-bmg:          [SKIP][338] ([Intel XE#6927]) -> [SKIP][339] ([Intel XE#8480])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_pm_dc@dc5-pageflip-negative.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_pm_dc@dc5-pageflip-negative.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][340] ([Intel XE#3309] / [Intel XE#7368]) -> [SKIP][341] ([Intel XE#8480])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][342] -> [SKIP][343] ([Intel XE#8440])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][344] ([Intel XE#1489]) -> [SKIP][345] ([Intel XE#8480]) +2 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-dpms:
    - shard-bmg:          [SKIP][346] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][347] ([Intel XE#8480])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_psr@psr-dpms.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_psr@psr-dpms.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][348] ([Intel XE#1499]) -> [SKIP][349] ([Intel XE#8480])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-bmg:          [SKIP][350] ([Intel XE#8440] / [Intel XE#8480]) -> [INCOMPLETE][351] ([Intel XE#8479])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_ccs@block-multicopy-compressed.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_eudebug_online@breakpoint-not-in-debug-mode:
    - shard-bmg:          [SKIP][352] ([Intel XE#7636]) -> [SKIP][353] ([Intel XE#8480]) +3 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][354] ([Intel XE#8480]) -> [SKIP][355] ([Intel XE#8440] / [Intel XE#8480]) +74 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [SKIP][356] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][357] ([Intel XE#8439] / [Intel XE#8479]) +1 other test incomplete
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][358] ([Intel XE#2322] / [Intel XE#7372]) -> [CRASH][359] ([Intel XE#8482]) +1 other test crash
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          [INCOMPLETE][360] ([Intel XE#8439] / [Intel XE#8479]) -> [SKIP][361] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][362] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][363] ([Intel XE#8480]) +2 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault:
    - shard-bmg:          [SKIP][364] ([Intel XE#8374]) -> [INCOMPLETE][365] ([Intel XE#8479]) +1 other test incomplete
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][366] ([Intel XE#8374]) -> [SKIP][367] ([Intel XE#8480]) +4 other tests skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][368] ([Intel XE#8364]) -> [SKIP][369] ([Intel XE#8480]) +7 other tests skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd:
    - shard-bmg:          [SKIP][370] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][371] ([Intel XE#8364]) +2 other tests skip
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault:
    - shard-bmg:          [SKIP][372] ([Intel XE#8440] / [Intel XE#8480]) -> [FAIL][373] ([Intel XE#8479])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset:
    - shard-bmg:          [FAIL][374] ([Intel XE#8479]) -> [INCOMPLETE][375] ([Intel XE#8159] / [Intel XE#8479])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][376] ([Intel XE#8366] / [Intel XE#8479]) -> [SKIP][377] ([Intel XE#8378]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:
    - shard-bmg:          [SKIP][378] ([Intel XE#8378]) -> [INCOMPLETE][379] ([Intel XE#8366] / [Intel XE#8479]) +1 other test incomplete
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:
    - shard-bmg:          [SKIP][380] ([Intel XE#8378]) -> [SKIP][381] ([Intel XE#8480]) +1 other test skip
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [CRASH][382] ([Intel XE#8448]) -> [INCOMPLETE][383] ([Intel XE#8479] / [Intel XE#8486])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          [SKIP][384] ([Intel XE#6964]) -> [SKIP][385] ([Intel XE#6964] / [Intel XE#8440])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-bmg:          [SKIP][386] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][387] ([Intel XE#8480])
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][388] ([Intel XE#944]) -> [SKIP][389] ([Intel XE#8480])
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_query@multigpu-query-hwconfig.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_query@multigpu-query-hwconfig.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6126
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6927
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7321
  [Intel XE#7329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7329
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440
  [Intel XE#8441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441
  [Intel XE#8446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446
  [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
  [Intel XE#8448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448
  [Intel XE#8449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449
  [Intel XE#8450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450
  [Intel XE#8451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451
  [Intel XE#8459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459
  [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
  [Intel XE#8464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464
  [Intel XE#8465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465
  [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
  [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
  [Intel XE#8469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469
  [Intel XE#8476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8476
  [Intel XE#8477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e -> xe-pw-169210v1

  IGT_8986: 8986
  xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e: e6102c1e8d8afa97ddf3c4b73e36545b518e075e
  xe-pw-169210v1: 169210v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/index.html

--===============2937448176793679614==
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
<tr><td><b>Series:</b></td><td>drm/i915/hdcp: check streams[] bounds before=
 overflow</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169210/">https://patchwork.freedesktop.org/series/169210/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169210v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169210v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b5=
18e075e_FULL -&gt; xe-pw-169210v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169210v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-169210v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1692=
10v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-large-execqueues-new-nomemset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/s=
hard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-new-n=
omemset.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-shared-remap-dontun=
map:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-shared-remap-dontunmap.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169210v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
77">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_=
async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel =
XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_asyn=
c_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">=
FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/60=
78">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_atomic_transition@plane-=
all-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8446">Intel XE#8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8479">Intel XE#8479</a>) +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE=
#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_bw@connected-linear-tili=
ng-4-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_bw@linear-tiling-3-displa=
ys-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-=
4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_chamelium_hpd@common-hpd-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_content_protection@legacy=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fa=
il</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_content_protection@mei-in=
terface.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_cursor_crc@cursor-offscr=
een-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_cursor_crc@cursor-random=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic-transitions-varying-size.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shar=
d-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions-varying-siz=
e.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8151">Intel XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioc=
tl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_dp_link_training@non-uhb=
r-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_dsc@dsc-with-output-form=
ats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_fbcon_fbt@fbc-suspend.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_flip@2x-blocking-absolute=
-wf_vblank-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_flip=
@blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@km=
s_flip@blocking-absolute-wf_vblank-interruptible.html">CRASH</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-2/ig=
t@kms_flip@flip-vs-expired-vblank-interruptible@a-edp1.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#30=
1</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-d=
p2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@a-dp2.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v=
1/shard-bmg-9/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interr=
uptible@a-dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other tes=
t incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-b=
mg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html=
">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8467">Intel XE#8467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-6/igt@kms_flip=
_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling@pipe-a-default-mode=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169210v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16b=
pp-linear-upscaling@pipe-a-default-mode.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) =
+1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-b=
mg-5/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-upscaling.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE=
#8467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8479">Intel XE#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +21 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +53 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#=
8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-cur-indfb-draw-render.html">TIMEOUT</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +61 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_pipe_stress@stress-xrgb88=
88-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_plane@pixel-format-x-til=
ed-modifier-source-clamping@pipe-a-plane-0.html">TIMEOUT</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8465">Intel XE#8465</a>) =
+1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +6 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-a:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-modifiers@pipe-a.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pi=
pe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-upscale-factor-0-25@pipe-a.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16921=
0v1/shard-bmg-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-f=
actor-0-25@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +5 other=
 tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/sh=
ard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor=
-0-25.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 oth=
er test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel X=
E#8459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_pm_backlight@brightness-w=
ith-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8395">Intel XE#8395</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_pm_dc@dc3co-after-dc6@psr=
2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_psr2_sf@fbc-pr-primary-p=
lane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_psr2_su@page_flip-p010.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_psr@psr-primary-page-fli=
p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_rotation_crc@sprite-rota=
tion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mod=
e-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_sharpness_filter@invalid-=
filter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_ccs@block-copy-uncompress=
ed-inc-dimension.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +5 other =
tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_eudebug@basic-vm-access-us=
erptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7636">Intel XE#7636</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_evict@evict-beng-mixed-ma=
ny-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_evict@evict-threads-small-=
multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8370">Intel XE#8370</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_balancer@many-execque=
ues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +1=
17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-bindexecqueue-userptr-rebind@r=
cs0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_basic@many-execqueues=
-many-vm-bindexecqueue-userptr-rebind@rcs0.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a=
>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#73=
72</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +12 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +31 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-reuse-many-queue-switch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_reset@multi-queue-lon=
g-spin-reuse-many-queue-switch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-shared-remap-don=
tunmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@man=
y-large-execqueues-mmap-shared-remap-dontunmap.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#815=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437=
">Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-hug=
e-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-free-huge-nomemset.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-map:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-large-execqueues-new-bo-map.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/sha=
rd-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-new-bo-=
map.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-many-execqueues-mmap.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/ig=
t@xe_exec_system_allocator@threads-many-execqueues-mmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#=
8480</a>) +151 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-malloc-mlock:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-lnl-4/igt@xe_exec_system_allocator@thre=
ads-many-malloc-mlock.html">ABORT</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bu=
sy-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-execqueues-malloc-busy-nomemset.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel X=
E#7928</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-madvise:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-malloc-madvise.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480=
</a>) +110 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-prefetch-madvise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-malloc-prefetch-ma=
dvise.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared=
-vm-many-large-execqueues-malloc-prefetch-madvise.html">TIMEOUT</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#844=
7</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479=
">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file-mlock:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-man=
y-large-execqueues-mmap-file-mlock.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8=
437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
79">Intel XE#8479</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetc=
h-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-malloc-prefetch-race.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) +15 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-prefetch=
-shared:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-mmap-prefetch-shared.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9210v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stri=
de-mmap-prefetch-shared.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2=
6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-do=
ntunmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-mmap-remap-dontunmap.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9210v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-str=
ide-mmap-remap-dontunmap.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7928">Intel XE#7928</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel =
XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_=
threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-9/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-shared-vm-userptr-invalidate-race:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_threads@threads-bal-=
mixed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel=
 XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-1/igt@xe_exec_=
threads@threads-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-6/=
igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">I=
ntel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-mixed-fd-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-b=
mg-4/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8486">Intel XE#8486</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_ggtt_init_early.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel X=
E#8486</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_tile_init_early.html">CRASH</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) +1 other=
 test crash</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_live_=
ktest@xe_dma_buf.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_live_ktest@xe_dma_buf.htm=
l">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8464">Intel XE#8464</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7321">Intel XE#7321</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-b=
mg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/sha=
rd-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e=
075e/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b=
518e075e/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e3=
6545b518e075e/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c=
4b73e36545b518e075e/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97d=
df3c4b73e36545b518e075e/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8a=
fa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e=
8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e610=
2c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-=
e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-=
bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/sh=
ard-bmg-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
10v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
210v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9210v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9210v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_module_load@load.html">SKIP</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69210v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_mod=
ule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-concurre=
nt-access-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6964">Intel XE#6964</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_page_reclaim@boundary-spli=
t.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_pat@pat-sw-hw-compare.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-3/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fa=
ult.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@xe_pxp@pxp-termination-key-up=
date-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_sriov_admin@exec-quantum-=
write-readback-vfs-disabled.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8477">Intel XE#8477</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_wedge=
d@wedged-mode-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@xe_wedged@wedged-mode-to=
ggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_atom=
ic_transition@plane-use-after-nonblocking-unbind-fencing.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">In=
tel XE#8174</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_atomic_transition@plane-u=
se-after-nonblocking-unbind-fencing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">In=
tel XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Int=
el XE#8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stri=
de-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151"=
>Intel XE#8151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-=
vs-flipb-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">=
Intel XE#8151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-169210v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic=
-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_flip=
@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155"=
>Intel XE#8155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_flip@2x-single-buffer=
-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shar=
d-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.h=
tml">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8467">Intel XE#8467</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_flip_scaled=
_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PA=
SS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-scndscrn-pri-shrfb-draw-render.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Inte=
l XE#8466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr=
-2p-scndscrn-pri-shrfb-draw-render.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Inte=
l XE#8459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_plane_scaling@plane-downsca=
le-factor-0-5-with-pixel-format.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-5.html">TIMEOUT</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-=
bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-b=
b-system-target-system:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_=
store@long-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target=
-system.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_store@lon=
g-shader-bb-check@gt0-drm_xe_engine_class_render0-bb-system-target-system.h=
tml">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_=
system_allocator@once-large-mmap-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#=
8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169210v1/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-nomemset.=
html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_=
system_allocator@pat-index-madvise-max-pat-index-single-vma.html">CRASH</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450">Inte=
l XE#8450</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169210v1/shard-bmg-2/igt@xe_exec_system_allocator@pat-index-madvise-ma=
x-pat-index-single-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomems=
et:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-large-execqueues-malloc-nomemset.html">FAIL</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v=
1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-execqueues-ma=
lloc-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-race-nomemset=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-stride-mmap-free-race-nomemset.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Inte=
l XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169210v1/shard-bmg-4/igt@xe_exec_system_allocator@process-many-stride-=
mmap-free-race-nomemset.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-file.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_ex=
ec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file.html"=
>PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@xe_exec_system=
_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html">PASS=
</a> +36 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_clas=
s_defaults:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_fault=
_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8486">Intel XE#8486</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_add_hw_engine_class_defaults.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_uc_fw_init.html">CRASH</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8=
448</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69210v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_u=
c_fw_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-6/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-lnl-4/igt@xe_wedged=
@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_asyn=
c_flips@basic-modeset-with-all-modifiers-formats.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
10v1/shard-bmg-4/igt@kms_async_flips@basic-modeset-with-all-modifiers-forma=
ts.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#56=
43</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169210v1/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other te=
sts timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-2/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Int=
el XE#8446</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169210v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Int=
el XE#8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169210v1/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-2/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#84=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169210v1/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp=
-rotate-0-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel =
XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_big_fb@x-tiled-max-hw-stride-=
32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#56=
43</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169210v1/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp=
-rotate-180-hflip.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Int=
el XE#8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_big_fb@x-tiled-max-hw-stri=
de-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">=
Intel XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-169210v1/shard-lnl-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-1/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">In=
tel XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1=
/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8480">Intel XE#8480</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE=
#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169210v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-h=
flip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Int=
el XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169210v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rota=
te-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +26 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#84=
40</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/848=
0">Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bp=
p-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-target-1920x1080p.html">CRASH</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8449">Intel XE#844=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
210v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-target-1920=
x1080p.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8469">Intel XE#8469</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8476">Intel XE#8476</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1=
/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"=
>Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_bw@l=
inear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-b=
mg-4/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel =
XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_bw@=
linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-=
bmg-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_ccs@=
crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Int=
el XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169210v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Inte=
l XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169210v1/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-=
ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_ccs@=
crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-=
bmg-5/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">=
Intel XE#8150</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_ccs=
@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
10v1/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-=
cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8150">Intel XE#8150</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4=
/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_cham=
elium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/ig=
t@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_cham=
elium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6507">Intel XE#6507</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4=
/igt@kms_chamelium_sharpness_filter@filter-basic.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_colo=
r_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1=
/shard-bmg-4/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel =
XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_cont=
ent_protection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE=
#7374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169210v1/shard-bmg-4/igt@kms_content_protection@legacy-hdcp14.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">In=
tel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shar=
d-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms=
_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7935">Intel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169210v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying=
-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_curs=
or_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html">TIM=
EOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
51">Intel XE#8451</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_cursor_legacy@short=
-flip-after-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varyin=
g-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_curs=
or_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8151">Intel XE#8151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_cursor_legacy@s=
hort-flip-before-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Int=
el XE#8151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_fbc=
on_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6126">Intel XE#6126</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_fbcon=
_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">CRASH</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel X=
E#8461</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169210v1/shard-bmg-9/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modes=
et-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel =
XE#8467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-4t=
ile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169210v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-t=
o-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">I=
ntel XE#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-rte:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms=
_frontbuffer_tracking@fbc-1p-rte.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Inte=
l XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169210v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen=
-pri-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-s=
pr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">In=
tel XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8480">Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-render.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc=
hdr-2p-primscrn-pri-indfb-draw-render.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">In=
tel XE#8466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel =
XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8480">Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shar=
d-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">In=
tel XE#8480</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480=
">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel=
 XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169210v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-=
mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8480">Intel XE#8480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_panel_fitt=
ing@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plan=
e@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">TIMEOUT</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465">Intel =
XE#8465</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169210v1/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier=
-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamp=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_plan=
e@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">INCOM=
PLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-9/igt@kms_plane@pixel-format=
-y-tiled-gen12-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg=
-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel =
XE#2763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/6886">Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169210v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-=
20x20-downscale-factor-0-5@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#84=
79</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-pageflip-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_pm_d=
c@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6927">Intel XE#6927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_pm_=
dc@dc5-pageflip-negative.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4=
/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@kms_pm_rpm@dpms-mode=
-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8440">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_psr2=
_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#=
1489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169210v1/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-ex=
ceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8480">Intel XE#8480</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_psr@=
psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_psr@=
psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@kms_vrr@=
seamless-rr-switch-vrr.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_ccs@b=
lock-multicopy-compressed.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-b=
mg-8/igt@xe_ccs@block-multicopy-compressed.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-not-in-debug-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_eudeb=
ug_online@breakpoint-not-in-debug-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bm=
g-4/igt@xe_eudebug_online@breakpoint-not-in-debug-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8=
480</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec=
_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shar=
d-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Int=
el XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8480">Intel XE#8480</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execque=
ues-many-vm-basic-defer-mmap.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_basic@multig=
pu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">CRASH</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Inte=
l XE#8482</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Inte=
l XE#8439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169210v1/shard-bmg-7/igt@xe_exec_basic@multigpu-many-exe=
cqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Inte=
l XE#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-=
bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-userptr-fault=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_exec_=
fault_mode@many-execqueues-multi-queue-invalid-userptr-fault.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Inte=
l XE#8374</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169210v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queu=
e-invalid-userptr-fault.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test in=
complete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_=
fault_mode@once-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
10v1/shard-bmg-4/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate=
-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8480">Intel XE#8480</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
10v1/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-prior=
ity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8480">Intel XE#8480</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-close-fd.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480"=
>Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-m=
ode-fault-close-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_=
system_allocator@process-many-execqueues-malloc-multi-fault.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel=
 XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8480">Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169210v1/shard-bmg-8/igt@xe_exec_system_allocator@process=
-many-execqueues-malloc-multi-fault.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-file-nom=
emset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-file-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169210v1/shard-bmg-10/igt@xe_exec_system_allocator@process-many-l=
arge-execqueues-mmap-file-nomemset.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">I=
ntel XE#8366</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169210v1/shard-bmg-2/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-fd-userptr-invalidate-race:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_exec_=
threads@threads-multi-queue-hang-fd-userptr-invalidate-race.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel=
 XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169210v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-hang-fd-us=
erptr-invalidate-race.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 o=
ther test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
10v1/shard-bmg-4/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-us=
erptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8480">Intel XE#8480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_fault=
_injection@inject-fault-probe-function-xe_pcode_probe_early.html">CRASH</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Inte=
l XE#8448</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169210v1/shard-bmg-4/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_pcode_probe_early.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_mult=
igpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-8=
/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Int=
el XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/ig=
t@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169210v1/shard-bmg-4/igt@xe_query=
@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e -&gt; xe-pw-169=
210v1</li>
</ul>
<p>IGT_8986: 8986<br />
  xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e: e6102c1e8d8afa97ddf3c4b=
73e36545b518e075e<br />
  xe-pw-169210v1: 169210v1</p>

</body>
</html>

--===============2937448176793679614==--
