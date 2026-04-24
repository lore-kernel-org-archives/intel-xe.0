Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95AAFB44C6
	for <intel-xe@archiver.kernel.org>; Fri, 24 Apr 2026 08:02:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7819710F3B6;
	Fri, 24 Apr 2026 08:02:19 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD66F10F3B8;
 Fri, 24 Apr 2026 08:02:18 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7876344200180435809=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5Bv2?=
 =?utf-8?q?=2C1/4=5D_drm/i915/display=3A_Don=E2=80=99t_use_atomic_state_back?=
 =?utf-8?q?-pointer_to_derive_color_pipeline?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chaitanya Kumar Borah" <chaitanya.kumar.borah@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Apr 2026 08:02:18 -0000
Message-ID: <177701773883.6496.12155189147263632000@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260424054129.2148049-1-chaitanya.kumar.borah@intel.com>
In-Reply-To: <20260424054129.2148049-1-chaitanya.kumar.borah@intel.com>
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

--===============7876344200180435809==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

== Series Details ==

Series: series starting with [v2,1/4] drm/i915/display: Don’t use atomic state back-pointer to derive color pipeline
URL   : https://patchwork.freedesktop.org/series/165398/
State : failure

== Summary ==

CI Bug Log - changes from xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4_FULL -> xe-pw-165398v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-165398v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-165398v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-165398v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][3] -> [FAIL][4] +5 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - shard-bmg:          [PASS][5] -> [SKIP][6] +535 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html

  * igt@xe_sriov_scheduling@equal-throughput@numvfs-random:
    - shard-bmg:          [PASS][7] -> [DMESG-FAIL][8] +1 other test dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][9] ([Intel XE#2327]) -> [SKIP][10] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][11] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][13] ([Intel XE#1124]) -> [SKIP][14] +14 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][15] ([Intel XE#2652]) -> [SKIP][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][17] ([Intel XE#3432]) -> [SKIP][18] +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][19] ([Intel XE#2887]) -> [SKIP][20] +18 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][21] ([Intel XE#2724] / [Intel XE#7449]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_cdclk@plane-scaling.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [FAIL][23] ([Intel XE#3304] / [Intel XE#7374]) -> [SKIP][24]
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          [FAIL][25] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) -> [SKIP][26] +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_content_protection@atomic-hdcp14.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][27] ([Intel XE#7642]) -> [SKIP][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_content_protection@content-type-change.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][29] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-offscreen-max-size:
    - shard-bmg:          [SKIP][31] ([Intel XE#2320]) -> [SKIP][32] +4 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-max-size.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-bmg:          [SKIP][33] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][34] +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][35] ([Intel XE#1508]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][37] ([Intel XE#2244]) -> [SKIP][38] +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][39] ([Intel XE#4422] / [Intel XE#7442]) -> [SKIP][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][41] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][43] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-bmg:          [SKIP][45] ([Intel XE#2486]) -> [SKIP][46]
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][47] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][49] ([Intel XE#5021] / [Intel XE#7377]) -> [SKIP][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][51] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][52]
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-bmg:          [SKIP][53] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][54]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-270.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][55] ([Intel XE#2413]) -> [SKIP][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          [SKIP][57] ([Intel XE#6503]) -> [SKIP][58] +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][59] ([Intel XE#1499]) -> [SKIP][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_vrr@max-min.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][61] ([Intel XE#6321]) -> [SKIP][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-priority:
    - shard-bmg:          [SKIP][63] ([Intel XE#7140]) -> [SKIP][64] +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][65] ([Intel XE#7136]) -> [SKIP][66] +16 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          [INCOMPLETE][67] ([Intel XE#7098]) -> [SKIP][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p}:
    - shard-bmg:          [SKIP][69] ([Intel XE#7679]) -> [SKIP][70] +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * {igt@kms_bw@linear-tiling-4-displays-target-2560x1440p}:
    - shard-bmg:          [SKIP][71] ([Intel XE#367]) -> [SKIP][72] +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  
Known issues
------------

  Here are the changes found in xe-pw-165398v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_color@degamma:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#3297]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_color@degamma.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_color@degamma.html

  * igt@kms_color_pipeline@plane-lut1d:
    - shard-bmg:          [PASS][75] -> [SKIP][76] ([Intel XE#7006])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d.html

  * igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#7705]) +1 other test fail
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][79] -> [SKIP][80] ([Intel XE#2316]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][81] -> [ABORT][82] ([Intel XE#5545] / [Intel XE#6652]) +1 other test abort
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@wf_vblank-ts-check:
    - shard-bmg:          [PASS][85] -> [SKIP][86] ([Intel XE#2482]) +12 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-bmg:          [PASS][87] -> [SKIP][88] ([Intel XE#7178])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:
    - shard-bmg:          [PASS][89] -> [SKIP][90] ([Intel XE#2380])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html

  * igt@kms_invalid_mode@bad-vsync-end:
    - shard-bmg:          [PASS][91] -> [SKIP][92] ([Intel XE#2568]) +2 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_invalid_mode@bad-vsync-end.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-end.html

  * igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#7283])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-linear-modifier-source-clamping:
    - shard-bmg:          [PASS][95] -> [SKIP][96] ([Intel XE#7111]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html

  * igt@kms_plane_alpha_blend@alpha-7efc:
    - shard-bmg:          [PASS][97] -> [SKIP][98] ([Intel XE#7082]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_plane_alpha_blend@alpha-7efc.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-7efc.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][99] -> [SKIP][100] ([Intel XE#2571] / [Intel XE#7343])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - shard-bmg:          [PASS][101] -> [SKIP][102] ([Intel XE#2763] / [Intel XE#6886]) +34 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-bmg:          [PASS][103] -> [SKIP][104] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [PASS][105] -> [SKIP][106] ([Intel XE#7079])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_pm_rpm@drm-resources-equal.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][107] -> [SKIP][108] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-idle:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#7106])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_pm_rpm@system-suspend-idle.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@system-suspend-idle.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - shard-bmg:          [PASS][111] -> [SKIP][112] ([Intel XE#4886])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_pm_rpm@universal-planes-dpms.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-bmg:          [PASS][113] -> [SKIP][114] ([Intel XE#7112])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_properties@plane-properties-legacy.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html

  * igt@xe_eu_stall@blocking-read:
    - shard-bmg:          [PASS][115] -> [SKIP][116] ([Intel XE#6568])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@xe_eu_stall@blocking-read.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_eu_stall@blocking-read.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-bmg:          [PASS][117] -> [ABORT][118] ([Intel XE#7578])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  
#### Possible fixes ####

  * igt@kms_flip@blocking-wf_vblank@b-dp2:
    - shard-bmg:          [FAIL][119] ([Intel XE#7705]) -> [PASS][120] +1 other test pass
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@b-dp2.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][121] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][122]
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][123] ([Intel XE#6361]) -> [PASS][124] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          [FAIL][125] ([Intel XE#7695]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_pat@pat-sw-hw-compare.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][127] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][128]
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_survivability@runtime-survivability.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          [DMESG-WARN][129] ([Intel XE#5545]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_wedged@wedged-at-any-timeout.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][131] ([Intel XE#7178] / [Intel XE#7349]) -> [SKIP][132] ([Intel XE#7178]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][133] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][134] ([Intel XE#2380])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#2311]) -> [SKIP][136] ([Intel XE#6314])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][137] ([Intel XE#2311]) -> [SKIP][138] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +25 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][139] ([Intel XE#4141]) -> [SKIP][140] ([Intel XE#6314]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][141] ([Intel XE#4141]) -> [SKIP][142] ([Intel XE#2434] / [Intel XE#2548] / [Intel XE#6314]) +14 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - shard-bmg:          [SKIP][143] ([Intel XE#4141]) -> [SKIP][144] ([Intel XE#2548] / [Intel XE#6314]) +2 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][145] ([Intel XE#2311]) -> [SKIP][146] ([Intel XE#2548] / [Intel XE#6314]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][147] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][148] ([Intel XE#6314]) +6 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][149] ([Intel XE#2313]) -> [SKIP][150] ([Intel XE#6314]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][151] ([Intel XE#2313]) -> [SKIP][152] ([Intel XE#2548] / [Intel XE#6314]) +33 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][153] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][154] ([Intel XE#3544])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][155] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][156] ([Intel XE#2426] / [Intel XE#5848])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2434]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7079]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079
  [Intel XE#7082]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106
  [Intel XE#7111]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111
  [Intel XE#7112]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * Linux: xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4 -> xe-pw-165398v1

  IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4
  xe-pw-165398v1: 165398v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/index.html

--===============7876344200180435809==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


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
<tr><td><b>Series:</b></td><td>series starting with [v2,1/4] drm/i915/display: Don’t use atomic state back-pointer to derive color pipeline</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165398/">https://patchwork.freedesktop.org/series/165398/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4_FULL -&gt; xe-pw-165398v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-165398v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-165398v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-165398v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_sip@invalidinstr-disabled@drm_xe_engine_class_render0.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">SKIP</a> +535 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_sriov_scheduling@equal-throughput@numvfs-random.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_cdclk@plane-scaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@atomic-hdcp14.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-max-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_cursor_crc@cursor-offscreen-max-size.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_fbcon_fbt@fbc.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_vrr@max-min.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_evict@evict-small-multi-queue-priority.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-imm.html">SKIP</a> +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_bw@linear-tiling-4-displays-target-2560x1440p}:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-165398v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_color@degamma:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_color@degamma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-3/igt@kms_flip@2x-absolute-wf_vblank@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_flip@wf_vblank-ts-check.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip@wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-end:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_invalid_mode@bad-vsync-end.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_invalid_mode@bad-vsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane@pixel-format-4-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-linear-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane@pixel-format-linear-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7111">Intel XE#7111</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_plane_alpha_blend@alpha-7efc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_alpha_blend@alpha-7efc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7082">Intel XE#7082</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7079">Intel XE#7079</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_pm_rpm@system-suspend-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@system-suspend-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7106">Intel XE#7106</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_properties@plane-properties-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_properties@plane-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7112">Intel XE#7112</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@xe_eu_stall@blocking-read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6568">Intel XE#6568</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7578">Intel XE#7578</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@blocking-wf_vblank@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_flip@blocking-wf_vblank@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7705">Intel XE#7705</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-8/igt@kms_flip@blocking-wf_vblank@b-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-lnl-7/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-lnl-6/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_pat@pat-sw-hw-compare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-1/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2434">Intel XE#2434</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6314">Intel XE#6314</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165398v1/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4 -&gt; xe-pw-165398v1</li>
</ul>
<p>IGT_8872: e70db143b7bafe09bdea4d33188cb10d2070d0e5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4930-021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4: 021ccd6f29b34f09e4b3aac0d6d52b8adaa1c4b4<br />
  xe-pw-165398v1: 165398v1</p>

</body>
</html>

--===============7876344200180435809==--
