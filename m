Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73471C5B572
	for <intel-xe@archiver.kernel.org>; Thu, 13 Aug 2026 15:58:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E67310E51A;
	Thu, 13 Aug 2026 15:58:59 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878A510E51A;
 Thu, 13 Aug 2026 15:58:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8475177284211673024=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Capture_addition?=
 =?utf-8?q?al_HW_register_state_in_devcoredump?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nareshkumar Gollakoti" <naresh.kumar.g@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 13 Aug 2026 15:58:57 -0000
Message-ID: <178663673754.48933.16509502227926795777@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
In-Reply-To: <20260813133037.2912699-1-naresh.kumar.g@intel.com>
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

--===============8475177284211673024==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Capture additional HW register state in devcoredump
URL   : https://patchwork.freedesktop.org/series/172150/
State : failure

== Summary ==

CI Bug Log - changes from xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a_FULL -> xe-pw-172150v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-172150v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-172150v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-172150v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_capture@reset:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-lnl-4/igt@xe_exec_capture@reset.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-lnl-4/igt@xe_exec_capture@reset.html
    - shard-bmg:          [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-10/igt@xe_exec_capture@reset.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-8/igt@xe_exec_capture@reset.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][5] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html

  
Known issues
------------

  Here are the changes found in xe-pw-172150v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][7] -> [INCOMPLETE][8] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#301]) +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][11] -> [INCOMPLETE][12] ([Intel XE#6321] / [Intel XE#8355])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:
    - shard-bmg:          [PASS][13] -> [SKIP][14] ([Intel XE#8589]) +99 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html

  * igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:
    - shard-bmg:          [PASS][15] -> [DMESG-FAIL][16] ([Intel XE#6652] / [Intel XE#7774])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:
    - shard-bmg:          [PASS][17] -> [FAIL][18] ([Intel XE#8555]) +1 other test fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-6/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html

  
#### Possible fixes ####

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][19] ([Intel XE#1503]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-bmg:          [SKIP][21] ([Intel XE#1124]) -> [SKIP][22] ([Intel XE#8589])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][23] ([Intel XE#7679]) -> [SKIP][24] ([Intel XE#8589])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][25] ([Intel XE#2887]) -> [SKIP][26] ([Intel XE#8589]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][27] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][28] ([Intel XE#8589])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-bmg:          [SKIP][29] ([Intel XE#2252]) -> [SKIP][30] ([Intel XE#8589])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-bmg:          [FAIL][31] ([Intel XE#3304] / [Intel XE#7374]) -> [SKIP][32] ([Intel XE#8589])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][33] ([Intel XE#2320]) -> [SKIP][34] ([Intel XE#8589]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-bmg:          [SKIP][35] ([Intel XE#2375]) -> [SKIP][36] ([Intel XE#8589])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_feature_discovery@dp-mst.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][37] ([Intel XE#4141]) -> [SKIP][38] ([Intel XE#8589]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][39] ([Intel XE#2311]) -> [SKIP][40] ([Intel XE#8589]) +8 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][41] ([Intel XE#2313]) -> [SKIP][42] ([Intel XE#8589]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][43] ([Intel XE#6901]) -> [SKIP][44] ([Intel XE#8589])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          [SKIP][45] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][46] ([Intel XE#8589])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-bmg:          [SKIP][47] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][48] ([Intel XE#8589])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_psr@psr2-primary-blt.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          [SKIP][49] ([Intel XE#1499]) -> [SKIP][50] ([Intel XE#8589])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-vrr.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          [SKIP][51] ([Intel XE#8374]) -> [SKIP][52] ([Intel XE#8589])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][53] ([Intel XE#8364]) -> [SKIP][54] ([Intel XE#8589]) +2 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html

  * igt@xe_page_reclaim@boundary-split:
    - shard-bmg:          [SKIP][55] ([Intel XE#7793]) -> [SKIP][56] ([Intel XE#8589])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_page_reclaim@boundary-split.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_page_reclaim@boundary-split.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          [SKIP][57] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][58] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_peer2peer@write.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_peer2peer@write.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          [SKIP][59] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][60] ([Intel XE#8589]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][61] ([Intel XE#6627] / [Intel XE#7419]) -> [SKIP][62] ([Intel XE#8589])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_survivability@runtime-survivability.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7774]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8589]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589


Build changes
-------------

  * Linux: xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a -> xe-pw-172150v1

  IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a: c194081ec71ea95135c7f9ddbc7d02e9c8cad19a
  xe-pw-172150v1: 172150v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/index.html

--===============8475177284211673024==
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
<tr><td><b>Series:</b></td><td>drm/xe: Capture additional HW register state in devcoredump</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172150/">https://patchwork.freedesktop.org/series/172150/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a_FULL -&gt; xe-pw-172150v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-172150v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-172150v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-172150v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_exec_capture@reset:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-lnl-4/igt@xe_exec_capture@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-lnl-4/igt@xe_exec_capture@reset.html">FAIL</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-10/igt@xe_exec_capture@reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-8/igt@xe_exec_capture@reset.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_pm_rpm@modeset-lpsp-stress:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-172150v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-4/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-9/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-malloc-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +99 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_system_allocator@process-many-mmap-new-huge-nomemset.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7774">Intel XE#7774</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-6/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-2/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_render0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_hdr@invalid-hdr:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psrhdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@boundary-split:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_page_reclaim@boundary-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a/shard-bmg-9/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172150v1/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8589">Intel XE#8589</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a -&gt; xe-pw-172150v1</li>
</ul>
<p>IGT_9054: 3d819a8f511b2bcd844647bcf7e433b9407d058e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5589-c194081ec71ea95135c7f9ddbc7d02e9c8cad19a: c194081ec71ea95135c7f9ddbc7d02e9c8cad19a<br />
  xe-pw-172150v1: 172150v1</p>

</body>
</html>

--===============8475177284211673024==--
