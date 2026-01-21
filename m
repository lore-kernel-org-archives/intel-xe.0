Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9F59C44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 23:12:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F4A110E8DE;
	Wed, 21 Jan 2026 23:12:15 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E4F10E8DD;
 Wed, 21 Jan 2026 23:12:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7540313077119577718=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/xe3p=3A_Disable_GuC?=
 =?utf-8?q?_Dynamic_ICS_for_Xe3p?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 23:12:14 -0000
Message-ID: <176903713459.180247.1141464979374819125@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121143732.523081-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260121143732.523081-2-balasubramani.vivekanandan@intel.com>
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

--===============7540313077119577718==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p
URL   : https://patchwork.freedesktop.org/series/160431/
State : success

== Summary ==

CI Bug Log - changes from xe-4428-dc0b90be8d513256a6594095731a702287f29602_FULL -> xe-pw-160431v1_FULL
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

  Here are the changes found in xe-pw-160431v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [PASS][5] -> [FAIL][6] ([Intel XE#5993]) +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_big_fb@linear-8bpp-rotate-180:
    - shard-lnl:          [PASS][7] -> [ABORT][8] ([Intel XE#4760])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-180.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2327])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2887]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#3432])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2325])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2252]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2320])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#5299]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2244])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#4156])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@basic-flip-vs-dpms@a-dp2:
    - shard-bmg:          [PASS][23] -> [DMESG-WARN][24] ([Intel XE#6766])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html

  * igt@kms_flip@basic-flip-vs-dpms@b-dp2:
    - shard-bmg:          [PASS][25] -> [ABORT][26] ([Intel XE#5545]) +1 other test abort
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@b-dp2.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@b-dp2.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2311]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#7063])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313]) +5 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7061])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#1503])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#6912])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2393])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#6693]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1406] / [Intel XE#1489])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr@fbc-psr-basic.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#4837])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6665])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@set-breakpoint:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#4837] / [Intel XE#6665])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html

  * igt@xe_exec_basic@multigpu-once-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2322]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6874]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-lnl:          [PASS][46] -> [DMESG-WARN][47] ([Intel XE#7023])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@many-64k-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6703]) +11 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4943]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#4733])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#944])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [PASS][54] -> [SKIP][55] ([Intel XE#6703]) +260 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][56] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][58] ([Intel XE#2142]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:
    - shard-bmg:          [ABORT][60] ([Intel XE#3970]) -> [PASS][61] +1 other test pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][62] ([Intel XE#6321]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][64] ([Intel XE#7024]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-1/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][66] ([Intel XE#1124]) -> [SKIP][67] ([Intel XE#6703]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][68] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][69] ([Intel XE#6703])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][70] ([Intel XE#2887]) -> [SKIP][71] ([Intel XE#6557] / [Intel XE#6703])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][72] ([Intel XE#2887]) -> [SKIP][73] ([Intel XE#6703]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          [SKIP][74] ([Intel XE#3432]) -> [SKIP][75] ([Intel XE#6703])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][76] ([Intel XE#2652] / [Intel XE#787]) -> [SKIP][77] ([Intel XE#6703])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-bmg:          [SKIP][78] ([Intel XE#2252]) -> [SKIP][79] ([Intel XE#6703]) +2 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_chamelium_audio@dp-audio.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-bmg:          [SKIP][80] ([Intel XE#2325]) -> [SKIP][81] ([Intel XE#6703]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-to-red.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-bmg:          [SKIP][82] ([Intel XE#2321]) -> [SKIP][83] ([Intel XE#6703])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-bmg:          [SKIP][84] ([Intel XE#2320]) -> [SKIP][85] ([Intel XE#6703]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][86] ([Intel XE#6715]) -> [FAIL][87] ([Intel XE#4633])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-bmg:          [SKIP][88] ([Intel XE#2244]) -> [SKIP][89] ([Intel XE#6703]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][90] ([Intel XE#776]) -> [SKIP][91] ([Intel XE#6703])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_fbcon_fbt@psr.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][92] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][93] ([Intel XE#6703]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][94] ([Intel XE#2311]) -> [SKIP][95] ([Intel XE#6703]) +11 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-bmg:          [SKIP][96] ([Intel XE#4141]) -> [SKIP][97] ([Intel XE#6703]) +7 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][98] ([Intel XE#7061]) -> [SKIP][99] ([Intel XE#6703])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][100] ([Intel XE#2352]) -> [SKIP][101] ([Intel XE#6703])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][102] ([Intel XE#2313]) -> [SKIP][103] ([Intel XE#6703]) +10 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][104] ([Intel XE#6911]) -> [SKIP][105] ([Intel XE#6703]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][106] ([Intel XE#2486]) -> [SKIP][107] ([Intel XE#6703])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_panel_fitting@legacy.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][108] ([Intel XE#5020]) -> [SKIP][109] ([Intel XE#6703])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_plane_multiple@tiling-y.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][110] ([Intel XE#870]) -> [SKIP][111] ([Intel XE#6703])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_pm_backlight@fade.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][112] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][113] ([Intel XE#1406] / [Intel XE#6703]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          [SKIP][114] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][115] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_psr@fbc-psr2-basic.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][116] ([Intel XE#1406] / [Intel XE#2414]) -> [SKIP][117] ([Intel XE#1406] / [Intel XE#6703])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][118] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][119] ([Intel XE#6703]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-bmg:          [SKIP][120] ([Intel XE#4837]) -> [SKIP][121] ([Intel XE#6703])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][122] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][123] ([Intel XE#6703]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_eudebug_online@single-step.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-bmg:          [SKIP][124] ([Intel XE#2322]) -> [SKIP][125] ([Intel XE#6703]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][126] ([Intel XE#6874]) -> [SKIP][127] ([Intel XE#6703]) +11 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:
    - shard-bmg:          [SKIP][128] ([Intel XE#4943]) -> [SKIP][129] ([Intel XE#6703]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-bmg:          [SKIP][130] ([Intel XE#4733]) -> [SKIP][131] ([Intel XE#6703])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          [SKIP][132] ([Intel XE#944]) -> [SKIP][133] ([Intel XE#6703]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6766]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4428-dc0b90be8d513256a6594095731a702287f29602 -> xe-pw-160431v1

  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4428-dc0b90be8d513256a6594095731a702287f29602: dc0b90be8d513256a6594095731a702287f29602
  xe-pw-160431v1: 160431v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/index.html

--===============7540313077119577718==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160431/">https://patchwork.freedesktop.org/series/160431/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4428-dc0b90be8d513256a6594095731a702287f29602_FULL -&gt; xe-pw-160431v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160431v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-1/igt@kms_big_fb@linear-8bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-2/igt@kms_big_fb@linear-8bpp-rotate-180.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_hpd@dp-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@a-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6766">Intel XE#6766</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-dpms@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_flip@basic-flip-vs-dpms@b-dp2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr@fbc-psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@set-breakpoint:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug_online@set-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_basic@multigpu-once-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-8/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-5/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">Intel XE#7023</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@many-64k-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +260 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_compute_preempt@compute-preempt-many-vram-evict@engine-drm_xe_engine_class_compute.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-lnl-8/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024">Intel XE#7024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_exec_system_allocator@many-execqueues-mmap-new-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4428-dc0b90be8d513256a6594095731a702287f29602/shard-bmg-9/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160431v1/shard-bmg-2/igt@xe_query@multigpu-query-pxp-status.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4428-dc0b90be8d513256a6594095731a702287f29602 -&gt; xe-pw-160431v1</li>
</ul>
<p>IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4428-dc0b90be8d513256a6594095731a702287f29602: dc0b90be8d513256a6594095731a702287f29602<br />
  xe-pw-160431v1: 160431v1</p>

</body>
</html>

--===============7540313077119577718==--
