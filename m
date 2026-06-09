Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE466CD8CAD
	for <intel-xe@archiver.kernel.org>; Tue,  9 Jun 2026 23:10:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 571A010E48C;
	Tue,  9 Jun 2026 23:10:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEC5210E3CA;
 Tue,  9 Jun 2026 23:10:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7693947178646178407=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/display=3A_harden?=
 =?utf-8?q?_some_bit-shifting_operations_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Jun 2026 23:10:21 -0000
Message-ID: <178104662190.62501.3277220077753081430@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260609095525.570614-1-luciano.coelho@intel.com>
In-Reply-To: <20260609095525.570614-1-luciano.coelho@intel.com>
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

--===============7693947178646178407==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: harden some bit-shifting operations (rev6)
URL   : https://patchwork.freedesktop.org/series/166864/
State : success

== Summary ==

CI Bug Log - changes from xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c_FULL -> xe-pw-166864v6_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166864v6_FULL:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_pm_dc@dc5-pageflip-negative}:
    - shard-bmg:          NOTRUN -> [SKIP][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html

  
Known issues
------------

  Here are the changes found in xe-pw-166864v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][2] ([Intel XE#1124])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#1124]) +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2887]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2252]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#373])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#2321] / [Intel XE#7355])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2321] / [Intel XE#7355])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_dirtyfb@fbc-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#4210] / [Intel XE#7467])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#1421])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#6312]) +2 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#4141]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7905]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2311]) +8 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#7865]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2313]) +7 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7399])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#7399])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][21] -> [SKIP][22] ([Intel XE#7915]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7283]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7283])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#4596] / [Intel XE#5854])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2893] / [Intel XE#7304])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1489])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@pr-sprite-render:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2234] / [Intel XE#2850])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-6/igt@kms_psr@pr-sprite-render.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1406])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-1/igt@kms_psr@pr-sprite-render.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][30] -> [FAIL][31] ([Intel XE#6361]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-6/igt@kms_setmode@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@kms_setmode@basic.html

  * igt@xe_exec_balancer@no-exec-virtual-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7482])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@xe_exec_balancer@no-exec-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2322] / [Intel XE#7372])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1392])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7136])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#6874])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-dyn-priority:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#6874]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-dyn-priority.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7866])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#6964])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:
    - shard-bmg:          [PASS][40] -> [FAIL][41] ([Intel XE#7992]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [PASS][42] -> [DMESG-WARN][43] ([Intel XE#6627] / [Intel XE#7419])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@xe_survivability@runtime-survivability.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][44] ([Intel XE#301]) -> [PASS][45] +2 other tests pass
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][46] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][48] ([Intel XE#7308]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][50] ([Intel XE#7915]) -> [PASS][51] +3 other tests pass
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][52] ([Intel XE#7340]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][54] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@kms_vrr@flip-basic.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-5/igt@kms_vrr@flip-basic.html

  * igt@xe_exec_reset@long-spin-many-preempt-threads:
    - shard-bmg:          [FAIL][56] ([Intel XE#7956]) -> [PASS][57]
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-threads.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-threads.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-bmg:          [FAIL][58] -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [FAIL][60] ([Intel XE#6569]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
    - shard-bmg:          [FAIL][62] ([Intel XE#7992]) -> [PASS][63] +24 other tests pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [ABORT][64] ([Intel XE#8007]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][66] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][67] ([Intel XE#309] / [Intel XE#7343])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][68] ([Intel XE#7571]) -> [FAIL][69] ([Intel XE#7809])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#7992]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007


Build changes
-------------

  * IGT: IGT_8954 -> IGT_8955
  * Linux: xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c -> xe-pw-166864v6

  IGT_8954: 8954
  IGT_8955: 8955
  xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c: e591d473e392997b89c9ab9598bfe027c59ac21c
  xe-pw-166864v6: 166864v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/index.html

--===============7693947178646178407==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: harden some bit-shifting operations (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166864/">https://patchwork.freedesktop.org/series/166864/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c_FULL -&gt; xe-pw-166864v6_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166864v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@kms_pm_dc@dc5-pageflip-negative}:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@kms_pm_dc@dc5-pageflip-negative.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166864v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-8/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-4/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@fbc-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@kms_dirtyfb@fbc-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4210">Intel XE#4210</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7467">Intel XE#7467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrshdr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-6/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-6/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-6/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-1/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-6/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@xe_exec_balancer@no-exec-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-dyn-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@xe_exec_multi_queue@two-queues-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-7/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-3/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling@numvfs-random.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@kms_hdr@invalid-metadata-sizes@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7340">Intel XE#7340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-5/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-8/igt@xe_exec_reset@long-spin-many-preempt-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-10/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-1/igt@xe_sriov_flr@flr-twice.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-4/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7992">Intel XE#7992</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-5/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">PASS</a> +24 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-4/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166864v6/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8954 -&gt; IGT_8955</li>
<li>Linux: xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c -&gt; xe-pw-166864v6</li>
</ul>
<p>IGT_8954: 8954<br />
  IGT_8955: 8955<br />
  xe-5224-e591d473e392997b89c9ab9598bfe027c59ac21c: e591d473e392997b89c9ab9598bfe027c59ac21c<br />
  xe-pw-166864v6: 166864v6</p>

</body>
</html>

--===============7693947178646178407==--
