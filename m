Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4214EC44508
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 20:51:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F24B410E88A;
	Wed, 21 Jan 2026 20:51:19 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F2FE10E888;
 Wed, 21 Jan 2026 20:51:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5662113835791747598=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_dma-buf=3A_Use_revoke_mech?=
 =?utf-8?q?anism_to_invalidate_shared_buffers_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Leon Romanovsky" <leon@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Jan 2026 20:51:19 -0000
Message-ID: <176902867951.179549.9708935264712845171@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
In-Reply-To: <20260121-dmabuf-revoke-v4-0-d311cbc8633d@nvidia.com>
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

--===============5662113835791747598==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: dma-buf: Use revoke mechanism to invalidate shared buffers (rev2)
URL   : https://patchwork.freedesktop.org/series/160360/
State : failure

== Summary ==

CI Bug Log - changes from xe-4426-956025ffb8ada6041420e7df5f3311e139195474_FULL -> xe-pw-160360v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160360v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160360v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160360v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html

  
Known issues
------------

  Here are the changes found in xe-pw-160360v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#367])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2252]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][6] -> [FAIL][7] ([Intel XE#6715])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#1508])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#4422])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#4156])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#5545]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4141])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2311])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][15] -> [DMESG-WARN][16] ([Intel XE#7063])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr@fbc-pr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_psr@fbc-pr-primary-render.html

  * igt@kms_sharpness_filter@filter-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6503])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html

  * igt@kms_vblank@accuracy-idle:
    - shard-bmg:          [PASS][21] -> [INCOMPLETE][22] ([Intel XE#4488]) +1 other test incomplete
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-7/igt@kms_vblank@accuracy-idle.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-3/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#4459]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][25] -> [INCOMPLETE][26] ([Intel XE#6321])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2322]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#6874]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-bmg:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#7023])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@xe_exec_reset@gt-reset-stress.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-1/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:
    - shard-bmg:          [PASS][31] -> [SKIP][32] ([Intel XE#6703]) +107 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap:
    - shard-bmg:          [PASS][33] -> [DMESG-FAIL][34] ([Intel XE#5213] / [Intel XE#6652])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#4943]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#6557] / [Intel XE#6703]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#586])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_mmap@small-bar.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][39] -> [DMESG-WARN][40] ([Intel XE#7024])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-4/igt@xe_pm@s4-mocs.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear:
    - shard-lnl:          [FAIL][41] ([Intel XE#5993]) -> [PASS][42] +3 other tests pass
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html

  * igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:
    - shard-lnl:          [DMESG-WARN][43] ([Intel XE#7063]) -> [PASS][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          [SKIP][45] ([Intel XE#2327]) -> [SKIP][46] ([Intel XE#6703]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][47] ([Intel XE#1124]) -> [SKIP][48] ([Intel XE#6703]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-bmg:          [SKIP][49] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][50] ([Intel XE#6703])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][51] ([Intel XE#2887]) -> [SKIP][52] ([Intel XE#6703]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][53] ([Intel XE#2252]) -> [SKIP][54] ([Intel XE#6703]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][55] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][56] ([Intel XE#6703])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [FAIL][57] ([Intel XE#1178] / [Intel XE#3304]) -> [SKIP][58] ([Intel XE#6703])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_content_protection@legacy.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-bmg:          [SKIP][59] ([Intel XE#2321]) -> [SKIP][60] ([Intel XE#6703])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][61] ([Intel XE#4210]) -> [SKIP][62] ([Intel XE#6703])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][63] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][64] ([Intel XE#6703]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][65] ([Intel XE#2311]) -> [SKIP][66] ([Intel XE#6703]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:
    - shard-bmg:          [SKIP][67] ([Intel XE#4141]) -> [SKIP][68] ([Intel XE#6703]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][69] ([Intel XE#2313]) -> [SKIP][70] ([Intel XE#6703]) +4 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][71] ([Intel XE#3544]) -> [SKIP][72] ([Intel XE#3374] / [Intel XE#3544])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][73] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][74] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-primary-render:
    - shard-bmg:          [SKIP][75] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][76] ([Intel XE#1406] / [Intel XE#6703]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_psr@pr-primary-render.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_psr@pr-primary-render.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][77] ([Intel XE#2426]) -> [SKIP][78] ([Intel XE#2509])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          [SKIP][79] ([Intel XE#4837]) -> [SKIP][80] ([Intel XE#6703])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_eudebug@basic-vms.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:
    - shard-bmg:          [SKIP][81] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][82] ([Intel XE#6703])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-bmg:          [SKIP][83] ([Intel XE#2322]) -> [SKIP][84] ([Intel XE#6703])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:
    - shard-bmg:          [SKIP][85] ([Intel XE#6874]) -> [SKIP][86] ([Intel XE#6703]) +5 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html

  * igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:
    - shard-bmg:          [SKIP][87] ([Intel XE#4943]) -> [SKIP][88] ([Intel XE#6703]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-bmg:          [SKIP][89] ([Intel XE#944]) -> [SKIP][90] ([Intel XE#6703])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5213]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#5993]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7023]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023
  [Intel XE#7024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024
  [Intel XE#7063]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4426-956025ffb8ada6041420e7df5f3311e139195474 -> xe-pw-160360v2

  IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4426-956025ffb8ada6041420e7df5f3311e139195474: 956025ffb8ada6041420e7df5f3311e139195474
  xe-pw-160360v2: 160360v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/index.html

--===============5662113835791747598==
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
<tr><td><b>Series:</b></td><td>dma-buf: Use revoke mechanism to invalidate shared buffers (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160360/">https://patchwork.freedesktop.org/series/160360/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4426-956025ffb8ada6041420e7df5f3311e139195474_FULL -&gt; xe-pw-160360v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160360v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160360v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160360v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_setmaster@master-drop-set-user:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160360v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6715">Intel XE#6715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_psr@fbc-pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_sharpness_filter@filter-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-7/igt@kms_vblank@accuracy-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-3/igt@kms_vblank@accuracy-idle.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4488">Intel XE#4488</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-5/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@xe_exec_reset@gt-reset-stress.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-1/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7023">Intel XE#7023</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-execqueues-malloc-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-execqueues-mmap-remap-dontunmap.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5213">Intel XE#5213</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-madvise.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-4/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7024">Intel XE#7024</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5993">Intel XE#5993</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7063">Intel XE#7063</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-pri-indfb-multidraw.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@kms_psr@pr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_eudebug_online@writes-caching-vram-bb-sram-target-sram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4426-956025ffb8ada6041420e7df5f3311e139195474/shard-bmg-3/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160360v2/shard-bmg-2/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4426-956025ffb8ada6041420e7df5f3311e139195474 -&gt; xe-pw-160360v2</li>
</ul>
<p>IGT_8709: 16ce286cac6acc9669a1c758572ae9fceb483c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4426-956025ffb8ada6041420e7df5f3311e139195474: 956025ffb8ada6041420e7df5f3311e139195474<br />
  xe-pw-160360v2: 160360v2</p>

</body>
</html>

--===============5662113835791747598==--
