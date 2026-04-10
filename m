Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56352F44868
	for <intel-xe@archiver.kernel.org>; Fri, 10 Apr 2026 13:24:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 154F310E95E;
	Fri, 10 Apr 2026 13:24:13 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ACE310E95E;
 Fri, 10 Apr 2026 13:24:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2405424115949206555=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_USE_drm_mm_instead_of_drm_?=
 =?utf-8?q?SA_for_CCS_read/write_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Apr 2026 13:24:11 -0000
Message-ID: <177582745121.449994.14673189284167295656@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20260408110145.1639937-4-satyanarayana.k.v.p@intel.com>
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

--===============2405424115949206555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: USE drm mm instead of drm SA for CCS read/write (rev5)
URL   : https://patchwork.freedesktop.org/series/163588/
State : failure

== Summary ==

CI Bug Log - changes from xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1_FULL -> xe-pw-163588v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-163588v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-163588v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-163588v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@xe_exec_balancer@many-virtual-basic:
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-163588v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7059] / [Intel XE#7085])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7621])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#367] / [Intel XE#7354])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2252]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2286] / [Intel XE#6035])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#4422] / [Intel XE#7442])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2311]) +6 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2313]) +7 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#6901])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7283]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_cursor@primary:
    - shard-bmg:          [PASS][24] -> [ABORT][25] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7200]) +1 other test abort
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@kms_plane_cursor@primary.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_plane_cursor@primary.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#7340])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#1489]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#6503])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#7636]) +2 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#6321])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7140])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2322] / [Intel XE#7372])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7136]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#6874]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#5625])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7138]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6964])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2284] / [Intel XE#7370])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#944])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][47] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][48] +1 other test pass
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [ABORT][49] ([Intel XE#5545] / [Intel XE#6652] / [Intel XE#7200]) -> [PASS][50]
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][51] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][52] ([Intel XE#2426] / [Intel XE#5848])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7200]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7621]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1 -> xe-pw-163588v5

  IGT_8852: 8852
  xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1: b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1
  xe-pw-163588v5: 163588v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html

--===============2405424115949206555==
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
<tr><td><b>Series:</b></td><td>USE drm mm instead of drm SA for CCS read/write (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163588/">https://patchwork.freedesktop.org/series/163588/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1_FULL -&gt; xe-pw-163588v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-163588v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-163588v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-163588v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-4/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-6/igt@xe_exec_balancer@many-virtual-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163588v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7621">Intel XE#7621</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7354">Intel XE#7354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_plane_cursor@primary.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200">Intel XE#7200</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-1/igt@kms_pm_dc@dc5-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-6/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-3/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-lnl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-single-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-2/igt@kms_setmode@clone-exclusive-crtc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7200">Intel XE#7200</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-8/igt@kms_setmode@clone-exclusive-crtc.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163588v5/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1 -&gt; xe-pw-163588v5</li>
</ul>
<p>IGT_8852: 8852<br />
  xe-4878-b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1: b6a5ad2db4f7519d2c4f4c872cf5d664e6a7fff1<br />
  xe-pw-163588v5: 163588v5</p>

</body>
</html>

--===============2405424115949206555==--
