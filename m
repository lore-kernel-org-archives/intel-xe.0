Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59945CD4F54
	for <intel-xe@archiver.kernel.org>; Fri, 29 May 2026 19:47:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2F1C10E392;
	Fri, 29 May 2026 19:47:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C6910E392;
 Fri, 29 May 2026 19:47:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8288956696201183576=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/de=3A_Remove_the_?=
 =?utf-8?q?2_usec_fast_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 May 2026 19:47:22 -0000
Message-ID: <178008404277.23778.11111835164368899723@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260529161147.17573-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260529161147.17573-1-ville.syrjala@linux.intel.com>
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

--===============8288956696201183576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/de: Remove the 2 usec fast timeout
URL   : https://patchwork.freedesktop.org/series/167560/
State : success

== Summary ==

CI Bug Log - changes from xe-5161-3718158f242e7219323c992ce141adb98bad6f7c_FULL -> xe-pw-167560v1_FULL
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

  Here are the changes found in xe-pw-167560v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#7059] / [Intel XE#7085])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1407])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1124])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#367])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +8 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#306] / [Intel XE#7358])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2325] / [Intel XE#7358])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4354] / [Intel XE#7386])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2244])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2375])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#301] / [Intel XE#3149])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#2311]) +11 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#6312]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#4141]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6312] / [Intel XE#651])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7905]) +6 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7865]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#1469] / [Intel XE#7399])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#7061]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +8 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#7915]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7283])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7283])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2763] / [Intel XE#6886]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#3309] / [Intel XE#7368])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#1489])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2893] / [Intel XE#7304])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2387] / [Intel XE#7429])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-basic:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1406])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_psr@fbc-pr-basic.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2234] / [Intel XE#2850])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#3904] / [Intel XE#7342])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-basic:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6503])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html

  * igt@kms_vrr@max-min:
    - shard-lnl:          [PASS][43] -> [FAIL][44] ([Intel XE#4227]) +1 other test fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-4/igt@kms_vrr@max-min.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-2/igt@kms_vrr@max-min.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6599])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_eudebug@basic-exec-queues-enable:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7636])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_eudebug@basic-exec-queues-enable.html

  * igt@xe_eudebug@basic-read-event:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7636]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#6540] / [Intel XE#688])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-small-multi-queue-priority-cm:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7140])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7482]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_balancer@once-cm-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#1392]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#7136])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_fault_mode@many-multi-queue.html

  * igt@xe_exec_fault_mode@once-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7136]) +1 other test skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-imm.html

  * igt@xe_exec_multi_queue@many-execs-priority:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#6874]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-priority.html

  * igt@xe_exec_multi_queue@many-queues-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6874]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7866])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap:
    - shard-lnl:          [PASS][58] -> [INCOMPLETE][59] ([Intel XE#2594])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-3/igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7138]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#7138]) +2 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#7954])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_madvise@atomic-global:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7980])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_madvise@atomic-global.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#584] / [Intel XE#7369])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#4733] / [Intel XE#7417])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-bmg:          NOTRUN -> [SKIP][67] ([Intel XE#944])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7892])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][69] ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][70] +1 other test pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][71] ([Intel XE#6078]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][73] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][74] +1 other test pass
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][75] ([Intel XE#7571]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][77] ([Intel XE#301]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-lnl:          [ABORT][79] ([Intel XE#8007]) -> [PASS][80] +1 other test pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][81] ([Intel XE#2142]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][83] ([Intel XE#6321]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][85] ([Intel XE#301]) -> [FAIL][86] ([Intel XE#301] / [Intel XE#3149])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][87] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][88] ([Intel XE#2426] / [Intel XE#5848])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7386]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5161-3718158f242e7219323c992ce141adb98bad6f7c -> xe-pw-167560v1

  IGT_8943: 8943
  xe-5161-3718158f242e7219323c992ce141adb98bad6f7c: 3718158f242e7219323c992ce141adb98bad6f7c
  xe-pw-167560v1: 167560v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/index.html

--===============8288956696201183576==
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
<tr><td><b>Series:</b></td><td>drm/i915/de: Remove the 2 usec fast timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167560/">https://patchwork.freedesktop.org/series/167560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5161-3718158f242e7219323c992ce141adb98bad6f7c_FULL -&gt; xe-pw-167560v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167560v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7386">Intel XE#7386</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469">Intel XE#1469</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-2/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_plane_scaling@planes-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_psr@fbc-pr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_sharpness_filter@filter-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-4/igt@kms_vrr@max-min.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-2/igt@kms_vrr@max-min.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-exec-queues-enable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_eudebug@basic-exec-queues-enable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_eudebug@basic-read-event.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-priority-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-priority-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_balancer@once-cm-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_fault_mode@many-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_fault_mode@once-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_multi_queue@many-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_reset@multi-queue-gt-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-3/igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@xe_exec_system_allocator@once-large-mmap-remap-ro-dontunmap.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-global:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_madvise@atomic-global.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_pxp@display-pxp-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5161-3718158f242e7219323c992ce141adb98bad6f7c/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167560v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5161-3718158f242e7219323c992ce141adb98bad6f7c -&gt; xe-pw-167560v1</li>
</ul>
<p>IGT_8943: 8943<br />
  xe-5161-3718158f242e7219323c992ce141adb98bad6f7c: 3718158f242e7219323c992ce141adb98bad6f7c<br />
  xe-pw-167560v1: 167560v1</p>

</body>
</html>

--===============8288956696201183576==--
