Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F408CCCA476
	for <intel-xe@archiver.kernel.org>; Fri, 10 Oct 2025 09:04:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B29C010EB71;
	Fri, 10 Oct 2025 09:04:43 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97E5510EB89;
 Fri, 10 Oct 2025 09:04:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8101623918035720189=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/guc=3A_Cleanup_GuC_?=
 =?utf-8?q?log_buffer_macros_and_helpers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 Oct 2025 09:04:42 -0000
Message-ID: <176008708255.26850.14626269732142698039@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251009215749.378905-1-zhanjun.dong@intel.com>
In-Reply-To: <20251009215749.378905-1-zhanjun.dong@intel.com>
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

--===============8101623918035720189==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Cleanup GuC log buffer macros and helpers (rev2)
URL   : https://patchwork.freedesktop.org/series/155338/
State : success

== Summary ==

CI Bug Log - changes from xe-3893-23e7752f903fec07634c72b778a733cf4ed17656_FULL -> xe-pw-155338v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-155338v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][1] ([Intel XE#316])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][2] ([Intel XE#1124]) +2 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#2314] / [Intel XE#2894])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#367]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#2907])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#787]) +20 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#373]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#308])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][11] -> [SKIP][12] ([Intel XE#2291]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#701])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#2316]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-rmfb:
    - shard-adlp:         [PASS][18] -> [DMESG-WARN][19] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#5208])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_flip@flip-vs-rmfb.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html

  * igt@kms_flip@flip-vs-suspend@b-hdmi-a1:
    - shard-adlp:         [PASS][20] -> [DMESG-WARN][21] ([Intel XE#4543]) +6 other tests dmesg-warn
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_flip@flip-vs-suspend@b-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#3098])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#651]) +12 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#5390]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#653]) +9 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#356])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [PASS][29] -> [DMESG-WARN][30] ([Intel XE#2953] / [Intel XE#4173]) +5 other tests dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#4596])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-x.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1406] / [Intel XE#1489]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][35] -> [SKIP][36] ([Intel XE#1435])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@xe_eudebug@vma-ufence-faultable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4837]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_eudebug@vma-ufence-faultable.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-userptr:
    - shard-bmg:          [PASS][38] -> [ABORT][39] ([Intel XE#3970])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-5/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-2/igt@xe_exec_compute_mode@many-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#288]) +8 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][41] -> [DMESG-WARN][42] ([Intel XE#3876])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4943])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#4915]) +79 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontunmap-eocheck.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#3573]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_pm@d3hot-i2c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#5742])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#4733])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#944])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_render_copy@render-stress-4-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#4814])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_render_copy@render-stress-4-copies.html

  
#### Possible fixes ####

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][50] ([Intel XE#3884]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][52] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][54] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [SKIP][56] ([Intel XE#2291]) -> [PASS][57] +5 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][58] ([Intel XE#2316]) -> [PASS][59] +2 other tests pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][60] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][62] ([Intel XE#4543]) -> [PASS][63] +7 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:
    - shard-adlp:         [DMESG-FAIL][64] ([Intel XE#4543]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [SKIP][66] ([Intel XE#1503]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_hdr@static-swap.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@kms_hdr@static-swap.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][68] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][69] +2 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][70] ([Intel XE#4596]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][72] ([Intel XE#6321]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * {igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma}:
    - shard-lnl:          [FAIL][74] ([Intel XE#6267]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][76] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) -> [DMESG-FAIL][77] ([Intel XE#4543])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-adlp:         [DMESG-WARN][78] ([Intel XE#4543]) -> [DMESG-FAIL][79] ([Intel XE#4543])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][80] ([Intel XE#2312]) -> [SKIP][81] ([Intel XE#2311]) +10 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [DMESG-FAIL][82] ([Intel XE#4543]) -> [DMESG-FAIL][83] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][84] ([Intel XE#2312]) -> [SKIP][85] ([Intel XE#5390]) +3 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][86] ([Intel XE#5390]) -> [SKIP][87] ([Intel XE#2312]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][88] ([Intel XE#2311]) -> [SKIP][89] ([Intel XE#2312]) +9 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][90] ([Intel XE#2312]) -> [SKIP][91] ([Intel XE#2313]) +11 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][92] ([Intel XE#2313]) -> [SKIP][93] ([Intel XE#2312]) +9 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][94] ([Intel XE#4596]) -> [SKIP][95] ([Intel XE#5021])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-yf.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-adlp:         [ABORT][96] ([Intel XE#5530]) -> [ABORT][97] ([Intel XE#4917] / [Intel XE#5530])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          [ABORT][98] ([Intel XE#5466] / [Intel XE#5530]) -> [ABORT][99] ([Intel XE#4917] / [Intel XE#5466] / [Intel XE#5530])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_module_load@load:
    - shard-adlp:         ([PASS][100], [SKIP][101], [PASS][102], [PASS][103], [PASS][104], [PASS][105], [PASS][106], [PASS][107], [PASS][108], [PASS][109], [PASS][110], [PASS][111], [PASS][112], [PASS][113], [PASS][114], [PASS][115], [PASS][116], [PASS][117], [PASS][118], [PASS][119], [PASS][120], [PASS][121], [PASS][122], [PASS][123], [PASS][124], [PASS][125]) ([Intel XE#378] / [Intel XE#5612]) -> ([PASS][126], [PASS][127], [PASS][128], [PASS][129], [PASS][130], [PASS][131], [PASS][132], [PASS][133], [PASS][134], [PASS][135], [PASS][136], [PASS][137], [PASS][138], [PASS][139], [DMESG-WARN][140], [PASS][141], [PASS][142], [PASS][143], [SKIP][144], [PASS][145], [PASS][146], [PASS][147], [PASS][148], [PASS][149], [PASS][150], [PASS][151]) ([Intel XE#2953] / [Intel XE#378] / [Intel XE#4173] / [Intel XE#5612])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-3/igt@xe_module_load@load.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-3/igt@xe_module_load@load.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-3/igt@xe_module_load@load.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@xe_module_load@load.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@xe_module_load@load.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@xe_module_load@load.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@xe_module_load@load.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@xe_module_load@load.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@xe_module_load@load.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@xe_module_load@load.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@xe_module_load@load.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@xe_module_load@load.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@xe_module_load@load.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@xe_module_load@load.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@xe_module_load@load.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@xe_module_load@load.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@xe_module_load@load.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@load.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@xe_module_load@load.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@xe_module_load@load.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@xe_module_load@load.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@xe_module_load@load.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_module_load@load.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_module_load@load.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_module_load@load.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-8/igt@xe_module_load@load.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-8/igt@xe_module_load@load.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@xe_module_load@load.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-8/igt@xe_module_load@load.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@xe_module_load@load.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@xe_module_load@load.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@xe_module_load@load.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@xe_module_load@load.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_module_load@load.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@xe_module_load@load.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@load.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@load.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-6/igt@xe_module_load@load.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-6/igt@xe_module_load@load.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@load.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@load.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-6/igt@xe_module_load@load.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@xe_module_load@load.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-dg2-set2:     [TIMEOUT][152] -> [INCOMPLETE][153] ([Intel XE#4504])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-464/igt@xe_pm@s2idle-multiple-execs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-435/igt@xe_pm@s2idle-multiple-execs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4504
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5208
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530
  [Intel XE#5612]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5786]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5786
  [Intel XE#6267]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6267
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6320
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3893-23e7752f903fec07634c72b778a733cf4ed17656 -> xe-pw-155338v2

  IGT_8581: 8581
  xe-3893-23e7752f903fec07634c72b778a733cf4ed17656: 23e7752f903fec07634c72b778a733cf4ed17656
  xe-pw-155338v2: 155338v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/index.html

--===============8101623918035720189==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Cleanup GuC log buffer macros an=
d helpers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/155338/">https://patchwork.freedesktop.org/series/155338/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155338v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155338v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3893-23e7752f903fec07634c72b778a733cf4=
ed17656_FULL -&gt; xe-pw-155338v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-155338v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_bw@linear-tiling-3-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-yf=
-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4=
-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_chamelium_edid@vga-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid=
-movement-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/sh=
ard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_feature_discovery@chame=
lium.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-lnl-5/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_fli=
p@flip-vs-rmfb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_flip@flip-vs-rmfb.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/5208">Intel XE#5208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_flip@flip-vs=
-suspend@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +6 other tests dmesg-=
warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@kms_fli=
p@plain-flip-ts-check-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/i=
gt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#=
3098</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32=
bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@kms_multipipe_modeset@basic=
-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@kms_pla=
ne@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel =
XE#4173</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_plane_multiple@2x-=
tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vma-ufence-faultable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_eudebug@vma-ufence-fault=
able.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-5/igt@xe_exec_=
compute_mode@many-bindexecqueue-userptr.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-2/igt@xe_ex=
ec_compute_mode@many-bindexecqueue-userptr.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-8/igt@xe_exec_=
reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-4/igt@xe_exec_reset@paralle=
l-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@xe_exec_system_allocator@many=
-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-shared-remap-dontun=
map-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_exec_system_allocator@th=
reads-many-large-mmap-shared-remap-dontunmap-eocheck.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#491=
5</a>) +79 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_oa@invalid-oa-metric-set=
-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-463/igt@xe_pm@d3hot-i2c.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">I=
ntel XE#5742</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_pxp@pxp-stale-bo-exec-po=
st-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_query@multigpu-query-uc-=
fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-4-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-155338v2/shard-dg2-434/igt@xe_render_copy@render-stres=
s-4-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-=
1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2=
-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/27=
05">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-4=
63/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-=
bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-435/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#259=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155=
338v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</=
a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shar=
d-adlp-9/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html">PASS</a> +7 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-b-hdmi-a-1-y-to-y.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155338v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-b-hdmi-a=
-1-y-to-y.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_hdr@=
static-swap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@kms_hdr@static-swap=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-1/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-b-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173"=
>Intel XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155338v2/shard-adlp-9/igt@kms_pipe_crc_basic@suspend-read-crc@pip=
e-b-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-5/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@xe_evict=
@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shar=
d-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma}:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-lnl-4/igt@xe_exec_=
system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6267">Intel XE#=
6267</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155338v2/shard-lnl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx=
-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953"=
>Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4173">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@kms_big_fb@=
y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Int=
el XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@kms_fli=
p@plain-flip-ts-check-interruptible.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard=
-adlp-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">DMESG-FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Inte=
l XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155338v2/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">DMESG-FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-155338v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-m=
sflip-blt.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1553=
38v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5390">Intel XE#5390</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#=
5390</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155338v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
155338v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
55338v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155338v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-bmg-8/igt@kms_pla=
ne_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2=
/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5530">Intel XE#5530</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-bmg-4/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530">Inte=
l XE#5530</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-155338v2/shard-bmg-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4917">Intel XE#4917</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5466">Intel XE#5466</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5530">Intel XE#5530</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@x=
e_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-3/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-ad=
lp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/sha=
rd-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed1765=
6/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4e=
d17656/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a73=
3cf4ed17656/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b7=
78a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634=
c72b778a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec=
07634c72b778a733cf4ed17656/shard-adlp-8/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f9=
03fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7=
752f903fec07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893=
-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-2/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-ad=
lp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/sha=
rd-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4ed1765=
6/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a733cf4e=
d17656/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b778a73=
3cf4ed17656/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634c72b7=
78a733cf4ed17656/shard-adlp-9/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec07634=
c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3893-23e7752f903fec=
07634c72b778a733cf4ed17656/shard-adlp-6/igt@xe_module_load@load.html">PASS<=
/a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">I=
ntel XE#378</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5612">Intel XE#5612</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@load.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v=
2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-1/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-155338v2/shard-adlp-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp=
-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
5338v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-155338v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard=
-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@xe_module_load@lo=
ad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-155338v2/shard-adlp-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-155338v2/shard-adlp-9/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/=
shard-adlp-9/igt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-3/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-155338v2/shard-adlp-2/igt@xe_module_load@load.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-=
adlp-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_load@loa=
d.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-155338v2/shard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-6/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-155338v2/shard-adlp-6/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/s=
hard-adlp-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-4/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-155338v2/shard-adlp-6/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-adlp-9/=
igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5612"=
>Intel XE#5612</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3893-23e7752f903fec07634c72b778a733cf4ed17656/shard-dg2-464/igt@xe_pm@=
s2idle-multiple-execs.html">TIMEOUT</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-155338v2/shard-dg2-435/igt@xe_pm@s2idle-multi=
ple-execs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4504">Intel XE#4504</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3893-23e7752f903fec07634c72b778a733cf4ed17656 -&gt; xe-pw-155=
338v2</li>
</ul>
<p>IGT_8581: 8581<br />
  xe-3893-23e7752f903fec07634c72b778a733cf4ed17656: 23e7752f903fec07634c72b=
778a733cf4ed17656<br />
  xe-pw-155338v2: 155338v2</p>

</body>
</html>

--===============8101623918035720189==--
