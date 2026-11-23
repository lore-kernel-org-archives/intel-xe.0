Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B4C606A335
	for <intel-xe@archiver.kernel.org>; Mon, 23 Nov 2026 09:22:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C2310EB64;
	Mon, 23 Nov 2026 09:22:06 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3292010EB61;
 Mon, 23 Nov 2026 09:22:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3009310730273537823=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Extend_CPER_records_with_R?=
 =?utf-8?q?AS_info_queue_data_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 23 Nov 2026 09:22:05 -0000
Message-ID: <179542572519.68538.17387302533731606437@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261122144838.214706-5-badal.nilawar@intel.com>
In-Reply-To: <20261122144838.214706-5-badal.nilawar@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3009310730273537823==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Extend CPER records with RAS info queue data (rev6)
URL   : https://patchwork.freedesktop.org/series/178015/
State : success

== Summary ==

CI Bug Log - changes from xe-6208-579369fbe7227f6b00acc883ac90606a5266932a_FULL -> xe-pw-178015v6_FULL
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

  Here are the changes found in xe-pw-178015v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#5808])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5822])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][4] ([Intel XE#7084] / [Intel XE#8150])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2652]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5824])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#2252])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][8] ([Intel XE#3304])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][10] ([Intel XE#6707] / [Intel XE#7439])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#5962])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#9539])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7178])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#5800] / [Intel XE#6312])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][15] ([Intel XE#7061])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#6312])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5812]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#7865]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][19] -> [SKIP][20] ([Intel XE#1503])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][21] -> [FAIL][22] ([Intel XE#8618])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-7/igt@kms_setmode@basic.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-c-dp-2-pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][23] ([Intel XE#8618])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_setmode@basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#8608])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5764])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_exec_balancer@twice-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#7482])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_balancer@twice-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5575] / [Intel XE#7484])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#8374]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#8364]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
    - shard-ptl:          [PASS][30] -> [DMESG-WARN][31] ([Intel XE#8652])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-ptl-6/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#8378])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [PASS][33] -> [ABORT][34] ([Intel XE#9463])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-10/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_pat@xa-app-transient-media-on:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#7590])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_pat@xa-app-transient-media-on.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#6867])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_pm_residency@cpg-basic.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#6019])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_wedged@basic-wedged:
    - shard-ptl:          NOTRUN -> [DMESG-WARN][38] ([Intel XE#8963])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:
    - shard-bmg:          [INCOMPLETE][39] ([Intel XE#7084] / [Intel XE#8150]) -> [PASS][40]
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [ABORT][41] ([Intel XE#9362]) -> [PASS][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-ptl-7/igt@xe_pm@s4-vm-bind-userptr.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][43] ([Intel XE#3544]) -> [SKIP][44] ([Intel XE#3374] / [Intel XE#3544])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][45] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][46] ([Intel XE#1729] / [Intel XE#7424])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][47] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][48] ([Intel XE#2509] / [Intel XE#7437])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9539]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539


Build changes
-------------

  * Linux: xe-6208-579369fbe7227f6b00acc883ac90606a5266932a -> xe-pw-178015v6

  IGT_9201: 9201
  xe-6208-579369fbe7227f6b00acc883ac90606a5266932a: 579369fbe7227f6b00acc883ac90606a5266932a
  xe-pw-178015v6: 178015v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/index.html

--===============3009310730273537823==
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
<tr><td><b>Series:</b></td><td>Extend CPER records with RAS info queue data (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178015/">https://patchwork.freedesktop.org/series/178015/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6208-579369fbe7227f6b00acc883ac90606a5266932a_FULL -&gt; xe-pw-178015v6_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178015v6_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_dp_link_training@non-uhbr-sst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9539">Intel XE#9539</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-4/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-7/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-c-dp-2-pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-10/igt@kms_setmode@basic@pipe-c-dp-2-pipe-a-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_balancer@twice-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_fault_mode@twice-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-ptl-6/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-5/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-10/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-6/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-on:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_pat@xa-app-transient-media-on.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_pm_residency@cpg-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-ptl-7/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-ptl-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6208-579369fbe7227f6b00acc883ac90606a5266932a/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178015v6/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6208-579369fbe7227f6b00acc883ac90606a5266932a -&gt; xe-pw-178015v6</li>
</ul>
<p>IGT_9201: 9201<br />
  xe-6208-579369fbe7227f6b00acc883ac90606a5266932a: 579369fbe7227f6b00acc883ac90606a5266932a<br />
  xe-pw-178015v6: 178015v6</p>

</body>
</html>

--===============3009310730273537823==--
