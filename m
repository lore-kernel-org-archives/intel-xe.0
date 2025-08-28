Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C518C8303F
	for <intel-xe@archiver.kernel.org>; Thu, 28 Aug 2025 16:06:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0CD710EA45;
	Thu, 28 Aug 2025 16:06:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1C910EA44;
 Thu, 28 Aug 2025 16:06:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1272855620528420312=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/i915/display=3A_Add_no?=
 =?utf-8?q?=5Fpsr=5Freason_to_PSR_debugfs_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 28 Aug 2025 16:06:45 -0000
Message-ID: <175639720510.280646.16134532603974437715@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250828104951.1279862-1-michal.grzelak@intel.com>
In-Reply-To: <20250828104951.1279862-1-michal.grzelak@intel.com>
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

--===============1272855620528420312==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Add no_psr_reason to PSR debugfs (rev11)
URL   : https://patchwork.freedesktop.org/series/148957/
State : success

== Summary ==

CI Bug Log - changes from xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de_FULL -> xe-pw-148957v11_FULL
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

  Here are the changes found in xe-pw-148957v11_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-dg2-set2:     [PASS][1] -> [SKIP][2] ([Intel XE#2134])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@fbdev@unaligned-write.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#4543]) +1 other test dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][7] -> [SKIP][8] ([Intel XE#2314] / [Intel XE#2894])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#787]) +90 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][11] ([Intel XE#3124] / [Intel XE#4345])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][12] ([Intel XE#1727] / [Intel XE#3113])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][13] ([Intel XE#1727] / [Intel XE#3113])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][14] ([Intel XE#3124])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#455] / [Intel XE#787]) +12 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#4417] / [Intel XE#455])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#4417]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#455])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#3304])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-433/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][20] -> [DMESG-WARN][21] ([Intel XE#5354])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-7/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2291]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [PASS][24] -> [SKIP][25] ([Intel XE#2373])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_feature_discovery@display-2x.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][26] -> [SKIP][27] ([Intel XE#2316]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_flip@2x-nonexisting-fb.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#4208] / [i915#2575]) +37 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#301])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:
    - shard-adlp:         [PASS][32] -> [DMESG-WARN][33] ([Intel XE#4543]) +4 other tests dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#651])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#656]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#653]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][40] -> [SKIP][41] ([Intel XE#1503]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#718])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-adlp:         [PASS][44] -> [DMESG-WARN][45] ([Intel XE#2953] / [Intel XE#4173]) +1 other test dmesg-warn
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1406] / [Intel XE#1489])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_psr@psr-suspend.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#2883]) +1 other test fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_setmode@basic.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-1/igt@kms_setmode@basic.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#2142]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#1280] / [Intel XE#455])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-beng-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#688])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_evict@evict-beng-large-multi-vm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1392])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][55] -> [SKIP][56] ([Intel XE#4208]) +99 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#288] / [Intel XE#5561]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate.html

  * igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#4915]) +12 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#4943])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [PASS][60] -> [DMESG-WARN][61] ([Intel XE#5893])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2229])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#4208])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_module_load@reload-no-display.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@short-reads:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#3573])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_oa@short-reads.html

  * igt@xe_pm@d3cold-basic:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#2284] / [Intel XE#366])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1948])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#944])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_query@multigpu-query-invalid-size.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [FAIL][69] ([Intel XE#4208]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@core_setmaster@master-drop-set-root.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#4208] / [i915#2575]) -> [PASS][72] +38 other tests pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_atomic@plane-invalid-params-fence.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][73] ([Intel XE#4543]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][76] +3 other tests pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][77] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][79] ([Intel XE#2291]) -> [PASS][80] +4 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][81] ([Intel XE#1340]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][83] ([Intel XE#2316]) -> [PASS][84] +4 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][85] ([Intel XE#4543]) -> [PASS][86] +3 other tests pass
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][87] ([Intel XE#301]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [INCOMPLETE][89] ([Intel XE#5736]) -> [PASS][90] +1 other test pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][91] ([Intel XE#1503]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][93] ([Intel XE#3012]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#4208]) -> [PASS][96] +79 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exec_basic@many-execqueues-many-vm-basic.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_exec_basic@many-execqueues-many-vm-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#1392]) -> [PASS][98] +1 other test pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_pmu@gt-frequency:
    - shard-dg2-set2:     [FAIL][99] ([Intel XE#5166]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-435/igt@xe_pmu@gt-frequency.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-464/igt@xe_pmu@gt-frequency.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][101] ([Intel XE#4543]) -> [FAIL][102] ([Intel XE#3884])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][104] ([Intel XE#316])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#4208]) -> [SKIP][106] ([Intel XE#316]) +1 other test skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#4208]) -> [SKIP][108] ([Intel XE#1124]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#607]) -> [SKIP][110] ([Intel XE#2351] / [Intel XE#4208])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1124]) -> [SKIP][112] ([Intel XE#4208]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][114] ([Intel XE#1124]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#619]) -> [SKIP][116] ([Intel XE#2351] / [Intel XE#4208])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#4208] / [i915#2575]) -> [SKIP][118] ([Intel XE#2191])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#4208] / [i915#2575]) -> [SKIP][120] ([Intel XE#367])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#367]) -> [SKIP][122] ([Intel XE#4208] / [i915#2575])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][124] ([Intel XE#2351] / [Intel XE#4208])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#4208]) -> [SKIP][126] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][128] ([Intel XE#455] / [Intel XE#787])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][129] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][130] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][131] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][132] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#4208]) -> [INCOMPLETE][134] ([Intel XE#1727] / [Intel XE#3113])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][135] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [DMESG-WARN][136] ([Intel XE#1727] / [Intel XE#3113])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][138] ([Intel XE#4208]) +6 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#306]) -> [SKIP][140] ([Intel XE#4208] / [i915#2575])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_chamelium_color@ctm-blue-to-red.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#4208] / [i915#2575]) -> [SKIP][142] ([Intel XE#306])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_chamelium_color@ctm-red-to-blue.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#4208] / [i915#2575]) -> [SKIP][144] ([Intel XE#373]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#373]) -> [SKIP][146] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][147] ([Intel XE#1178]) -> [SKIP][148] ([Intel XE#2341]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_content_protection@legacy.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][149] ([Intel XE#1188]) -> [SKIP][150] ([Intel XE#4208] / [i915#2575])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_content_protection@uevent.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#4208] / [i915#2575]) -> [SKIP][152] ([Intel XE#455]) +4 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#4208]) -> [SKIP][154] ([Intel XE#4422])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][155] ([Intel XE#301]) -> [FAIL][156] ([Intel XE#301] / [Intel XE#3149])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][157] ([Intel XE#4543]) -> [DMESG-WARN][158] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543]) +1 other test dmesg-warn
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#455]) -> [SKIP][160] ([Intel XE#4208])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#4208]) -> [SKIP][162] ([Intel XE#455]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#651]) -> [SKIP][164] ([Intel XE#4208]) +9 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][165] ([Intel XE#2311]) -> [SKIP][166] ([Intel XE#2312]) +11 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][168] ([Intel XE#651]) +5 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][169] ([Intel XE#2312]) -> [SKIP][170] ([Intel XE#5390]) +5 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][171] ([Intel XE#5390]) -> [SKIP][172] ([Intel XE#2312]) +6 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][173] ([Intel XE#2312]) -> [SKIP][174] ([Intel XE#2311]) +13 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#4208]) -> [SKIP][176] ([Intel XE#651]) +5 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#651]) -> [SKIP][178] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#4208]) -> [SKIP][180] ([Intel XE#653]) +8 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][181] ([Intel XE#2313]) -> [SKIP][182] ([Intel XE#2312]) +15 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2312]) -> [SKIP][184] ([Intel XE#2313]) +12 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#653]) -> [SKIP][186] ([Intel XE#2351] / [Intel XE#4208]) +5 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#653]) -> [SKIP][188] ([Intel XE#4208]) +9 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][190] ([Intel XE#653]) +3 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#2927]) -> [SKIP][192] ([Intel XE#4208])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_joiner@basic-ultra-joiner.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#4359]) -> [SKIP][194] ([Intel XE#4208])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#870]) -> [SKIP][196] ([Intel XE#4208])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_pm_backlight@bad-brightness.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208]) -> [SKIP][198] ([Intel XE#908])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][200] ([Intel XE#1406] / [Intel XE#4208]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][202] ([Intel XE#1406] / [Intel XE#1489]) +1 other test skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][204] ([Intel XE#1122] / [Intel XE#1406])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][206] ([Intel XE#1406] / [Intel XE#4208]) +6 other tests skip
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_psr@pr-sprite-blt.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) -> [SKIP][208] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_psr@psr-dpms.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1406] / [Intel XE#2351] / [Intel XE#4208]) -> [SKIP][210] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_psr@psr-primary-page-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1406] / [Intel XE#4208]) -> [SKIP][212] ([Intel XE#1406] / [Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_psr@psr2-basic.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#3414]) -> [SKIP][214] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#4208] / [i915#2575]) -> [SKIP][216] ([Intel XE#3414])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_rotation_crc@sprite-rotation-90.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#455]) -> [SKIP][218] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_vrr@flipline.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#4208]) -> [SKIP][220] ([Intel XE#1280] / [Intel XE#455])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#4208]) -> [SKIP][222] ([Intel XE#1126])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-re-enable:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#4208]) -> [SKIP][224] ([Intel XE#5626])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_eu_stall@blocking-re-enable.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_eu_stall@blocking-re-enable.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#5626]) -> [SKIP][226] ([Intel XE#4208])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#4837]) -> [SKIP][228] ([Intel XE#4208]) +5 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1392]) -> [SKIP][230] ([Intel XE#4208]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#4208]) -> [SKIP][232] ([Intel XE#1392]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#288]) -> [SKIP][234] ([Intel XE#4208]) +11 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#4208]) -> [SKIP][236] ([Intel XE#288]) +9 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#4208]) -> [SKIP][238] ([Intel XE#4837]) +6 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4915]) -> [SKIP][240] ([Intel XE#4208]) +116 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#4208]) -> [SKIP][242] ([Intel XE#4915]) +110 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4208]) -> [SKIP][244] ([Intel XE#255])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_huc_copy@huc_copy.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#3573]) -> [SKIP][246] ([Intel XE#4208]) +2 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_oa@invalid-create-userspace-config.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#4208]) -> [SKIP][248] ([Intel XE#3573]) +3 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_oa@missing-sample-flags.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_oa@missing-sample-flags.html

  * igt@xe_pm@d3cold-i2c:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#4208]) -> [SKIP][250] ([Intel XE#5694])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_pm@d3cold-i2c.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208]) -> [SKIP][252] ([Intel XE#2284] / [Intel XE#366])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_pm@d3cold-mmap-vram.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#4650]) -> [SKIP][254] ([Intel XE#4208])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@display-pxp-fb:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#4208]) -> [SKIP][256] ([Intel XE#4733])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_pxp@display-pxp-fb.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_pxp@display-pxp-fb.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#4733]) -> [SKIP][258] ([Intel XE#4208]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#4208]) -> [SKIP][260] ([Intel XE#944])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_query@multigpu-query-hwconfig.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#4814]) -> [SKIP][262] ([Intel XE#4208])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_render_copy@render-stress-2-copies.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208]) -> [SKIP][264] ([Intel XE#4130]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5166]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5166
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5561
  [Intel XE#5626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5626
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5736
  [Intel XE#5890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5890
  [Intel XE#5893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5893
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de -> xe-pw-148957v11

  IGT_8512: 8512
  xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de: cd296b3d40e69455e98897bc2883d3f7ffe893de
  xe-pw-148957v11: 148957v11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/index.html

--===============1272855620528420312==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Add no_psr_reason to PSR d=
ebugfs (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148957/">https://patchwork.freedesktop.org/series/148957/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148957v11/index.html">https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148957v11/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3627-cd296b3d40e69455e98897bc2883d3f7f=
fe893de_FULL -&gt; xe-pw-148957v11_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148957v11_FULL that come from known =
issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@fbdev@=
unaligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@fbdev@unaligned-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_asy=
nc_flips@crc-atomic@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 o=
ther test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@kms_big_fb@y-tiled-64bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/i=
gt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#=
2314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-ti=
led-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-433/igt@kms_ccs@missing-ccs-buffer=
-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +90 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#311=
3</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#=
3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-=
tiled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf=
-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_cdclk@mode-transition.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_cdclk@mode-transition@p=
ipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_cdclk@mode-transition@p=
ipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-433/igt@kms_content_protection@lic=
-type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-7/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/s=
hard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varyin=
g-size.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5354">Intel XE#5354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_=
cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_feat=
ure_discovery@display-2x.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_feature_discove=
ry@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2373">Intel XE#2373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_flip=
@2x-nonexisting-fb.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_flip@2x-nonexisting-f=
b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_fl=
ip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_flip@fli=
p-vs-absolute-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +37 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-2/i=
gt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_fli=
p@flip-vs-expired-vblank@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_flip=
@flip-vs-expired-vblank@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +4 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_flip_scaled_crc@flip-3=
2bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-=
434/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">I=
ntel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4208">Intel XE#4208</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
cdrrs-rgb565-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_frontbuffer_tracking@ps=
r-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_hdr@static-toggle-=
suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Int=
el XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_pm_rpm@dpms-mo=
de-unset-lpsp.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other tes=
t dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@kms_psr@psr-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_set=
mode@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148957v11/shard-adlp-1/igt@kms_setmode@basic.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Inte=
l XE#2883</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@kms_=
vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) +1=
 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt@engine-drm_xe_engine_class_comput=
e:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_compute_preempt@compute=
-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_evict@evict-beng-large-mu=
lti-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_exe=
c_basic@once-userptr-invalidate-race.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_ex=
ec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +99 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_exec_fault_mode@once-use=
rptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/288">Intel XE#288</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5561">Intel XE#5561</a>) +1 other test skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-new-race-nomemset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_exec_system_allocator@pr=
ocess-many-stride-new-race-nomemset.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +12 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-mma=
p-new-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_exec_system_allocator@thr=
eads-shared-vm-many-large-execqueues-mmap-new-huge-nomemset.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel=
 XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-=
463/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">DMESG=
-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
893">Intel XE#5893</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@xe_live_ktest@xe_migrate@xe_=
validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_mod=
ule_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_module_load@=
reload-no-display.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_oa@short-reads.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573"=
>Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_pm@d3cold-basic.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284=
">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_pm@d3hot-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
948">Intel XE#1948</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148957v11/shard-adlp-2/igt@xe_query@multigpu-query-inv=
alid-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@core_s=
etmaster@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/ig=
t@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_at=
omic@plane-invalid-params-fence.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/=
shard-dg2-432/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> +38 =
other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-8/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543"=
>Intel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148957v11/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp=
-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_cc=
s@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
957v11/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html"=
>PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-c=
cs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v11/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tran=
sitions-varying-size.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_dith=
er@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_d=
ither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard=
-bmg-3/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> =
+4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_fli=
p@dpms-off-confusion-interruptible@c-hdmi-a1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v11/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible@c-hdmi-a1.=
html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sha=
rd-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip=
@flip-vs-suspend@c-edp1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5736">Intel XE#5736</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-1/igt@=
kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-3/igt@kms_hdr@static-t=
oggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-4/igt@kms_=
joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exe=
c_basic@many-execqueues-many-vm-basic.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg=
2-436/igt@xe_exec_basic@many-execqueues-many-vm-basic.html">PASS</a> +79 ot=
her tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-d=
g2-466/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">PASS</a> +1 o=
ther test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-435/igt@xe_pmu=
@gt-frequency.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5166">Intel XE#5166</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-464/igt@xe_pmu@gt-freq=
uency.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-4/igt@kms_asy=
nc_flips@crc-atomic@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shar=
d-adlp-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-1.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#=
3884</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bi=
g_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sha=
rd-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt=
@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bi=
g_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@=
kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg=
2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#=
2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt=
@kms_big_fb@yf-tiled-16bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bi=
g_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sha=
rd-dg2-436/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_big_fb=
@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bw=
@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148957v11/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-=
1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v11/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367"=
>Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_bw=
@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-4=
34/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2=
575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_cc=
s@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v11/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351=
">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sha=
rd-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">In=
tel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11=
/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
87">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148957v11/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-=
dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel =
XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE=
#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-=
dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">I=
ntel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-436/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2705">Intel XE#2705</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-=
dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html=
">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v11/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/420=
8">Intel XE#4208</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_ch=
amelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@=
kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ch=
amelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sh=
ard-dg2-432/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ch=
amelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v11/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-hib=
ernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_ch=
amelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt=
@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_cont=
ent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_=
content_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11=
/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v11/shard-dg2-436/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-=
area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-lnl-=
2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">I=
ntel XE#3149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-adlp-6/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-ad=
lp-6/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#29=
53</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/417=
3">Intel XE#4173</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v11/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32b=
pp-yftileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148957v11/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bp=
p-ytileccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v11/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-o=
noff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE=
#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148957v11/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-in=
dfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE=
#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p=
-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48957v11/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb=
-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5390">Intel XE#5390</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v=
11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148957v11/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-=
cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48957v11/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr=
-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v11/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-=
wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48957v11/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indf=
b-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148957v11/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri=
-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
957v11/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pl=
flip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434=
/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957=
v11/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-scnds=
crn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_=
joiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_pi=
pe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4359">Intel XE#4359</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434=
/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_pm=
_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_=
pm_backlight@bad-brightness.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_pm=
_dc@deep-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@kms_pm_dc@deep=
-pkgc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_ps=
r2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v11/shard-dg2-434/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ps=
r2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148957v11/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-m=
ove-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ps=
r2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard=
-dg2-436/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel=
 XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_ps=
r@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shar=
d-dg2-434/igt@kms_psr@pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2=
-434/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ps=
r@psr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v11/shard-dg2-432/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#14=
06</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ps=
r@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@k=
ms_psr@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434=
/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#=
2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@kms_ro=
tation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sh=
ard-dg2-436/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/igt@kms_vrr@flipline.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i=
915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_com=
pute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt=
@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_cop=
y_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/ig=
t@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-re-enable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_eu_=
stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_=
eu_stall@blocking-re-enable.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_eu_=
stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/5626">Intel XE#5626</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434=
/igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-sram-bb-sram-target-sram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_eud=
ebug_online@writes-caching-sram-bb-sram-target-sram.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
57v11/shard-dg2-434/igt@xe_eudebug_online@writes-caching-sram-bb-sram-targe=
t-sram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4208">Intel XE#4208</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2=
-434/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exe=
c_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg=
2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#=
288</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48957v11/shard-dg2-434/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-r=
ebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exe=
c_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/sha=
rd-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">In=
tel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-43=
6/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) =
+6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_exe=
c_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148957v11/shard-dg2-434/igt@xe_exec_system_allocator@threads=
-many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
116 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-malloc-multi-fault:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-malloc-multi-fault.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148957v11/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm=
-many-malloc-multi-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +110 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_huc_copy@h=
uc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_oa@=
invalid-create-userspace-config.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434=
/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_oa@=
missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_oa@m=
issing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_pm@=
d3cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-432/igt@xe_pm@d3cold-i2c.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/5694">Intel XE#5694</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_pm@d3col=
d-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_pmu=
@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-43=
4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pxp@display-pxp-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_pxp=
@display-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@xe_pxp@displ=
ay-pxp-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-432/igt@xe_pxp=
@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434/ig=
t@xe_pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_que=
ry@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-436/igt@x=
e_query@multigpu-query-hwconfig.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-463/igt@xe_ren=
der_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148957v11/shard-dg2-434=
/igt@xe_render_copy@render-stress-2-copies.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de/shard-dg2-434/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148957v11/shard-dg2-436/igt@xe_sriov_auto_provisioning@selfconfig-reprovi=
sion-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de -&gt; xe-pw-148=
957v11</li>
</ul>
<p>IGT_8512: 8512<br />
  xe-3627-cd296b3d40e69455e98897bc2883d3f7ffe893de: cd296b3d40e69455e98897b=
c2883d3f7ffe893de<br />
  xe-pw-148957v11: 148957v11</p>

</body>
</html>

--===============1272855620528420312==--
