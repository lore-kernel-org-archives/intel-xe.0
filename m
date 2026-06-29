Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2776C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 14:01:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55CCD10E900;
	Mon, 29 Jun 2026 14:01:43 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FDB010E91B;
 Mon, 29 Jun 2026 14:01:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0155195502892767312=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/ttm=3A_Account_for_NUL?=
 =?utf-8?q?L_pages_in_ttm=5Fpool=5Fbackup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 14:01:42 -0000
Message-ID: <178274170224.128397.7665762101397060893@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626074653.1326683-1-matthew.brost@intel.com>
In-Reply-To: <20260626074653.1326683-1-matthew.brost@intel.com>
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

--===============0155195502892767312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Account for NULL pages in ttm_pool_backup
URL   : https://patchwork.freedesktop.org/series/169242/
State : failure

== Summary ==

CI Bug Log - changes from xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca_FULL -> xe-pw-169242v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-169242v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-169242v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-169242v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3:
    - shard-bmg:          NOTRUN -> [WARN][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-bmg:          NOTRUN -> [TIMEOUT][2]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-madvise:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +6 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-madvise.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-madvise.html

  * igt@xe_pmu@gt-frequency:
    - shard-bmg:          [PASS][5] -> [WARN][6] +1 other test warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_pmu@gt-frequency.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - shard-bmg:          [SKIP][7] ([Intel XE#8480]) -> [TIMEOUT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch:
    - shard-bmg:          [FAIL][9] ([Intel XE#8479]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch.html

  
New tests
---------

  New tests have been introduced between xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca_FULL and xe-pw-169242v1_FULL:

### New IGT tests (2) ###

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:
    - Statuses : 1 incomplete(s) 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [2.38] s

  

Known issues
------------

  Here are the changes found in xe-pw-169242v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [CRASH][11] ([Intel XE#8453])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][12] ([Intel XE#8479]) +6 other tests incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels@pipe-b-edp-1.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1407])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][14] ([Intel XE#5643] / [Intel XE#8479])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2327]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +4 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1124])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][18] -> [INCOMPLETE][19] ([Intel XE#8479] / [Intel XE#8506])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][20] ([Intel XE#8445])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][21] ([Intel XE#8479] / [Intel XE#8506])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#3432])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#2887])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2325] / [Intel XE#7358])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7642]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2390] / [Intel XE#6974])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1424])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#309] / [Intel XE#7343])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1508])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8265])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#8265]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#4422] / [Intel XE#7442])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-bmg:          [PASS][40] -> [INCOMPLETE][41] ([Intel XE#8155] / [Intel XE#8479]) +1 other test incomplete
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#3321]) +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#301])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race-interruptible:
    - shard-lnl:          [PASS][48] -> [FAIL][49] ([Intel XE#3098]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-1/igt@kms_flip@modeset-vs-vblank-race-interruptible.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-4/igt@kms_flip@modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-bmg:          NOTRUN -> [TIMEOUT][50] ([Intel XE#8467] / [Intel XE#8479]) +1 other test timeout
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [PASS][51] -> [TIMEOUT][52] ([Intel XE#8479]) +1 other test timeout
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7178] / [Intel XE#7351]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7179])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7061] / [Intel XE#7356])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6312] / [Intel XE#651])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4141]) +5 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#7905]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2311]) +30 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#6312]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#7399])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [TIMEOUT][62] ([Intel XE#8479])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [PASS][63] -> [INCOMPLETE][64] ([Intel XE#8368] / [Intel XE#8479])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [PASS][65] -> [TIMEOUT][66] ([Intel XE#8466] / [Intel XE#8479]) +1 other test timeout
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][67] ([Intel XE#8368] / [Intel XE#8479]) +1 other test incomplete
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [TIMEOUT][68] ([Intel XE#8466] / [Intel XE#8479])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#8440] / [Intel XE#8480]) +40 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#7061]) +3 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#7865]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313]) +32 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][76] ([Intel XE#8303]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][77] ([Intel XE#1035] / [Intel XE#8479])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][78] ([Intel XE#1035] / [Intel XE#8479]) +1 other test incomplete
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a:
    - shard-bmg:          [PASS][79] -> [INCOMPLETE][80] ([Intel XE#8459] / [Intel XE#8479]) +7 other tests incomplete
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#1489]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#4608])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#4608] / [Intel XE#7304])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_scaling_modes@scaling-mode-full-aspect:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2413])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full-aspect.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#1435])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#6503])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1499]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@lobf:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#2168] / [Intel XE#7444])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_vrr@lobf.html

  * igt@kms_vrr@lobf-dc3co:
    - shard-bmg:          NOTRUN -> [SKIP][94] ([Intel XE#8397])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html

  * igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-1x1:
    - shard-bmg:          [PASS][95] -> [INCOMPLETE][96] ([Intel XE#8479])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-1x1.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-system-1x1.html

  * igt@xe_configfs@ctx-restore-post-bb-invalid:
    - shard-bmg:          [PASS][97] -> [ABORT][98] ([Intel XE#8007]) +1 other test abort
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_configfs@ctx-restore-post-bb-invalid.html

  * igt@xe_eudebug_online@interrupt-all-set-breakpoint:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#7636]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_eudebug_online@interrupt-all-set-breakpoint.html

  * igt@xe_eudebug_online@set-breakpoint-faultable:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#7636]) +6 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpoint-faultable.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][101] ([Intel XE#6321] / [Intel XE#8355])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][103] ([Intel XE#8437] / [Intel XE#8479])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][104] ([Intel XE#8479])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@twice-virtual-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#7482]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_balancer@twice-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          NOTRUN -> [SKIP][106] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#1392])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [PASS][108] -> [INCOMPLETE][109] ([Intel XE#8499])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0:
    - shard-bmg:          [PASS][110] -> [CRASH][111] ([Intel XE#8482])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-bmg:          NOTRUN -> [ABORT][112] ([Intel XE#8007])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#8374]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_fault_mode@once-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#8364]) +15 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#8364]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-execqueues:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#8369])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-close-execqueues.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset:
    - shard-bmg:          NOTRUN -> [FAIL][117] ([Intel XE#8479]) +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#8479]) +5 other tests fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][120] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-multi-fault:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][121] ([Intel XE#8159] / [Intel XE#8479]) +5 other tests incomplete
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-malloc-multi-fault.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race:
    - shard-bmg:          [PASS][122] -> [INCOMPLETE][123] ([Intel XE#8159] / [Intel XE#8479]) +13 other tests incomplete
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetch-race.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise:
    - shard-bmg:          [PASS][124] -> [CRASH][125] ([Intel XE#8450]) +1 other test crash
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after:
    - shard-bmg:          [PASS][126] -> [INCOMPLETE][127] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) +1 other test incomplete
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][128] ([Intel XE#8437] / [Intel XE#8479]) +3 other tests incomplete
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][129] ([Intel XE#8378]) +5 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-rebind.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#6281] / [Intel XE#7426])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][131] ([Intel XE#8479] / [Intel XE#8486])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#584] / [Intel XE#7369]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_multigpu_svm@mgpu-coherency-fail-basic:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#6964]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherency-fail-basic.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-bmg:          NOTRUN -> [SKIP][134] ([Intel XE#7590])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8440])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2284] / [Intel XE#7370])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][137] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_spin_batch@spin-all:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#8440] / [Intel XE#8480]) +87 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_spin_batch@spin-all.html

  * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:
    - shard-bmg:          [PASS][139] -> [INCOMPLETE][140] ([Intel XE#8477] / [Intel XE#8479])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html

  * igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:
    - shard-bmg:          [PASS][141] -> [TIMEOUT][142] ([Intel XE#8462] / [Intel XE#8479])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][143] ([Intel XE#5545])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:
    - shard-bmg:          [TIMEOUT][144] ([Intel XE#8479]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [TIMEOUT][146] ([Intel XE#8446] / [Intel XE#8479]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][148] ([Intel XE#7935] / [Intel XE#8451] / [Intel XE#8479]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [TIMEOUT][150] ([Intel XE#8451] / [Intel XE#8479]) -> [PASS][151] +1 other test pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [CRASH][152] ([Intel XE#8461]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [TIMEOUT][154] ([Intel XE#8467] / [Intel XE#8479]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][156] ([Intel XE#8368] / [Intel XE#8479]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [TIMEOUT][158] ([Intel XE#8466] / [Intel XE#8479]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][160] ([Intel XE#8441] / [Intel XE#8480]) -> [PASS][161] +5 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:
    - shard-bmg:          [INCOMPLETE][162] ([Intel XE#8459] / [Intel XE#8479]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-bmg:          [INCOMPLETE][164] ([Intel XE#8437] / [Intel XE#8459] / [Intel XE#8479]) -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-bmg:          [SKIP][166] -> [PASS][167]
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_pm_rpm@dpms-non-lpsp.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][168] ([Intel XE#8479]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-4/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html

  * igt@xe_exec_basic@many-basic-defer-mmap:
    - shard-bmg:          [SKIP][170] ([Intel XE#8480]) -> [PASS][171] +60 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_basic@many-basic-defer-mmap.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_basic@many-basic-defer-mmap.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [INCOMPLETE][172] ([Intel XE#8499]) -> [PASS][173]
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@bcs0:
    - shard-bmg:          [CRASH][174] ([Intel XE#8482]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@bcs0.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@bcs0.html

  * igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset:
    - shard-bmg:          [FAIL][176] ([Intel XE#8479]) -> [PASS][177] +10 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [FAIL][178] -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap-eocheck.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          [TIMEOUT][180] ([Intel XE#8356]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro:
    - shard-bmg:          [INCOMPLETE][182] ([Intel XE#8159] / [Intel XE#8479]) -> [PASS][183] +15 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read-after:
    - shard-bmg:          [INCOMPLETE][184] ([Intel XE#8159] / [Intel XE#8437] / [Intel XE#8479]) -> [PASS][185] +3 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read-after.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read-after.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:
    - shard-lnl:          [TIMEOUT][186] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-6/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html
    - shard-bmg:          [TIMEOUT][188] ([Intel XE#8447] / [Intel XE#8479]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:
    - shard-lnl:          [TIMEOUT][190] ([Intel XE#8470] / [Intel XE#8479]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-1/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:
    - shard-bmg:          [INCOMPLETE][192] ([Intel XE#8479] / [Intel XE#8486]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [PASS][208], [PASS][209], [PASS][210], [PASS][211], [PASS][212], [PASS][213], [PASS][214], [PASS][215], [PASS][216], [SKIP][217], [PASS][218], [PASS][219]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][220], [PASS][221], [PASS][222], [PASS][223], [PASS][224], [PASS][225], [PASS][226], [PASS][227], [PASS][228], [PASS][229], [PASS][230], [PASS][231], [PASS][232], [PASS][233], [PASS][234], [PASS][235], [PASS][236], [PASS][237], [PASS][238], [PASS][239], [PASS][240], [PASS][241], [PASS][242], [PASS][243], [PASS][244])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_module_load@load.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_module_load@load.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_module_load@load.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_module_load@load.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_module_load@load.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_module_load@load.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_module_load@load.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_module_load@load.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_module_load@load.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_module_load@load.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_module_load@load.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_module_load@load.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_module_load@load.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_module_load@load.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_module_load@load.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_module_load@load.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_module_load@load.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@xe_module_load@load.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_module_load@load.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_module_load@load.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_module_load@load.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_module_load@load.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_module_load@load.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_module_load@load.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@xe_module_load@load.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_module_load@load.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_module_load@load.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@xe_module_load@load.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_module_load@load.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_module_load@load.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_module_load@load.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_module_load@load.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_module_load@load.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_module_load@load.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_module_load@load.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@xe_module_load@load.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@xe_module_load@load.html

  * igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:
    - shard-bmg:          [INCOMPLETE][245] ([Intel XE#8479]) -> [PASS][246] +7 other tests pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:
    - shard-bmg:          [CRASH][247] -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-bmg:          [ABORT][249] ([Intel XE#8007]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][251] ([Intel XE#2370]) -> [INCOMPLETE][252] ([Intel XE#8174] / [Intel XE#8479])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][253] ([Intel XE#2327]) -> [SKIP][254] ([Intel XE#8440] / [Intel XE#8480])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][255] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][256] ([Intel XE#3658] / [Intel XE#7360])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [TIMEOUT][257] ([Intel XE#8446] / [Intel XE#8479]) -> [INCOMPLETE][258] ([Intel XE#5643] / [Intel XE#8479])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [TIMEOUT][259] ([Intel XE#8446] / [Intel XE#8479]) -> [INCOMPLETE][260] ([Intel XE#5643] / [Intel XE#8479])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-bmg:          [INCOMPLETE][261] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][262] ([Intel XE#8446] / [Intel XE#8479]) +1 other test timeout
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [INCOMPLETE][263] ([Intel XE#5643] / [Intel XE#8479]) -> [TIMEOUT][264] ([Intel XE#8446]) +1 other test timeout
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][265] ([Intel XE#1124]) -> [SKIP][266] ([Intel XE#8440] / [Intel XE#8480])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][267] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][268] ([Intel XE#1124])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [INCOMPLETE][269] ([Intel XE#5643] / [Intel XE#8479]) -> [SKIP][270] ([Intel XE#1124])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-8/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][271] ([Intel XE#8480]) -> [INCOMPLETE][272] ([Intel XE#8479] / [Intel XE#8506])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][273] ([Intel XE#7679]) -> [INCOMPLETE][274] ([Intel XE#8479] / [Intel XE#8506])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [INCOMPLETE][275] ([Intel XE#8479]) -> [SKIP][276] ([Intel XE#7679]) +2 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [INCOMPLETE][277] ([Intel XE#8479]) -> [SKIP][278] ([Intel XE#8440] / [Intel XE#8480])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [INCOMPLETE][279] ([Intel XE#8479]) -> [SKIP][280] ([Intel XE#367]) +3 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-bmg:          [INCOMPLETE][281] ([Intel XE#8479]) -> [INCOMPLETE][282] ([Intel XE#8479] / [Intel XE#8506]) +1 other test incomplete
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][283] ([Intel XE#367]) -> [INCOMPLETE][284] ([Intel XE#8479] / [Intel XE#8506]) +2 other tests incomplete
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][285] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][286] ([Intel XE#2652])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [INCOMPLETE][287] ([Intel XE#8150] / [Intel XE#8479]) -> [SKIP][288] ([Intel XE#2887])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          [SKIP][289] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][290] ([Intel XE#2887])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:
    - shard-bmg:          [SKIP][291] ([Intel XE#2887]) -> [TIMEOUT][292] ([Intel XE#8463])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][293] ([Intel XE#2887]) -> [SKIP][294] ([Intel XE#8440] / [Intel XE#8480])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][295] ([Intel XE#8441] / [Intel XE#8480]) -> [INCOMPLETE][296] ([Intel XE#8150] / [Intel XE#8479])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-bmg:          [SKIP][297] ([Intel XE#8480]) -> [SKIP][298] ([Intel XE#2252])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_chamelium_hpd@hdmi-hpd-fast.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][299] ([Intel XE#2320]) -> [SKIP][300] ([Intel XE#8440] / [Intel XE#8480])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][301] ([Intel XE#8480]) -> [INCOMPLETE][302] ([Intel XE#8151] / [Intel XE#8479])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][303] ([Intel XE#2286] / [Intel XE#6035]) -> [SKIP][304] ([Intel XE#8440] / [Intel XE#8480])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][305] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][306] ([Intel XE#8440] / [Intel XE#8480])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-bmg:          [INCOMPLETE][307] ([Intel XE#8479]) -> [INCOMPLETE][308] ([Intel XE#8479] / [Intel XE#8504])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][309] ([Intel XE#8480]) -> [SKIP][310] ([Intel XE#8440] / [Intel XE#8480]) +223 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][311] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][312] ([Intel XE#2311]) +5 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][313] ([Intel XE#2311]) -> [SKIP][314] ([Intel XE#8440] / [Intel XE#8480]) +4 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][315] ([Intel XE#7061]) -> [SKIP][316] ([Intel XE#8440] / [Intel XE#8480])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][317] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][318] ([Intel XE#4141])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [SKIP][319] ([Intel XE#4141]) -> [SKIP][320] ([Intel XE#8440] / [Intel XE#8480])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][321] ([Intel XE#8368] / [Intel XE#8479]) -> [TIMEOUT][322] ([Intel XE#8466] / [Intel XE#8479])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [TIMEOUT][323] ([Intel XE#8479]) -> [INCOMPLETE][324] ([Intel XE#8368] / [Intel XE#8479])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][325] ([Intel XE#2313]) -> [SKIP][326] ([Intel XE#8440] / [Intel XE#8480]) +2 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][327] ([Intel XE#2313]) -> [INCOMPLETE][328] ([Intel XE#8368] / [Intel XE#8479]) +1 other test incomplete
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][329] ([Intel XE#2313]) -> [CRASH][330] ([Intel XE#8505])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:
    - shard-bmg:          [SKIP][331] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][332] ([Intel XE#7061])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][333] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][334] ([Intel XE#2313]) +7 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-bmg:          [TIMEOUT][335] ([Intel XE#8465]) -> [INCOMPLETE][336] ([Intel XE#1035] / [Intel XE#8479])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping:
    - shard-bmg:          [INCOMPLETE][337] ([Intel XE#1035] / [Intel XE#8479]) -> [SKIP][338] ([Intel XE#7283])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:
    - shard-bmg:          [SKIP][339] ([Intel XE#8480]) -> [SKIP][340] ([Intel XE#7283])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-bmg:          [INCOMPLETE][341] ([Intel XE#8437] / [Intel XE#8459] / [Intel XE#8479]) -> [SKIP][342] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][343] -> [SKIP][344] ([Intel XE#8440])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-bmg:          [SKIP][345] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][346] ([Intel XE#8440] / [Intel XE#8480]) +2 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_psr@fbc-pr-basic.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          [SKIP][347] ([Intel XE#8441] / [Intel XE#8480]) -> [SKIP][348] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_psr@psr-primary-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_psr@psr-primary-blt.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][349] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][350] ([Intel XE#8440] / [Intel XE#8480])
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][351] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][352] ([Intel XE#1729] / [Intel XE#7424])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_eudebug_online@debugger-reopen:
    - shard-bmg:          [SKIP][353] ([Intel XE#8480]) -> [SKIP][354] ([Intel XE#7636])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_eudebug_online@debugger-reopen.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_eudebug_online@debugger-reopen.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          [SKIP][355] ([Intel XE#7636]) -> [SKIP][356] ([Intel XE#8440] / [Intel XE#8480])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_eudebug_online@pagefault-write-stress.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_evict@evict-small-multi-queue:
    - shard-bmg:          [SKIP][357] ([Intel XE#8370]) -> [SKIP][358] ([Intel XE#8440] / [Intel XE#8480])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_evict@evict-small-multi-queue.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_evict@evict-small-multi-queue.html

  * igt@xe_exec_atomic@basic-inc-all:
    - shard-bmg:          [SKIP][359] ([Intel XE#8480]) -> [INCOMPLETE][360] ([Intel XE#8437] / [Intel XE#8479])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_atomic@basic-inc-all.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [INCOMPLETE][361] ([Intel XE#8439] / [Intel XE#8479]) -> [INCOMPLETE][362] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) +2 other tests incomplete
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [INCOMPLETE][363] ([Intel XE#8439] / [Intel XE#8479]) -> [SKIP][364] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-bmg:          [SKIP][365] ([Intel XE#8480]) -> [SKIP][366] ([Intel XE#2322] / [Intel XE#7372])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][367] ([Intel XE#2322] / [Intel XE#7372]) -> [INCOMPLETE][368] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [INCOMPLETE][369] ([Intel XE#8479]) -> [SKIP][370] ([Intel XE#8374])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-imm:
    - shard-bmg:          [SKIP][371] ([Intel XE#8374]) -> [SKIP][372] ([Intel XE#8440] / [Intel XE#8480])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-imm.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:
    - shard-bmg:          [SKIP][373] ([Intel XE#8480]) -> [SKIP][374] ([Intel XE#8374]) +1 other test skip
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          [SKIP][375] ([Intel XE#8480]) -> [SKIP][376] ([Intel XE#8364]) +1 other test skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_exec_store@long-shader-bb-check:
    - shard-bmg:          [INCOMPLETE][377] ([Intel XE#8437] / [Intel XE#8479]) -> [SKIP][378] ([Intel XE#8440] / [Intel XE#8480]) +1 other test skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_store@long-shader-bb-check.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_exec_store@long-shader-bb-check.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise:
    - shard-bmg:          [SKIP][379] ([Intel XE#8480]) -> [FAIL][380] ([Intel XE#8479])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [INCOMPLETE][381] ([Intel XE#8159] / [Intel XE#8479]) -> [SKIP][382] ([Intel XE#8440] / [Intel XE#8480]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset:
    - shard-bmg:          [INCOMPLETE][383] ([Intel XE#8159] / [Intel XE#8479]) -> [FAIL][384] ([Intel XE#8479])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck:
    - shard-bmg:          [INCOMPLETE][385] ([Intel XE#8159] / [Intel XE#8479]) -> [TIMEOUT][386] ([Intel XE#8356])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-dontunmap-eocheck:
    - shard-bmg:          [SKIP][387] ([Intel XE#8480]) -> [TIMEOUT][388] ([Intel XE#8447] / [Intel XE#8479])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-dontunmap-eocheck.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-dontunmap-eocheck.html

  * igt@xe_exec_threads@threads-multi-queue-cm-rebind:
    - shard-bmg:          [SKIP][389] ([Intel XE#8378]) -> [SKIP][390] ([Intel XE#8440] / [Intel XE#8480])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          [SKIP][391] ([Intel XE#8480]) -> [SKIP][392] ([Intel XE#8378]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][393] ([Intel XE#8378]) -> [INCOMPLETE][394] ([Intel XE#8366] / [Intel XE#8479])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][395] ([Intel XE#8378]) -> [CRASH][396] ([Intel XE#8454])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [CRASH][397] ([Intel XE#8448]) -> [INCOMPLETE][398] ([Intel XE#8479] / [Intel XE#8486])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          [SKIP][399] ([Intel XE#6964]) -> [SKIP][400] ([Intel XE#6964] / [Intel XE#8440])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][401] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][402] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8440])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_peer2peer@read.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_peer2peer@read.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          [SKIP][403] ([Intel XE#8480]) -> [SKIP][404] ([Intel XE#4733] / [Intel XE#7417])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0:
    - shard-bmg:          [ABORT][405] -> [ABORT][406] ([Intel XE#8007]) +1 other test abort
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0.html

  
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5643]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7444]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7444
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
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
  [Intel XE#8397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440
  [Intel XE#8441]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441
  [Intel XE#8445]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8445
  [Intel XE#8446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446
  [Intel XE#8447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447
  [Intel XE#8448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448
  [Intel XE#8450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8450
  [Intel XE#8451]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451
  [Intel XE#8453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8453
  [Intel XE#8454]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8454
  [Intel XE#8459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459
  [Intel XE#8461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8461
  [Intel XE#8462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8462
  [Intel XE#8463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8463
  [Intel XE#8465]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465
  [Intel XE#8466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466
  [Intel XE#8467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8467
  [Intel XE#8470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470
  [Intel XE#8477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486
  [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499
  [Intel XE#8504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8504
  [Intel XE#8505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8505
  [Intel XE#8506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8506
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870


Build changes
-------------

  * Linux: xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca -> xe-pw-169242v1

  IGT_8987: 8987
  xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca: 5fe805765b01f6e3519421039c3ade7cff1074ca
  xe-pw-169242v1: 169242v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/index.html

--===============0155195502892767312==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Account for NULL pages in ttm_pool_=
backup</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/169242/">https://patchwork.freedesktop.org/series/169242/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169242v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169242v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5303-5fe805765b01f6e3519421039c3ade7cf=
f1074ca_FULL -&gt; xe-pw-169242v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-169242v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-169242v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1692=
42v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping@pipe-a-plane=
-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@kms_plane@pixel-format-4-tile=
d-modifier-source-clamping@pipe-a-plane-3.html">WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_plane_scaling@planes-unit=
y-scaling-downscale-factor-0-5@pipe-a.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-mad=
vise:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-free-madvise.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16924=
2v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-large-execqueues-=
mmap-free-madvise.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_pmu@g=
t-frequency.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_pmu@gt-frequency.html">WARN</a=
> +1 other test warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_pla=
ne_scaling@planes-unity-scaling-downscale-factor-0-5.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#848=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
242v1/shard-bmg-3/igt@kms_plane_scaling@planes-unity-scaling-downscale-fact=
or-0-5.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-prefetch=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_exec_=
system_allocator@process-many-large-execqueues-mmap-prefetch.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Inte=
l XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169242v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-e=
xecqueues-mmap-prefetch.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5303-5fe805765b01f6e3519421039=
c3ade7cff1074ca_FULL and xe-pw-169242v1_FULL:</p>
<h3>New IGT tests (2)</h3>
<ul>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats:</p>
<ul>
<li>Statuses : 1 incomplete(s) 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [2.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169242v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels@pipe-a-edp-1.html">CRASH</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8453">Intel=
 XE#8453</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing-internal-panels@pipe-b-edp-1.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">=
Intel XE#8479</a>) +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_big_fb@4-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_big_fb@linear-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-64bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_bw@=
connected-linear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bm=
g-3/igt@kms_bw@connected-linear-tiling-1-displays-target-1920x1080p.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8479">Intel XE#8479</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8506">Intel XE#8506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_bw@linear-tiling-2-displa=
ys-target-1920x1080p.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8445">Intel XE#8445</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_bw@linear-tiling-3-displa=
ys-target-3840x2160p.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_ccs@random-ccs-data-4-til=
ed-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_ccs@random-ccs-data-y-til=
ed-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_chamelium_color@gamma.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_chamelium_color_pipeline=
@plane-ctm3x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_chamelium_edid@hdmi-mode-=
timings.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_chamelium_frames@hdmi-as=
pect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_content_protection@dp-mst=
-lic-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_content_protection@legac=
y-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_cursor_crc@cursor-offscre=
en-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding=
-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_dirtyfb@psr-dirtyfb-ioctl=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_dsc@dsc-fractional-bpp-bi=
gjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_dsc@dsc-with-output-forma=
ts-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty=
-rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_flip=
@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/s=
hard-bmg-3/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interr=
uptible.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8155">Intel XE#8155</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_flip=
@flip-vs-expired-vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_flip@flip-vs-expi=
red-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-7/igt@kms_flip@flip-=
vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-1/igt@kms_flip=
@modeset-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-lnl-4/igt@kms_fli=
p@modeset-vs-vblank-race-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 othe=
r test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32b=
pp-xtile-to-64bpp-xtile-downscaling.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8467">Intel XE#8467</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#847=
9</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling@pipe-a-valid-mode.h=
tml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169242v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-=
4tile-downscaling@pipe-a-valid-mode.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 othe=
r test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bp=
p-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-nv12=
-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-=
1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +5 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
drrshdr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
drrshdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbch=
dr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sha=
rd-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-shrfb-draw-ren=
der.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8368">Intel XE#8368</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sh=
ard-bmg-10/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-spr-indfb-draw-m=
map-wc.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8466">Intel XE#8466</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other test timeout<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-cur-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc=
hdr-2p-scndscrn-cur-indfb-draw-render.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbch=
dr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">TIMEOUT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-b=
mg-8/igt@kms_frontbuffer_tracking@hdr-1p-primscrn-spr-indfb-fullscreen.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8480">Intel XE#8480</a>) +40 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@hdr-=
abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@hdr-=
rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +32 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr=
-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-b-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tile=
d-bmg-ccs-modifier@pipe-b-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_plane@pixel-format-4-tile=
d-dg2-rc-ccs-modifier.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier-source-clamping.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@=
pipe-a:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_plan=
e_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
242v1/shard-bmg-2/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping=
-pixel-formats@pipe-a.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8459">Intel XE#8459</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +7 o=
ther tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-b:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-5@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_pm_backlight@basic-bright=
ness.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-update-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_psr@fbc-psr-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_rotation_crc@bad-pixel-f=
ormat.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full-aspect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mod=
e-full-aspect.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_setmode@invalid-clone-ex=
clusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_sharpness_filter@filter-t=
ap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_vrr@flip-basic-fastset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7444">Intel XE#7444</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf-dc3co:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_vrr@lobf-dc3co.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8397">=
Intel XE#8397</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-uncompressed-inc-dimension@linear-uncompressed-com=
pfmt0-system-system-1x1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_ccs@b=
lock-copy-uncompressed-inc-dimension@linear-uncompressed-compfmt0-system-sy=
stem-1x1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_ccs@block-copy-uncompressed-inc-d=
imension@linear-uncompressed-compfmt0-system-system-1x1.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Int=
el XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@xe_confi=
gfs@ctx-restore-post-bb-invalid.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_configfs@c=
tx-restore-post-bb-invalid.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 other test abor=
t</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-all-set-breakpoint:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_eudebug_online@interrupt-a=
ll-set-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint-faultable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_eudebug_online@set-breakpo=
int-faultable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/7636">Intel XE#7636</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_evict@evict-mixed-many-th=
reads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-samefd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-samefd.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_copy-instanc=
e-0-tile-0-vram0-memory:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_atomic@basic-inc-all@=
engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
37">Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate-race:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_balancer@many-execqu=
eues-cm-virtual-userptr-invalidate-race.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_balancer@twice-virtua=
l-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) =
+5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_basic@multigpu-once-b=
asic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_=
basic@no-exec-bindexecqueue-userptr-invalidate-race.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg=
-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8499">Intel XE#8499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_=
basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs0.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shar=
d-bmg-2/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate-race@bcs=
0.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8482">Intel XE#8482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_fault_mode@invalid-va=
-scratch-nopagefault.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_fault_mode@once-mult=
i-queue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_multi_queue@few-exec=
s-preempt-mode-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +15 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-dyn-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-execqueues:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_reset@cm-multi-queue-=
close-execqueues.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-shared-n=
omemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-mmap-shared-nomemset.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eocheck:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_exec_=
system_allocator@process-many-stride-mmap-remap-ro-eocheck.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sh=
ard-bmg-6/igt@xe_exec_system_allocator@process-many-stride-mmap-remap-ro-eo=
check.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8479">Intel XE#8479</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-file=
-mlock:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-execqueues-mmap-file-mlock.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#815=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437=
">Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mal=
loc-multi-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-execqueues-malloc-multi-fault.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Int=
el XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-prefetc=
h-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-malloc-prefetch-race.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
242v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large=
-malloc-prefetch-race.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +13 =
other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-mmap-new-madvi=
se:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-mmap-new-madvise.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242=
v1/shard-bmg-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-mm=
ap-new-madvise.html">CRASH</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8450">Intel XE#8450</a>) +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-malloc-fork-r=
ead-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-stride-malloc-fork-read-after.html"=
>PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169242v1/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-st=
ride-malloc-fork-read-after.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Int=
el XE#8479</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-file-nom=
emset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-file-nomemset.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_exec_threads@threads-multi=
-queue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8378">Intel XE#8378</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_fault_injection@exec-queue=
-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a=
>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_fault_injection@inject-fau=
lt-probe-function-guc_wait_ucode.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8486">Intel XE#848=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_gt_freq@freq_suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7369">Intel XE#7369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-fail-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-coherenc=
y-fail-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_pat@xa-app-transient-media=
-on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">=
Intel XE#6953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7326">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7353">Intel XE#7353</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_pxp@pxp-stale-bo-exec-post=
-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4733">Intel XE#4733</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_spin_batch@spin-all.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
40">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8480">Intel XE#8480</a>) +87 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_sriov=
_admin@exec-quantum-write-readback-vfs-disabled.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/i=
gt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8477">=
Intel XE#8477</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_vm@mm=
ap-style-bind-either-side-partial-split-page-hammer.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg=
-9/igt@xe_vm@mmap-style-bind-either-side-partial-split-page-hammer.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
462">Intel XE#8462</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-tiled-atomic.html">TIMEOUT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE=
#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169242v1/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events-=
tiled-atomic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel=
 XE#8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@kms_big_fb@x-tiled-max-hw-stride=
-32bpp-rotate-0-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_cur=
sor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">TIMEOUT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">In=
tel XE#7935</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8451">Intel XE#8451</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_cursor_lega=
cy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8451">Int=
el XE#8451</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-f=
lipa-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_flip=
@single-buffer-flip-vs-dpms-off-vs-modeset.html">CRASH</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8461">Intel XE#8461</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sha=
rd-bmg-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a=
-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.htm=
l">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8467">Intel XE#8467</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_flip_scaled_c=
rc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">INCOMPLET=
E</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368"=
>Intel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@kms_frontbuffer_tracking@f=
bchdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">TIMEOUT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Int=
el XE#8466</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbchd=
r-1p-primscrn-cur-indfb-draw-mmap-wc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#=
8441</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
480">Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-1p-p=
rimscrn-pri-indfb-draw-blt.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-rotation@pipe-a.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8459">I=
ntel XE#8459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@kms_plane_scaling@plane-down=
scale-factor-0-5-with-rotation@pipe-a.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_plan=
e_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">=
Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8459">Intel XE#8459</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@kms_plane_sca=
ling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> +1 oth=
er test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_pm_=
rpm@dpms-non-lpsp.html">SKIP</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_pm_rpm@dpms-non-lpsp.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-=
1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-2/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-sf@pipe-a-edp-1.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/847=
9">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-169242v1/shard-lnl-4/igt@kms_psr2_sf@psr2-overlay-plane-move-co=
ntinuous-exceed-sf@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_basic@many-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe=
_exec_basic@many-basic-defer-mmap.html">PASS</a> +60 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_exec_=
basic@many-execqueues-many-vm-userptr-invalidate.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8=
499</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69242v1/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-inval=
idate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-userptr-invalidate@bcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_exec_=
basic@many-execqueues-many-vm-userptr-invalidate@bcs0.html">CRASH</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8=
482</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
69242v1/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-userptr-inval=
idate@bcs0.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-malloc-bo-unmap-nom=
emset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_=
system_allocator@process-many-execqueues-malloc-bo-unmap-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_exec_system_allocator@process-many-ex=
ecqueues-malloc-bo-unmap-nomemset.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-dontunma=
p-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-remap-dontunmap-eocheck.html"=
>FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169242v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-execqueues-m=
map-remap-dontunmap-eocheck.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-free-huge-nom=
emset.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8356">Intel XE#8356</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@xe_exec_system_allocat=
or@threads-shared-vm-many-large-execqueues-mmap-free-huge-nomemset.html">PA=
SS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-ro:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_=
allocator@threads-shared-vm-many-large-execqueues-mmap-remap-ro.html">PASS<=
/a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-re=
ad-after:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-malloc-fork-read-after.html"=
>INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe=
_exec_system_allocator@threads-shared-vm-many-large-malloc-fork-read-after.=
html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-free-madvise:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-6/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-free-madvise.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Inte=
l XE#8447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169242v1/shard-lnl-2/igt@xe_exec_system_allocator@thread=
s-shared-vm-many-mmap-free-madvise.html">PASS</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-mmap-free-madvise.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8447">Inte=
l XE#8447</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-mmap-free-madvise.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-1/igt@xe_exec_=
threads@threads-bal-mixed-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8470">Intel XE#=
8470</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169242v1/shard-lnl-3/igt@xe_exec_threads@threads-bal-mixed-fd=
-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_pcode_probe_early:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_pcode_probe_early.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479=
">Intel XE#8479</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8486">Intel XE#8486</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_fault_injection@inject=
-fault-probe-function-xe_pcode_probe_early.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/sha=
rd-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074c=
a/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff=
1074ca/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade=
7cff1074ca/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c=
3ade7cff1074ca/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e351942=
1039c3ade7cff1074ca/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e35=
19421039c3ade7cff1074ca/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f=
6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765=
b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe80=
5765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5303-5=
fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-53=
03-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_module_load@=
load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-b=
mg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/sha=
rd-bmg-2/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca=
/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5303-5fe805765b01f6e3519421039c3ade7cff10=
74ca/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#=
7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169242v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard=
-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-6/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169242v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169242v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-7/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169242v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard=
-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-169242v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_m=
odule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard=
-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169242v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sh=
ard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@xe_module_load@l=
oad.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-many-either-side-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_vm@mu=
nmap-style-unbind-userptr-many-either-side-full.html">INCOMPLETE</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#84=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9242v1/shard-bmg-3/igt@xe_vm@munmap-style-unbind-userptr-many-either-side-f=
ull.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-external-nodefer:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_vm@ov=
ercommit-nonfault-vram-lr-external-nodefer.html">CRASH</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-9/igt@x=
e_vm@overcommit-nonfault-vram-lr-external-nodefer.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@xe_wedge=
d@wedged-mode-toggle.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_wedged=
@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_atom=
ic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel =
XE#2370</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169242v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transit=
ion-internal-panels.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8174">Intel XE#8174</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_big_=
fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_b=
ig_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-7/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">=
Intel XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169242v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7360">Intel XE#73=
60</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">TIMEOUT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479"=
>Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169242v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-r=
otate-180-hflip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">TIMEOUT</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#=
8446</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32b=
pp-rotate-180-async-flip.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5643</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel XE#5=
643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
79">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bp=
p-rotate-180-hflip.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8446">Intel XE#8446</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other t=
est timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-8/igt@kms_big_=
fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">INCOMPLETE</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">In=
tel XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-169242v1/shard-lnl-7/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">TIMEOUT</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8446">Intel XE#8446</a>) +1 othe=
r test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_big_=
fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
242v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_big=
_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard=
-bmg-3/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-lnl-8/igt@kms_big_=
fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">INCOMPLETE</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5643">Intel=
 XE#5643</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-169242v1/shard-lnl-3/igt@kms_big_fb@yf-tiled-max-hw-strid=
e-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_bw@=
connected-linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#848=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
242v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-target-3840=
x2160p.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8479">Intel XE#8479</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
42v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x=
1440p.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8479">Intel XE#8479</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8506">Intel XE#8506</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169242v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-4-displays-target=
-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7679">Intel XE#7679</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-3840x2160p.html">INCOMPLETE</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel X=
E#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169242v1/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target=
-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_bw@l=
inear-tiling-2-displays-target-3840x2160p.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1=
/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"=
>Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_bw@l=
inear-tiling-3-displays-target-2160x1440p.html">INCOMPLETE</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1=
/shard-bmg-4/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8479">Intel XE#8479</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8506">Intel XE#8506</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_bw@l=
inear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-b=
mg-3/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">=
Intel XE#8479</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8506">Intel XE#8506</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_ccs=
@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/=
shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#=
2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-mtl-mc-ccs.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">In=
tel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169242v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl=
-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_ccs=
@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
42v1/shard-bmg-3/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">=
Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-7/igt@kms_ccs@=
crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sh=
ard-bmg-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs.html">TI=
MEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
463">Intel XE#8463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_ccs@=
missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-b=
mg-8/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE=
#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_ccs=
@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel X=
E#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169242v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-=
cc.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8150">Intel XE#8150</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_cha=
melium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_ch=
amelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8=
480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_cur=
sor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel=
 XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169242v1/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-tran=
sitions-varying-size.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8151">Intel XE#8151</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_curs=
or_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2286">Intel XE#2286</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6035">Intel XE#6035</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_cursor_legacy@sh=
ort-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel=
 XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel X=
E#7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-2/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">INCOMPLETE</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Int=
el XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169242v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bp=
p-4tile-downscaling.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8504">Intel XE#8504</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#=
8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
169242v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +223 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@drrs-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480"=
>Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscr=
n-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@drrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-p=
ri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v=
1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480"=
>Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn=
-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@k=
ms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8368">=
Intel XE#8368</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-169242v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fb=
chdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">TIMEOUT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8466">Intel XE#8466</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE=
#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbchdr-2p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Inte=
l XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169242v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-p=
ri-shrfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel =
XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169242v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8368">Intel XE#8368</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) +1 other=
 test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Inte=
l XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169242v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscr=
n-pri-shrfb-draw-render.html">CRASH</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8505">Intel XE#8505</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@fbcpsrhdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">In=
tel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb1616=
16f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_fro=
ntbuffer_tracking@psrhdr-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8441">Intel XE#8441</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Int=
el XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-169242v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-1p-pri-indfb=
-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_pla=
ne@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">TIMEOUT</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8465">Intel=
 XE#8465</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169242v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifie=
r-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clampin=
g:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_plan=
e@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">INCOMPL=
ETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/103=
5">Intel XE#1035</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@kms_plane@pixel-format-=
4-tiled-mtl-rc-ccs-cc-modifier-source-clamping.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_pla=
ne@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/sha=
rd-bmg-3/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">I=
ntel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@kms_plan=
e_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">INCOMPLETE=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">=
Intel XE#8437</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8459">Intel XE#8459</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@kms_plane_sca=
ling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#27=
63</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688=
6">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@kms_pm_r=
pm@modeset-stress-extra-wait.html">SKIP</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/igt@kms_pm_rpm@modes=
et-stress-extra-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8440">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_psr@=
fbc-pr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@kms_=
psr@fbc-pr-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@kms_psr=
@psr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8441">Intel XE#8441</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/ig=
t@kms_psr@psr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 oth=
er test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#734=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169=
242v1/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
40">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shar=
d-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424"=
>Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@debugger-reopen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_eude=
bug_online@debugger-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_e=
udebug_online@debugger-reopen.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_eudeb=
ug_online@pagefault-write-stress.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/ig=
t@xe_eudebug_online@pagefault-write-stress.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE=
#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_evict=
@evict-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_evi=
ct@evict-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_atomic@basic-inc-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_a=
tomic@basic-inc-all.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Inte=
l XE#8439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-ex=
ecqueues-many-vm-null-defer-bind.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#847=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499=
">Intel XE#8499</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-5/igt@xe_exec_=
basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439=
">Intel XE#8439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-2/igt@xe_exec_basic@multigpu-no=
-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel X=
E#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-b=
mg-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#=
2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_exec_=
basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel X=
E#2322</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7372">Intel XE#7372</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-169242v1/shard-bmg-10/igt@xe_exec_basic@multigpu-once-binde=
xecqueue-userptr-invalidate-race.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#847=
9</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499=
">Intel XE#8499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-im=
m:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">INCOMP=
LETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/84=
79">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-mu=
lti-queue-userptr-invalidate-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/ig=
t@xe_exec_fault_mode@twice-multi-queue-imm.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE=
#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_fault_mode@twice-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
42v1/shard-bmg-3/igt@xe_exec_fault_mode@twice-multi-queue-invalid-userptr-f=
ault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Inte=
l XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-169242v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-f=
ault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@long-shader-bb-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
store@long-shader-bb-check.html">INCOMPLETE</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/=
shard-bmg-8/igt@xe_exec_store@long-shader-bb-check.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#8440=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480"=
>Intel XE#8480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-new-madvise:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_system_allocator@process-many-execqueues-mmap-new-madvise.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel =
XE#8480</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-169242v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-execqueue=
s-mmap-new-madvise.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-dontu=
nmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
system_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-8/igt@xe_exec_syste=
m_allocator@process-many-execqueues-mmap-remap-ro-dontunmap-eocheck.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/844=
0">Intel XE#8440</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8480">Intel XE#8480</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-huge-nom=
emset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_system_allocator@process-many-large-execqueues-mmap-huge-nomemset.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allo=
cator@process-many-large-execqueues-mmap-huge-nomemset.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8=
479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-mmap-shared-remap-dontun=
map-eocheck.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8159">Intel XE#8159</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/ig=
t@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-re=
map-dontunmap-eocheck.html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8356">Intel XE#8356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-remap-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_system_allocator@threads-shared-vm-many-large-execqueues-mmap-remap-dontun=
map-eocheck.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_exec_system_allo=
cator@threads-shared-vm-many-large-execqueues-mmap-remap-dontunmap-eocheck.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8447">Intel XE#8447</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_exec_=
threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg=
-8/igt@xe_exec_threads@threads-multi-queue-cm-rebind.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#844=
0</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480=
">Intel XE#8480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_exec=
_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8480">Intel XE#8480=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1692=
42v1/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userp=
tr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-invalidate:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-1/igt@xe_exec_=
threads@threads-multi-queue-cm-shared-vm-userptr-invalidate.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel=
 XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-169242v1/shard-bmg-9/igt@xe_exec_threads@threads-multi-queue-cm-shared-=
vm-userptr-invalidate.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8366">Intel XE#8366</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalida=
te:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-8/igt@xe_exec_=
threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">In=
tel XE#8378</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169242v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-s=
hared-vm-userptr-invalidate.html">CRASH</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8454">Intel XE#8454</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wopcm_init.html">CRASH</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8448">Intel XE#84=
48</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
9242v1/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wo=
pcm_init.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8479">Intel XE#8479</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8486">Intel XE#8486</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_multi=
gpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-5/ig=
t@xe_multigpu_svm@mgpu-pagefault-prefetch.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440">Intel XE#=
8440</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-4/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg=
-5/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#735=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8440=
">Intel XE#8440</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-10/igt@xe_pxp@=
pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8480">Intel XE#8480</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169242v1/shard-bmg-3/igt@xe_p=
xp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-=
random-gt0-rcs0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca/shard-bmg-9/igt@xe_sriov=
_scheduling@nonpreempt-engine-resets-normal-priority@numvfs-random-gt0-rcs0=
.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-169242v1/shard-bmg-10/igt@xe_sriov_scheduling@nonpreempt-engine-rese=
ts-normal-priority@numvfs-random-gt0-rcs0.html">ABORT</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +1 =
other test abort</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca -&gt; xe-pw-169=
242v1</li>
</ul>
<p>IGT_8987: 8987<br />
  xe-5303-5fe805765b01f6e3519421039c3ade7cff1074ca: 5fe805765b01f6e35194210=
39c3ade7cff1074ca<br />
  xe-pw-169242v1: 169242v1</p>

</body>
</html>

--===============0155195502892767312==--
