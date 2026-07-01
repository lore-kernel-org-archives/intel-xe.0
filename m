Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E27C43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 23:59:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4D110F10C;
	Wed,  1 Jul 2026 23:59:04 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1180A10F10C;
 Wed,  1 Jul 2026 23:59:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7017057596791644961=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Introduce_Xe_PCIe_FLR_=28r?=
 =?utf-8?q?ev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 23:59:02 -0000
Message-ID: <178295034204.140838.1235512110707388347@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701083051.450259-1-raag.jadav@intel.com>
In-Reply-To: <20260701083051.450259-1-raag.jadav@intel.com>
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

--===============7017057596791644961==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce Xe PCIe FLR (rev9)
URL   : https://patchwork.freedesktop.org/series/162055/
State : success

== Summary ==

CI Bug Log - changes from xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3_FULL -> xe-pw-162055v9_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-162055v9_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@unused-pitches:
    - shard-lnl:          NOTRUN -> [ABORT][1] ([Intel XE#8007])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-5/igt@kms_addfb_basic@unused-pitches.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#367])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#3432])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#7358])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2252]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2320]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#4210] / [Intel XE#7467])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#1508])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4354] / [Intel XE#5870])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1138] / [Intel XE#7344])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301]) +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#4141]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2352] / [Intel XE#7399])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2311]) +22 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#7061])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2313]) +13 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1503])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7283])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#5020] / [Intel XE#7348])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@pr:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#8395]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#8396])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1489])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2387] / [Intel XE#7429])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#6503])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_sharpness_filter@filter-scaler-downscale.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2450] / [Intel XE#5857])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html

  * igt@xe_configfs@engines-allowed:
    - shard-bmg:          NOTRUN -> [ABORT][34] ([Intel XE#8007])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@xe_configfs@engines-allowed.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7636]) +5 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_eudebug@basic-vms.html

  * igt@xe_evict@evict-cm-threads-small-multi-queue:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#8370])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_evict@evict-cm-threads-small-multi-queue.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][37] -> [INCOMPLETE][38] ([Intel XE#6321] / [Intel XE#8355])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8374]) +5 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8364]) +10 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8369]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@long-spin-reuse-many-preempt:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#7850])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8378]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-bmg:          [PASS][46] -> [ABORT][47] ([Intel XE#8007])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6964])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2284] / [Intel XE#7370])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#4733] / [Intel XE#7417])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#944]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [FAIL][52] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [FAIL][54] ([Intel XE#6078]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][56] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][58] ([Intel XE#7571]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-bmg:          [FAIL][60] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][62] ([Intel XE#301]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [INCOMPLETE][64] ([Intel XE#8175]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-9/igt@xe_pm@s3-multiple-execs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][66] ([Intel XE#8007]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][68] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][69] ([Intel XE#3544])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_pxp@pxp-termination-key-update-post-termination-irq:
    - shard-bmg:          [INCOMPLETE][70] ([Intel XE#2594]) -> [SKIP][71] ([Intel XE#4733] / [Intel XE#7417])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8175]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3 -> xe-pw-162055v9

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3: 4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3
  xe-pw-162055v9: 162055v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/index.html

--===============7017057596791644961==
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
<tr><td><b>Series:</b></td><td>Introduce Xe PCIe FLR (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162055/">https://patchwork.freedesktop.org/series/162055/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3_FULL -&gt; xe-pw-162055v9_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-162055v9_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@unused-pitches:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-5/igt@kms_addfb_basic@unused-pitches.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5870">Intel XE#5870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@pr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@pr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_pm_dc@dc3co-vpb-simulation@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-downscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@engines-allowed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@xe_configfs@engines-allowed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_evict@evict-cm-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-reuse-many-preempt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-1/igt@xe_exec_reset@long-spin-reuse-many-preempt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-2/igt@xe_exec_reset@long-spin-reuse-many-preempt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-2/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-9/igt@xe_pm@s3-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8175">Intel XE#8175</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-10/igt@xe_pm@s3-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-lnl-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162055v9/shard-bmg-1/igt@xe_pxp@pxp-termination-key-update-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3 -&gt; xe-pw-162055v9</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5317-4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3: 4847fd44d1663d4ea8bbfc2f6e178f60a377bbb3<br />
  xe-pw-162055v9: 162055v9</p>

</body>
</html>

--===============7017057596791644961==--
