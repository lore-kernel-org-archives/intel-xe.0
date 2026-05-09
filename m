Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F11E9CD3445
	for <intel-xe@archiver.kernel.org>; Sat,  9 May 2026 18:57:36 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6780010E0B6;
	Sat,  9 May 2026 18:57:36 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF86210E0B6;
 Sat,  9 May 2026 18:57:34 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8537711176353200903=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_casf_=26_scaler_refactorin?=
 =?utf-8?q?g?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 09 May 2026 18:57:34 -0000
Message-ID: <177835305496.54795.6545703214108486993@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260509164048.627399-1-michal.grzelak@intel.com>
In-Reply-To: <20260509164048.627399-1-michal.grzelak@intel.com>
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

--===============8537711176353200903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: casf & scaler refactoring
URL   : https://patchwork.freedesktop.org/series/166252/
State : failure

== Summary ==

CI Bug Log - changes from xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773_FULL -> xe-pw-166252v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166252v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166252v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166252v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  
#### Warnings ####

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority:
    - shard-lnl:          [SKIP][3] ([Intel XE#6874]) -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority.html

  
Known issues
------------

  Here are the changes found in xe-pw-166252v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#3432])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] ([Intel XE#6819]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][8] -> [FAIL][9] ([Intel XE#301]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@modeset-vs-vblank-race@a-edp1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#3098]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-1/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2311])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2313])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [PASS][14] -> [SKIP][15] ([Intel XE#7308])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7130]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#7340]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7136])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6874])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#6569]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html

  
#### Possible fixes ####

  * igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:
    - shard-bmg:          [FAIL][23] ([Intel XE#6841]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [DMESG-WARN][25] ([Intel XE#5354]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [SKIP][27] ([Intel XE#7915]) -> [PASS][28] +1 other test pass
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][29] ([Intel XE#6321]) -> [PASS][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - shard-bmg:          [DMESG-FAIL][31] -> [PASS][32]
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_balancer@no-exec-parallel-rebind.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_exec_balancer@no-exec-parallel-rebind.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:
    - shard-bmg:          [SKIP][33] ([Intel XE#6703]) -> [PASS][34] +109 other tests pass
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html

  * igt@xe_pmu@all-fn-engine-activity-load:
    - shard-bmg:          [FAIL][35] ([Intel XE#5937]) -> [PASS][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html

  * igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10:
    - shard-bmg:          [SKIP][37] -> [PASS][38]
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-4/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][39] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-4/igt@xe_survivability@runtime-survivability.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          [SKIP][41] ([Intel XE#6703]) -> [SKIP][42] ([Intel XE#1124]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][43] ([Intel XE#6703]) -> [SKIP][44] ([Intel XE#2887]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-bmg:          [SKIP][45] ([Intel XE#6703]) -> [SKIP][46] ([Intel XE#2325] / [Intel XE#7358])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_feature_discovery@display-4x:
    - shard-bmg:          [SKIP][47] ([Intel XE#6703]) -> [SKIP][48] ([Intel XE#1138] / [Intel XE#7344])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_feature_discovery@display-4x.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:
    - shard-bmg:          [SKIP][49] ([Intel XE#6703]) -> [SKIP][50] ([Intel XE#7179])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][51] ([Intel XE#6703]) -> [SKIP][52] ([Intel XE#2311]) +8 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][53] ([Intel XE#6703]) -> [SKIP][54] ([Intel XE#4141])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          [SKIP][55] ([Intel XE#6703]) -> [SKIP][56] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][57] ([Intel XE#6703]) -> [SKIP][58] ([Intel XE#7061]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][59] ([Intel XE#6703]) -> [SKIP][60] ([Intel XE#2313]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][61] ([Intel XE#6703]) -> [SKIP][62] ([Intel XE#6901])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][63] ([Intel XE#6703]) -> [SKIP][64] ([Intel XE#7283])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][65] ([Intel XE#6703]) -> [SKIP][66] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          [SKIP][67] ([Intel XE#6703]) -> [SKIP][68] ([Intel XE#1489])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][69] ([Intel XE#6703]) -> [SKIP][70] ([Intel XE#2387] / [Intel XE#7429])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr-primary-blt:
    - shard-bmg:          [SKIP][71] ([Intel XE#6703]) -> [SKIP][72] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_psr@psr-primary-blt.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_psr@psr-primary-blt.html

  * igt@xe_eudebug_online@interrupt-other:
    - shard-bmg:          [SKIP][73] ([Intel XE#6703]) -> [SKIP][74] ([Intel XE#7636]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_eudebug_online@interrupt-other.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][75] ([Intel XE#6703]) -> [SKIP][76] ([Intel XE#7140])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][77] ([Intel XE#6703]) -> [SKIP][78] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:
    - shard-bmg:          [SKIP][79] ([Intel XE#6703]) -> [SKIP][80] ([Intel XE#7136]) +2 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:
    - shard-bmg:          [SKIP][81] ([Intel XE#6703]) -> [SKIP][82] ([Intel XE#6874]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][83] ([Intel XE#6703]) -> [SKIP][84] ([Intel XE#7866])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:
    - shard-bmg:          [SKIP][85] ([Intel XE#6703]) -> [SKIP][86] ([Intel XE#7138])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354
  [Intel XE#5937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#6841]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7140]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836


Build changes
-------------

  * IGT: IGT_8901 -> IGT_8902
  * Linux: xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773 -> xe-pw-166252v1

  IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773: 11d2d2a0077bf9aef71906f0db84bdab357ac773
  xe-pw-166252v1: 166252v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/index.html

--===============8537711176353200903==
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
<tr><td><b>Series:</b></td><td>casf &amp; scaler refactoring</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166252/">https://patchwork.freedesktop.org/series/166252/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773_FULL -&gt; xe-pw-166252v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166252v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166252v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166252v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-1/igt@xe_exec_multi_queue@two-queues-preempt-mode-dyn-priority.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166252v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-1/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-1/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-5/igt@kms_flip@modeset-vs-vblank-race@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@kms_plane@pixel-format-4-tiled-bmg-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7130">Intel XE#7130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-lnl-7/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-3/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6841">Intel XE#6841</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-a-dp-2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5354">Intel XE#5354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-3/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-6/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_balancer@no-exec-parallel-rebind.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_exec_balancer@no-exec-parallel-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_exec_system_allocator@process-many-large-mmap-nomemset.html">PASS</a> +109 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@all-fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-1/igt@xe_pmu@all-fn-engine-activity-load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5937">Intel XE#5937</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_pmu@all-fn-engine-activity-load.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-4/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@xe_sriov_admin@exec-quantum-write-readback-vfs-disabled@pf-eq_ms-10.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-4/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-5/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yuv-linear-to-32bpp-yuv-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@kms_psr@psr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@interrupt-other:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_eudebug_online@interrupt-other.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7140">Intel XE#7140</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-10/igt@xe_exec_multi_queue@many-execs-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-9/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166252v1/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-mixed-fd-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8901 -&gt; IGT_8902</li>
<li>Linux: xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773 -&gt; xe-pw-166252v1</li>
</ul>
<p>IGT_8901: 0a391e6b79fd6c6c7a55f75ea4769f31529821c4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5034-11d2d2a0077bf9aef71906f0db84bdab357ac773: 11d2d2a0077bf9aef71906f0db84bdab357ac773<br />
  xe-pw-166252v1: 166252v1</p>

</body>
</html>

--===============8537711176353200903==--
