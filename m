Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A355CDE00B
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jun 2026 23:00:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D631110F3BE;
	Thu, 25 Jun 2026 23:00:08 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE2A10F3BE;
 Thu, 25 Jun 2026 23:00:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0935841446071654827=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_balance_exec_que?=
 =?utf-8?q?ue_suspend/resume_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 25 Jun 2026 23:00:07 -0000
Message-ID: <178242840788.118588.12329304511106719354@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260625025348.1620469-7-niranjana.vishwanathapura@intel.com>
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

--===============0935841446071654827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: balance exec queue suspend/resume (rev2)
URL   : https://patchwork.freedesktop.org/series/169125/
State : failure

== Summary ==

CI Bug Log - changes from xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e_FULL -> xe-pw-169125v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169125v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169125v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169125v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][1] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [CRASH][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3:
    - shard-bmg:          NOTRUN -> [WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-3.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:
    - shard-bmg:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset.html

  
#### Warnings ####

  * igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [INCOMPLETE][7] ([Intel XE#8479]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p.html

  
Known issues
------------

  Here are the changes found in xe-pw-169125v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#8440])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@core_hotunplug@unplug-rescan.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#5177] / [Intel XE#8441] / [Intel XE#8480])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@intel_hwmon@hwmon-read.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][11] ([Intel XE#8174] / [Intel XE#8479])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2370])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][13] -> [TIMEOUT][14] ([Intel XE#8446] / [Intel XE#8479]) +1 other test timeout
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][15] ([Intel XE#5643] / [Intel XE#8479]) +2 other tests incomplete
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [TIMEOUT][16] ([Intel XE#8446] / [Intel XE#8479])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7059] / [Intel XE#7085]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#5643] / [Intel XE#8479])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +14 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2328] / [Intel XE#7367])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7679])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#367])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652]) +17 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][26] ([Intel XE#8150] / [Intel XE#8437] / [Intel XE#8479])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#3432]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2887]) +21 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2325] / [Intel XE#7358])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7358])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2252]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6974])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2390] / [Intel XE#6974])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][34] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +5 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7642])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-bmg:          NOTRUN -> [FAIL][36] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#2320]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#7809]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1508]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4354] / [Intel XE#5882])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8265]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2373] / [Intel XE#7448])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1138] / [Intel XE#7344])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2374] / [Intel XE#6127])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [PASS][47] -> [FAIL][48] ([Intel XE#3098]) +1 other test fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][49] -> [INCOMPLETE][50] ([Intel XE#8155] / [Intel XE#8479])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          NOTRUN -> [CRASH][51] ([Intel XE#8461])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible:
    - shard-bmg:          [PASS][52] -> [CRASH][53] ([Intel XE#8461])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_flip@blocking-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][54] ([Intel XE#8155] / [Intel XE#8479])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [TIMEOUT][55] ([Intel XE#8467] / [Intel XE#8479]) +5 other tests timeout
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7178] / [Intel XE#7351])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +22 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8441] / [Intel XE#8480]) +48 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +63 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7061]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [TIMEOUT][61] ([Intel XE#8466] / [Intel XE#8479]) +1 other test timeout
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [TIMEOUT][62] ([Intel XE#8479]) +1 other test timeout
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7061] / [Intel XE#7356]) +6 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2313]) +77 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#6911] / [Intel XE#7466])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7591])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#6912] / [Intel XE#7375])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#8303]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0:
    - shard-bmg:          NOTRUN -> [CRASH][69] ([Intel XE#8460]) +1 other test crash
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][70] ([Intel XE#1035] / [Intel XE#8479]) +1 other test incomplete
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7283]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier.html

  * igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#8076])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:
    - shard-bmg:          [PASS][73] -> [INCOMPLETE][74] ([Intel XE#8459] / [Intel XE#8479]) +1 other test incomplete
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2763] / [Intel XE#6886]) +9 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@pr:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#8395]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-framegap@pr.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#8396])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-framegap@psr2.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#1489]) +6 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2330] / [Intel XE#5813])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2413])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#6503]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_vrr@flip-basic:
    - shard-bmg:          NOTRUN -> [SKIP][86] ([Intel XE#1499]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#8397])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][88] ([Intel XE#8437] / [Intel XE#8479]) +6 other tests incomplete
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed-inc-dimension.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6599])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#7636]) +18 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#5793] / [Intel XE#7320] / [Intel XE#7464])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][92] ([Intel XE#6321] / [Intel XE#8355])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#8370]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory:
    - shard-bmg:          [PASS][94] -> [INCOMPLETE][95] ([Intel XE#8437] / [Intel XE#8479])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race:
    - shard-bmg:          [PASS][96] -> [INCOMPLETE][97] ([Intel XE#8479])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#8480]) +126 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][99] ([Intel XE#8439] / [Intel XE#8479])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#2322] / [Intel XE#7372]) +8 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][101] ([Intel XE#8479]) +10 other tests incomplete
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#8440] / [Intel XE#8480]) +97 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][103] ([Intel XE#8374]) +15 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#8364]) +34 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-gt-reset:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#8369]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [PASS][106] -> [FAIL][107] ([Intel XE#8479]) +4 other tests fail
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:
    - shard-bmg:          NOTRUN -> [FAIL][108] ([Intel XE#8479]) +1 other test fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise:
    - shard-bmg:          NOTRUN -> [TIMEOUT][109] ([Intel XE#8447] / [Intel XE#8479])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvise.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][110] ([Intel XE#8159] / [Intel XE#8479]) +22 other tests incomplete
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][111] ([Intel XE#7928] / [Intel XE#8159] / [Intel XE#8479]) +1 other test incomplete
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-busy-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset:
    - shard-bmg:          [PASS][112] -> [INCOMPLETE][113] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) +2 other tests incomplete
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise:
    - shard-bmg:          [PASS][114] -> [TIMEOUT][115] ([Intel XE#8447] / [Intel XE#8479]) +2 other tests timeout
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise:
    - shard-bmg:          [PASS][116] -> [TIMEOUT][117] ([Intel XE#8356] / [Intel XE#8447])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap:
    - shard-bmg:          [PASS][118] -> [INCOMPLETE][119] ([Intel XE#8159] / [Intel XE#8479]) +14 other tests incomplete
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][120] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) +2 other tests incomplete
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][121] -> [TIMEOUT][122] ([Intel XE#8470] / [Intel XE#8479])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-5/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][123] -> [TIMEOUT][124] ([Intel XE#8479])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-1/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-6/igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8378]) +11 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [PASS][126] -> [CRASH][127] ([Intel XE#8448]) +1 other test crash
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          NOTRUN -> [CRASH][128] ([Intel XE#8448]) +2 other tests crash
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][129] ([Intel XE#8479] / [Intel XE#8486]) +2 other tests incomplete
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#2833])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-bmg:          NOTRUN -> [FAIL][131] ([Intel XE#8464]) +2 other tests fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2459] / [Intel XE#2596] / [Intel XE#7321] / [Intel XE#7453])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [PASS][140], [PASS][141], [PASS][142], [PASS][143], [PASS][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151], [PASS][152], [PASS][153], [PASS][154], [PASS][155], [PASS][156]) -> ([PASS][157], [PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [SKIP][180], [PASS][181], [PASS][182]) ([Intel XE#2457] / [Intel XE#7405])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_load@load.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_module_load@load.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_module_load@load.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_module_load@load.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_module_load@load.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_module_load@load.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_module_load@load.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][183] ([Intel XE#6964]) +7 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][184] ([Intel XE#7793])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][185] ([Intel XE#2236] / [Intel XE#7590])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-bmg:          NOTRUN -> [FAIL][186] ([Intel XE#7695])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][187] ([Intel XE#2284] / [Intel XE#7370])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          NOTRUN -> [SKIP][188] ([Intel XE#579] / [Intel XE#7329] / [Intel XE#7517])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][189] ([Intel XE#4733] / [Intel XE#7417]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][190] ([Intel XE#944]) +3 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0:
    - shard-bmg:          [PASS][191] -> [TIMEOUT][192] ([Intel XE#8472] / [Intel XE#8479]) +1 other test timeout
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0.html

  * igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:
    - shard-bmg:          [PASS][193] -> [TIMEOUT][194] ([Intel XE#8462] / [Intel XE#8479])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [PASS][195] -> [ABORT][196] ([Intel XE#8007])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing:
    - shard-bmg:          [INCOMPLETE][197] ([Intel XE#8174] / [Intel XE#8479]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind-fencing.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [INCOMPLETE][199] ([Intel XE#8479]) -> [PASS][200] +7 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [CRASH][201] ([Intel XE#8449]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [INCOMPLETE][203] ([Intel XE#8151]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][205] ([Intel XE#8151] / [Intel XE#8479]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-blocking-wf_vblank:
    - shard-bmg:          [FAIL][207] ([Intel XE#3098]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_flip@2x-blocking-wf_vblank.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_flip@2x-blocking-wf_vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [TIMEOUT][209] ([Intel XE#8467] / [Intel XE#8479]) -> [PASS][210] +7 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][211] ([Intel XE#8368] / [Intel XE#8479]) -> [PASS][212] +3 other tests pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][213] ([Intel XE#8466] / [Intel XE#8479]) -> [PASS][214] +6 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [INCOMPLETE][215] ([Intel XE#8459]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:
    - shard-bmg:          [INCOMPLETE][217] ([Intel XE#8459] / [Intel XE#8479]) -> [PASS][218] +3 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-bmg:          [TIMEOUT][219] -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@xe_exec_system_allocator@once-large-mmap-nomemset:
    - shard-bmg:          [SKIP][221] ([Intel XE#8440] / [Intel XE#8480]) -> [PASS][222] +5 other tests pass
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_system_allocator@once-large-mmap-nomemset.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-nomemset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma:
    - shard-bmg:          [CRASH][223] ([Intel XE#8450]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@pat-index-madvise-max-pat-index-single-vma.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset:
    - shard-bmg:          [FAIL][225] -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-nomemset.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch:
    - shard-bmg:          [FAIL][227] ([Intel XE#8479]) -> [PASS][228] +6 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefetch.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file:
    - shard-bmg:          [INCOMPLETE][229] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-file.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro:
    - shard-bmg:          [INCOMPLETE][231] ([Intel XE#8159] / [Intel XE#8479]) -> [PASS][232] +29 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults:
    - shard-bmg:          [INCOMPLETE][233] ([Intel XE#8486]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_add_hw_engine_class_defaults.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init:
    - shard-bmg:          [CRASH][235] ([Intel XE#8448]) -> [PASS][236] +1 other test pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_uc_fw_init.html

  
#### Warnings ####

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:
    - shard-bmg:          [TIMEOUT][237] ([Intel XE#8479]) -> [INCOMPLETE][238] ([Intel XE#8437] / [Intel XE#8479])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@kms_async_flips@basic-modeset-with-all-modifiers-formats.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          [TIMEOUT][239] ([Intel XE#8446] / [Intel XE#8479]) -> [INCOMPLETE][240] ([Intel XE#5643] / [Intel XE#8479]) +2 other tests incomplete
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][241] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][242] ([Intel XE#3658] / [Intel XE#7360])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [INCOMPLETE][243] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][244] ([Intel XE#8446] / [Intel XE#8479]) +4 other tests timeout
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [TIMEOUT][245] ([Intel XE#8446]) -> [INCOMPLETE][246] ([Intel XE#5643] / [Intel XE#8479])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [INCOMPLETE][247] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][248] ([Intel XE#8446] / [Intel XE#8479]) +1 other test timeout
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][249] ([Intel XE#5643]) -> [INCOMPLETE][250] ([Intel XE#5643] / [Intel XE#8479])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [SKIP][251] ([Intel XE#1124]) -> [INCOMPLETE][252] ([Intel XE#5643] / [Intel XE#8479]) +1 other test incomplete
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][253] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][254] ([Intel XE#1124])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][255] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][256] ([Intel XE#8446]) +1 other test timeout
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][257] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][258] ([Intel XE#8440] / [Intel XE#8480]) +26 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][259] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][260] ([Intel XE#1124])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [INCOMPLETE][261] ([Intel XE#8479]) -> [SKIP][262] ([Intel XE#7679]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][263] ([Intel XE#7679]) -> [INCOMPLETE][264] ([Intel XE#8479])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][265] ([Intel XE#367]) -> [INCOMPLETE][266] ([Intel XE#8479]) +4 other tests incomplete
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][267] ([Intel XE#8479]) -> [TIMEOUT][268] ([Intel XE#8469] / [Intel XE#8479])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          [INCOMPLETE][269] ([Intel XE#8479]) -> [SKIP][270] ([Intel XE#367]) +2 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [INCOMPLETE][271] ([Intel XE#8150] / [Intel XE#8437] / [Intel XE#8479]) -> [SKIP][272] ([Intel XE#2887])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][273] ([Intel XE#2887]) -> [TIMEOUT][274] ([Intel XE#8463])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][275] ([Intel XE#8151] / [Intel XE#8479]) -> [INCOMPLETE][276] ([Intel XE#8151])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][277] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][278] ([Intel XE#309] / [Intel XE#7343])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [INCOMPLETE][279] ([Intel XE#8151]) -> [INCOMPLETE][280] ([Intel XE#8151] / [Intel XE#8479])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][281] ([Intel XE#8451] / [Intel XE#8479]) -> [INCOMPLETE][282] ([Intel XE#8151] / [Intel XE#8479])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [INCOMPLETE][283] ([Intel XE#8479]) -> [SKIP][284] ([Intel XE#7178] / [Intel XE#7349])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][285] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][286] ([Intel XE#2311])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][287] ([Intel XE#8466] / [Intel XE#8479]) -> [INCOMPLETE][288] ([Intel XE#8368] / [Intel XE#8479])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [INCOMPLETE][289] ([Intel XE#8368] / [Intel XE#8479]) -> [TIMEOUT][290] ([Intel XE#8466] / [Intel XE#8479])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][291] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][292] ([Intel XE#2313])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-bmg:          [INCOMPLETE][293] ([Intel XE#8368] / [Intel XE#8479]) -> [SKIP][294] ([Intel XE#2313])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][295] ([Intel XE#2313]) -> [INCOMPLETE][296] ([Intel XE#8368] / [Intel XE#8479]) +2 other tests incomplete
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][297] ([Intel XE#3544]) -> [SKIP][298] ([Intel XE#3374] / [Intel XE#3544])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-bmg:          [TIMEOUT][299] ([Intel XE#8465]) -> [INCOMPLETE][300] ([Intel XE#1035] / [Intel XE#8479])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][301] ([Intel XE#7283]) -> [INCOMPLETE][302] ([Intel XE#1035] / [Intel XE#8479]) +1 other test incomplete
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][303] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][304] ([Intel XE#7283]) +1 other test skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][305] -> [SKIP][306] ([Intel XE#8440])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][307] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][308] ([Intel XE#2509] / [Intel XE#7437])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-bmg:          [SKIP][309] ([Intel XE#8440] / [Intel XE#8480]) -> [INCOMPLETE][310] ([Intel XE#8479])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_ccs@block-multicopy-compressed.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate:
    - shard-bmg:          [SKIP][311] ([Intel XE#8480]) -> [SKIP][312] ([Intel XE#8440] / [Intel XE#8480]) +74 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [INCOMPLETE][313] ([Intel XE#8439] / [Intel XE#8479]) -> [SKIP][314] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][315] ([Intel XE#8439] / [Intel XE#8479]) -> [CRASH][316] ([Intel XE#8482])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          [SKIP][317] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][318] ([Intel XE#8479])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][319] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][320] ([Intel XE#8439] / [Intel XE#8479])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd:
    - shard-bmg:          [SKIP][321] ([Intel XE#8440] / [Intel XE#8480]) -> [SKIP][322] ([Intel XE#8364]) +2 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault:
    - shard-bmg:          [SKIP][323] ([Intel XE#8440] / [Intel XE#8480]) -> [FAIL][324] ([Intel XE#8479])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [FAIL][325] ([Intel XE#8479]) -> [INCOMPLETE][326] ([Intel XE#8159] / [Intel XE#8479])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][327] ([Intel XE#8366] / [Intel XE#8479]) -> [SKIP][328] ([Intel XE#8378]) +1 other test skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race:
    - shard-bmg:          [SKIP][329] ([Intel XE#8378]) -> [INCOMPLETE][330] ([Intel XE#8366] / [Intel XE#8479]) +1 other test incomplete
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:
    - shard-bmg:          [SKIP][331] ([Intel XE#6964]) -> [SKIP][332] ([Intel XE#6964] / [Intel XE#8440])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#5793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5793
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7320
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
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7464
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7517]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7517
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7928]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8076]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8076
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151
  [Intel XE#8155]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8356
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8366
  [Intel XE#8368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
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
  [Intel XE#8460]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8460
  [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
  [Intel XE#8462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8462
  [Intel XE#8463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463
  [Intel XE#8464]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8464
  [Intel XE#8465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465
  [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
  [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
  [Intel XE#8469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8469
  [Intel XE#8470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470
  [Intel XE#8472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8472
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e -> xe-pw-169125v2

  IGT_8986: 8986
  xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e: e6102c1e8d8afa97ddf3c4b73e36545b518e075e
  xe-pw-169125v2: 169125v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/index.html

--===============0935841446071654827==
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
<tr><td><b>Series:</b></td><td>drm/xe: balance exec queue suspend/resume (r=
ev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169125/">https://patchwork.freedesktop.org/series/169125/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169125v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169125v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b5=
18e075e_FULL -&gt; xe-pw-169125v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169125v2_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-169125v2_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1691=
25v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@=
ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> +4 oth=
er tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_plane@pixel-format-x-tile=
d-modifier-source-clamping@pipe-a-plane-3.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp-=
stress.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-nomemset:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-stride-mmap-new-huge-nomemset.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/s=
hard-bmg-2/igt@xe_exec_system_allocator@process-many-stride-mmap-new-huge-n=
omemset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_bw@connected-linear-tiling-1-displays-target-3840x2160p:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-1-displays-target-3840x2160p.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169125v2/shard-bmg-4/igt@kms_bw@connected-linear-tiling-1-displays-target=
-3840x2160p.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169125v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@core_hotunplug@unplug-rescan.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8440">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@intel_hwmon@hwmon-read.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
77">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8441">Intel XE#8441</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8174">Intel XE#8174=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-internal-panels.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bm=
g-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8446">Intel XE#8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8479">Intel XE#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479=
</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">TIMEOUT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_big_fb@linear-64bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_big_fb@linear-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/ig=
t@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Int=
el XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2328">Intel XE#2328</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_bw@linear-tiling-3-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +17 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#84=
79</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-ti=
led-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_chamelium_color_pipeline@=
plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_chamelium_frames@hdmi-as=
pect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-type-0-suspend-resume.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_content_protection@dp-mst=
-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_content_protection@legac=
y.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +5 other tests f=
ail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_content_protection@lic-t=
ype-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_content_protection@uevent=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6707">Intel XE#6707</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_crc@cursor-random-=
512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cur=
sor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7809">Intel XE#7809</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_dp_link_training@non-uhbr=
-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4354">Intel XE#4354</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_dsc@dsc-fractional-bpp-b=
igjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8265">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_feature_discovery@display=
-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2373">Intel XE#2373</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_flip=
@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_flip@2x-dpms-vs-v=
blank-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/ig=
t@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8155">Int=
el XE#8155</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset.html">CRASH</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_flip=
@blocking-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@km=
s_flip@blocking-absolute-wf_vblank-interruptible.html">CRASH</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_flip@flip-vs-dpms-off-vs-=
modeset-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8155">Intel XE#8155</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64b=
pp-linear-to-32bpp-linear-upscaling@pipe-a-valid-mode.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE=
#8467</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8479">Intel XE#8479</a>) +5 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +22 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +48 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
drrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +63 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-cur-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
hdr-2p-scndscrn-cur-indfb-draw-render.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 ot=
her test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcp=
sr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +77 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-fo=
rce-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_multipipe_modeset@basic-m=
ax-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_pipe_stress@stress-xrgb8=
888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_plane@pixel-format-4-tile=
d-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping@pipe-a-plane=
-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_plane@pixel-format-x-tile=
d-modifier-source-clamping@pipe-a-plane-0.html">CRASH</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8460">Intel XE#8460</a>) +1 =
other test crash</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_plane@pixel-format-yf-ti=
led-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@planar-pixel-format-settings@nv12-tile4-src-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_plane@planar-pixel-format=
-settings@nv12-tile4-src-y.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8076">Intel XE#8076</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_plan=
e_scaling@plane-upscale-factor-0-25-with-modifiers@pipe-a.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/sha=
rd-bmg-2/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-modifiers@pip=
e-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8459">Intel XE#8459</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomple=
te</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel=
 XE#6886</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_pm_backlight@brightness-=
with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2938">Intel XE#2938</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_pm_backlight@fade-with-su=
spend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@pr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-framegap@=
pr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8395">Intel XE#8395</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_pm_dc@dc3co-vpb-framegap@=
psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_psr2_sf@fbc-pr-primary-pl=
ane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234=
">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_rotation_crc@sprite-rotat=
ion-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@kms_scaling_modes@scaling-mo=
de-center.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_sharpness_filter@invalid-=
filter-with-scaler.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_vrr@flip-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">=
Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_vrr@lobf-dc3co.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">=
Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_ccs@block-copy-uncompresse=
d-inc-dimension.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +6 other t=
ests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_compute@ccs-mode-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_eudebug_online@set-breakp=
oint-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7636">Intel XE#7636</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5793">Intel XE#5793</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7320">Intel XE#7320</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7464">Intel XE#7464</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_evict@evict-beng-mixed-man=
y-threads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_evict@evict-small-multi-q=
ueue-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-insta=
nce-0-tile-0-vram0-memory:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-vr=
am0-memory.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_atomic@basic-inc-all@engin=
e-drm_xe_engine_class_render-instance-0-tile-0-vram0-memory.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437"=
>Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_=
balancer@many-execqueues-cm-parallel-userptr-invalidate-race.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/=
shard-bmg-3/igt@xe_exec_balancer@many-execqueues-cm-parallel-userptr-invali=
date-race.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_balancer@many-execque=
ues-cm-virtual-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +126 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Inte=
l XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +8=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidat=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_compute_mode@many-exe=
cqueues-bindexecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)=
 +10 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_exec_fault_mode@many-execq=
ueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8=
480</a>) +97 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_fault_mode@many-multi=
-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +15 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-dyn-priority-smem:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_multi_queue@one-queu=
e-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +34 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-gt-reset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-=
gt-reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontu=
nmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169125v2/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueue=
s-mmap-remap-ro-dontunmap-eocheck.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +4 other tes=
ts fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-new-race-nomemset:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-new-race-nomemset.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other=
 test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-madvis=
e:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-malloc-madvise.html">TIMEOUT</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Intel XE#8447</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel =
XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-race-nom=
emset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_system_allocator@thr=
eads-many-large-execqueues-mmap-race-nomemset.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) +22 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-malloc-bu=
sy-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-execqueues-malloc-busy-nomemset.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7928">Intel XE=
#7928</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-file-mlock-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-file-mlock-no=
memset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-share=
d-vm-many-large-execqueues-mmap-file-mlock-nomemset.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel X=
E#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8437">Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8479">Intel XE#8479</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvi=
se:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-mmap-new-madvise.html">PASS</=
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v=
2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mma=
p-new-madvise.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8447">Intel XE#8447</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 other tests =
timeout</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-madvise:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-remap-madvise.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/sh=
ard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-remap-ma=
dvise.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8356">Intel XE#8356</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8447">Intel XE#8447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-remap-do=
ntunmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-shared-remap-dontunmap.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9125v2/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap=
-shared-remap-dontunmap.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1=
4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-r=
ead-after:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-malloc-fork-read-after.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8=
159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
37">Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8479">Intel XE#8479</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-5/igt@xe_exec_=
threads@threads-bal-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-ln=
l-2/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html">=
TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8470">Intel XE#8470</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-1/igt@xe_exec_=
threads@threads-mixed-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-lnl-6/=
igt@xe_exec_threads@threads-mixed-fd-userptr-invalidate-race.html">TIMEOUT<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">I=
ntel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8378">Intel XE#8378</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-b=
mg-3/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html=
">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8448">Intel XE#8448</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_fault_injection@inject-fa=
ult-probe-function-xe_device_probe_early.html">CRASH</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#8448</a>) +2 o=
ther tests crash</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_fault_injection@inject-fau=
lt-probe-function-xe_tile_init_early.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE=
#8486</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2833">Intel XE#2833</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_live_ktest@xe_mocs@xe_live=
_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8464">Intel XE#8464</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_media_fill@media-fill.html=
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
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
25v2/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-=
9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
25v2/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg=
-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
125v2/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
125v2/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_module_load@load.ht=
ml">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9125v2/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_mod=
ule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2457">Intel XE#2457</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7405">Intel XE#7405</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_multigpu_svm@mgpu-atomic-o=
p-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_page_reclaim@prl-max-entr=
ies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
36">Intel XE#2236</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-3/igt@xe_pat@pat-sw-hw-reset-compar=
e.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-10/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_pm@vram-d3cold-threshold.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/579">Intel XE#579</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7329">Intel XE#7329</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7517">Intel XE#7517</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_pxp@display-pxp-fb.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/473=
3">Intel XE#4733</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7417">Intel XE#7417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-=
random-gt1-vcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt1-vcs0=
.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169125v2/shard-bmg-3/igt@xe_sriov_scheduling@nonpreempt-engine-resets=
-normal-priority@numvfs-random-gt1-vcs0.html">TIMEOUT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8472">Intel XE#8472</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE=
#8479</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_vm@mu=
nmap-style-unbind-many-either-side-partial-hammer.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-9=
/igt@xe_vm@munmap-style-unbind-many-either-side-partial-hammer.html">TIMEOU=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8462"=
>Intel XE#8462</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@xe_wedge=
d@wedged-mode-toggle.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@xe_wedged@wedged-mode-to=
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
/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_atomic_transition@plane-u=
se-after-nonblocking-unbind-fencing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_bw@c=
onnected-linear-tiling-1-displays-target-1920x1080p.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169125v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-target=
-1920x1080p.html">PASS</a> +7 other tests pass</li>
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
125v2/shard-bmg-9/igt@kms_bw@connected-linear-tiling-2-displays-target-1920=
x1080p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_curs=
or_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Inte=
l XE#8151</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169125v2/shard-bmg-1/igt@kms_cursor_legacy@2x-long-nonblocking-modeset=
-vs-cursor-atomic.html">PASS</a></li>
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
-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_cursor_legacy@s=
hort-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_flip=
@2x-blocking-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_flip=
@2x-blocking-wf_vblank.html">PASS</a> +1 other test pass</li>
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
-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_flip_scaled=
_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">PA=
SS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-render.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc=
hdr-1p-primscrn-pri-indfb-draw-render.html">PASS</a> +3 other tests pass</l=
i>
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
/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">PASS</a> +6 other tests pass</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8459">Intel XE#8459</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_plane_scaling@plane-scaler-wi=
th-clipping-clamping-pixel-formats@pipe-a.html">PASS</a> +1 other test pass=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_plan=
e_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-a.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">=
Intel XE#8459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-5-unity-scaling@pipe-a.html">PASS</a> +3 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-5.html">TIMEOUT</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-=
bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html"=
>PASS</a> +1 other test pass</li>
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
169125v2/shard-bmg-8/igt@xe_exec_system_allocator@once-large-mmap-nomemset.=
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
e-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@pat-index-madvise-ma=
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
a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v=
2/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-ma=
lloc-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-prefet=
ch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-large-execqueues-malloc-prefetch.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">In=
tel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large=
-execqueues-malloc-prefetch.html">PASS</a> +6 other tests pass</li>
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
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@xe_ex=
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
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_system=
_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html">PASS=
</a> +29 other tests pass</li>
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
/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_fault_injection@inject-fau=
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
69125v2/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_u=
c_fw_init.html">PASS</a> +1 other test pass</li>
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
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1691=
25v2/shard-bmg-3/igt@kms_async_flips@basic-modeset-with-all-modifiers-forma=
ts.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">TIMEOUT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#84=
46</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp=
-rotate-0-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 ot=
her tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-4/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">In=
tel XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#7360=
</a>)</li>
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
el-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +4 other te=
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
xe-pw-169125v2/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotat=
e-180-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#56=
43</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-lnl-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp=
-rotate-180-hflip.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other te=
st timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">=
Intel XE#5643</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-169125v2/shard-lnl-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)<=
/li>
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
-169125v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-h=
flip-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other t=
est incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-4/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel =
XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169125v2/shard-lnl-3/igt@kms_big_fb@y-tiled-max-hw-stride-=
64bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-lnl-8/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel=
 XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169125v2/shard-lnl-4/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) +1 other test=
 timeout</li>
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
xe-pw-169125v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rota=
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
el-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bp=
p-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169125v2/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target=
-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_bw@=
connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#767=
9</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
125v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-3840=
x2160p.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_bw@l=
inear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-b=
mg-2/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">=
Intel XE#8479</a>) +4 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2=
/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
469">Intel XE#8469</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_bw@l=
inear-tiling-4-displays-target-2560x1440p.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2=
/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367=
">Intel XE#367</a>) +2 other tests skip</li>
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
tree/intel-xe/xe-pw-169125v2/shard-bmg-4/igt@kms_ccs@crc-primary-basic-y-ti=
led-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_ccs=
@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/=
shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html"=
>TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8463">Intel XE#8463</a>)</li>
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
org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_legacy@cursora-=
vs-flipb-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a>)=
</li>
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
/intel-xe/xe-pw-169125v2/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
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
xe/xe-pw-169125v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic=
-transitions-varying-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)<=
/li>
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
01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@kms_cursor_legacy@short=
-flip-after-cursor-atomic-transitions-varying-size.html">INCOMPLETE</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8151">Intel XE=
#8151</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8479">Intel XE#8479</a>)</li>
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
el-xe/xe-pw-169125v2/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-t=
o-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)<=
/li>
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
/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">In=
tel XE#8466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbch=
dr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel =
XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-cur-indfb-draw-render.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">I=
ntel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc=
hdr-2p-primscrn-cur-indfb-draw-render.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>)</li>
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
e/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1=
p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
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
g/tree/intel-xe/xe-pw-169125v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc=
psrhdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169125v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri=
-shrfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +2 othe=
r tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
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
pw-169125v2/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier=
-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-2/igt@kms_plan=
e@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/s=
hard-bmg-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1035">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@kms_plan=
e@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">=
Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@kms_plane@pixel-format-4-ti=
led-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@kms_pm_rpm@dpms-mode=
-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8440">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel X=
E#5848</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169125v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamel=
ium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
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
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-b=
mg-8/igt@xe_ccs@block-multicopy-compressed.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec=
_balancer@many-parallel-userptr-invalidate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shar=
d-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Int=
el XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8480">Intel XE#8480</a>) +74 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel =
XE#8439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execq=
ueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-ra=
ce.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8439">Intel XE#8439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-5/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-rac=
e.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-4/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Inte=
l XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169125v2/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-v=
m-userptr.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-1/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-binde=
xecqueue-userptr-invalidate.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
)</li>
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
-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-m=
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
ee/intel-xe/xe-pw-169125v2/shard-bmg-8/igt@xe_exec_system_allocator@process=
-many-execqueues-malloc-multi-fault.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-remap-ro=
-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-remap-ro-dontunmap-eoch=
eck.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_system_allocator@pr=
ocess-many-large-execqueues-mmap-remap-ro-dontunmap-eocheck.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159"=
>Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>)</li>
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
g/tree/intel-xe/xe-pw-169125v2/shard-bmg-7/igt@xe_exec_threads@threads-mult=
i-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalida=
te-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-8/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate-race.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/837=
8">Intel XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169125v2/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-mi=
xed-shared-vm-userptr-invalidate-race.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e/shard-bmg-10/igt@xe_mult=
igpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169125v2/shard-bmg-8=
/igt@xe_multigpu_svm@mgpu-latency-copy-prefetch.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Int=
el XE#8440</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e -&gt; xe-pw-169=
125v2</li>
</ul>
<p>IGT_8986: 8986<br />
  xe-5301-e6102c1e8d8afa97ddf3c4b73e36545b518e075e: e6102c1e8d8afa97ddf3c4b=
73e36545b518e075e<br />
  xe-pw-169125v2: 169125v2</p>

</body>
</html>

--===============0935841446071654827==--
