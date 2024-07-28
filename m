Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CE1C3DA64
	for <intel-xe@archiver.kernel.org>; Sun, 28 Jul 2024 14:57:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE1BE10E1A2;
	Sun, 28 Jul 2024 14:57:58 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5633510E18F;
 Sun, 28 Jul 2024 14:57:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0108273554974839702=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_spi=3A_add_driver_for_Intel_dis?=
 =?utf-8?q?crete_graphics_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Alexander Usyskin" <alexander.usyskin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 28 Jul 2024 14:57:58 -0000
Message-ID: <172217867833.405068.4983900711759607813@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240728130638.1930463-1-alexander.usyskin@intel.com>
In-Reply-To: <20240728130638.1930463-1-alexander.usyskin@intel.com>
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

--===============0108273554974839702==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: spi: add driver for Intel discrete graphics (rev3)
URL   : https://patchwork.freedesktop.org/series/136430/
State : success

== Summary ==

CI Bug Log - changes from xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe_full -> xe-pw-136430v3_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-136430v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][1] ([Intel XE#1033]) +2 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [PASS][2] -> [FAIL][3] ([Intel XE#1701]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][4] -> [FAIL][5] ([Intel XE#1426]) +1 other test fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][6] -> [FAIL][7] ([Intel XE#1426]) +1 other test fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][8] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][10] ([Intel XE#1201] / [Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#787]) +11 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#1201] / [Intel XE#307])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1201] / [Intel XE#309])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@single-bo:
    - shard-adlp:         [PASS][16] -> [DMESG-WARN][17] ([Intel XE#877]) +1 other test dmesg-warn
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-2/igt@kms_cursor_legacy@single-bo.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-4/igt@kms_cursor_legacy@single-bo.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][19] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1874]) +2 other tests fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#656]) +9 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][25] -> [INCOMPLETE][26] ([Intel XE#2050])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][27] ([Intel XE#616])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole-dpms:
    - shard-lnl:          [PASS][28] -> [DMESG-WARN][29] ([Intel XE#324])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][30] -> [FAIL][31] ([Intel XE#361])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#836])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1122] / [Intel XE#1201])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#330])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#771] / [Intel XE#899])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][41] -> [FAIL][42] ([Intel XE#899]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][43] -> [TIMEOUT][44] ([Intel XE#1473] / [Intel XE#392])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-large-cm:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#261])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_evict@evict-large-cm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#1392]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race:
    - shard-adlp:         [PASS][48] -> [DMESG-WARN][49] ([Intel XE#2226])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-4/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@once-userptr-rebind-imm:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#288]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-adlp:         [PASS][51] -> [FAIL][52] ([Intel XE#2262])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][53] -> [ABORT][54] ([Intel XE#1794])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-6/igt@xe_pm@s4-mocs.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][55] -> [ABORT][56] ([Intel XE#1358] / [Intel XE#1794])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
    - shard-adlp:         [PASS][57] -> [ABORT][58] ([Intel XE#1358] / [Intel XE#1794])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@invalid-set-prop:
    - shard-adlp:         [DMESG-WARN][59] ([Intel XE#2226]) -> [PASS][60] +2 other tests pass
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-4/igt@kms_addfb_basic@invalid-set-prop.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_addfb_basic@invalid-set-prop.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][61] ([Intel XE#1659]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:
    - shard-adlp:         [FAIL][63] ([Intel XE#1874]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-436/igt@kms_hdr@invalid-hdr.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * {igt@kms_plane@plane-position-hole@pipe-a-plane-2}:
    - shard-lnl:          [DMESG-FAIL][67] ([Intel XE#324]) -> [PASS][68]
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html

  * {igt@kms_plane@plane-position-hole@pipe-b-plane-2}:
    - shard-lnl:          [DMESG-WARN][69] ([Intel XE#324]) -> [PASS][70] +2 other tests pass
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [FAIL][71] ([Intel XE#899]) -> [PASS][72] +1 other test pass
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [INCOMPLETE][73] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][75] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][76]
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][77] ([Intel XE#1069]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][79] ([Intel XE#958]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][81] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][82] ([Intel XE#623])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][83] ([Intel XE#316]) -> [SKIP][84] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][85] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][86] ([Intel XE#316]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][87] ([Intel XE#1231]) -> [DMESG-FAIL][88] ([Intel XE#324])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][89] ([Intel XE#324]) -> [FAIL][90] ([Intel XE#1231])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#1124]) -> [SKIP][92] ([Intel XE#1124] / [Intel XE#1201]) +8 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][94] ([Intel XE#1124]) +8 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html

  * igt@kms_big_joiner@basic:
    - shard-dg2-set2:     [SKIP][95] ([Intel XE#346]) -> [SKIP][96] ([Intel XE#1201] / [Intel XE#346])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_big_joiner@basic.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_big_joiner@basic.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#367]) -> [SKIP][98] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][99] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][100] ([Intel XE#367]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][101] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][102] ([Intel XE#1252]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     [SKIP][103] ([Intel XE#787]) -> [SKIP][104] ([Intel XE#1201] / [Intel XE#787]) +62 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][105] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][106] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][107] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][108] ([Intel XE#787]) +55 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][110] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][111] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][112] ([Intel XE#306]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#306]) -> [SKIP][114] ([Intel XE#1201] / [Intel XE#306])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_chamelium_color@degamma.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@hdmi-frame-dump:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#373]) -> [SKIP][116] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_chamelium_frames@hdmi-frame-dump.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][117] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][118] ([Intel XE#373]) +10 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][119] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][120] ([Intel XE#308]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#308]) -> [SKIP][122] ([Intel XE#1201] / [Intel XE#308])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-dg2-set2:     [SKIP][123] ([Intel XE#323]) -> [SKIP][124] ([Intel XE#1201] / [Intel XE#323])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][125] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][126] ([Intel XE#323]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#1201] / [i915#3804]) -> [SKIP][128] ([i915#3804])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][129] ([Intel XE#776]) -> [SKIP][130] ([Intel XE#1201] / [Intel XE#776])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_fbcon_fbt@psr.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][131] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][132] ([Intel XE#1138])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][133] ([Intel XE#1201] / [i915#5274]) -> [SKIP][134] ([i915#5274])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][135] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][136] ([Intel XE#651]) +27 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#651]) -> [SKIP][138] ([Intel XE#1201] / [Intel XE#651]) +21 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][140] ([Intel XE#653]) +29 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][141] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][142] ([Intel XE#658])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][143] ([Intel XE#653]) -> [SKIP][144] ([Intel XE#1201] / [Intel XE#653]) +21 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1201] / [Intel XE#356]) -> [SKIP][146] ([Intel XE#356])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#2318] / [Intel XE#455]) -> [SKIP][148] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][149] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][150] ([Intel XE#2318] / [Intel XE#455])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][152] ([Intel XE#2318]) +2 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#2318]) -> [SKIP][154] ([Intel XE#1201] / [Intel XE#2318]) +5 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][155] ([Intel XE#870]) -> [SKIP][156] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#908]) -> [SKIP][158] ([Intel XE#1201] / [Intel XE#908])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][159] ([Intel XE#1201] / [Intel XE#908]) -> [SKIP][160] ([Intel XE#908])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#1489]) -> [SKIP][162] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@overlay-plane-move-continuous-sf:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][164] ([Intel XE#1489]) +3 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][165] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][166] ([Intel XE#1122]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     [SKIP][167] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][168] ([Intel XE#929]) +11 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][169] ([Intel XE#929]) -> [SKIP][170] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_psr@psr-dpms.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#1149] / [Intel XE#1201]) -> [SKIP][172] ([Intel XE#1149])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][173] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][174] ([Intel XE#1127]) +1 other test skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#327]) -> [SKIP][176] ([Intel XE#1201] / [Intel XE#327])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][178] ([Intel XE#455]) +21 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_vrr@flip-dpms.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#455]) -> [SKIP][180] ([Intel XE#1201] / [Intel XE#455]) +13 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_vrr@flipline.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][182] ([Intel XE#756])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#756]) -> [SKIP][184] ([Intel XE#1201] / [Intel XE#756])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][186] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1123] / [Intel XE#1201]) -> [SKIP][188] ([Intel XE#1123]) +1 other test skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#944]) -> [SKIP][190] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][192] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@once-basic-imm:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#288]) -> [SKIP][194] ([Intel XE#1201] / [Intel XE#288]) +17 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][196] ([Intel XE#288]) +23 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][198] ([Intel XE#378])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@xe_module_load@force-load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#977]) -> [SKIP][200] ([Intel XE#1201] / [Intel XE#977])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_pat@pat-index-xe2.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][202] ([Intel XE#366])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_pm@d3cold-basic.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#366]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#366])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][206] ([Intel XE#944])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe -> xe-pw-136430v3

  IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe: e948842a6cba538c9f5f5dc8535a88d82a3fc0fe
  xe-pw-136430v3: 136430v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/index.html

--===============0108273554974839702==
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
<tr><td><b>Series:</b></td><td>spi: add driver for Intel discrete graphics (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136430/">https://patchwork.freedesktop.org/series/136430/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe_full -&gt; xe-pw-136430v3_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136430v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-1/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-bo:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-2/igt@kms_cursor_legacy@single-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-4/igt@kms_cursor_legacy@single-bo.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_evict@evict-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-4/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-rebind-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@xe_exec_fault_mode@once-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-4/igt@kms_addfb_basic@invalid-set-prop.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_addfb_basic@invalid-set-prop.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-y.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-436/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-a-plane-2}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-a-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole@pipe-b-plane-2}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@kms_plane@plane-position-hole@pipe-b-plane-2.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-436/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-lnl-2/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-lnl-5/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_big_joiner@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-frame-dump:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_chamelium_frames@hdmi-frame-dump.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_exec_fault_mode@once-basic-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-463/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe/shard-dg2-434/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136430v3/shard-dg2-432/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe -&gt; xe-pw-136430v3</li>
</ul>
<p>IGT_7940: 2a73158fa69a2b8e20d5a0bdf773ee194bfe13c2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1677-e948842a6cba538c9f5f5dc8535a88d82a3fc0fe: e948842a6cba538c9f5f5dc8535a88d82a3fc0fe<br />
  xe-pw-136430v3: 136430v3</p>

</body>
</html>

--===============0108273554974839702==--
