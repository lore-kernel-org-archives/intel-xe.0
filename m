Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A93E606A31A
	for <intel-xe@archiver.kernel.org>; Sat, 24 Oct 2026 10:26:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9E5810E7D3;
	Sat, 24 Oct 2026 10:26:06 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B992E10E4CB;
 Sat, 24 Oct 2026 10:26:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8359669282829638831=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm=3A_handle_IRQ=5FHPD_ev?=
 =?utf-8?q?ents_correctly_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 24 Oct 2026 10:26:05 -0000
Message-ID: <179283756575.64996.6834027891580123920@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
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

--===============8359669282829638831==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: handle IRQ_HPD events correctly (rev9)
URL   : https://patchwork.freedesktop.org/series/164955/
State : failure

== Summary ==

CI Bug Log - changes from xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13_FULL -> xe-pw-164955v9_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-164955v9_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-164955v9_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-164955v9_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_spin_batch@spin-fixed-duration:
    - shard-ptl:          NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_spin_batch@spin-fixed-duration.html

  
Known issues
------------

  Here are the changes found in xe-pw-164955v9_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          [PASS][2] -> [FAIL][3] ([Intel XE#3718] / [Intel XE#6078]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          [PASS][4] -> [FAIL][5] ([Intel XE#6078])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5901]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5808])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          [PASS][8] -> [SKIP][9] ([Intel XE#367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][10] -> [INCOMPLETE][11] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5822])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#5824])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#3304]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5900])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][17] -> [FAIL][18] ([Intel XE#301])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-ptl:          [PASS][19] -> [FAIL][20] ([Intel XE#3321]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7179])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#5800] / [Intel XE#6312])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#5812]) +8 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#7061])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#6312])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2313])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#7865]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html

  * igt@kms_pm_dc@dc3co-framedrop-check:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_pm_dc@dc3co-framedrop-check.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#8396]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1489])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#8618]) +2 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [PASS][36] -> [FAIL][37] ([Intel XE#4227] / [Intel XE#7397]) +3 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-8/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-threads-small-multi-queue:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#5764])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_evict@evict-mixed-threads-small-multi-queue.html

  * igt@xe_exec_balancer@many-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#7482]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_exec_balancer@many-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5575] / [Intel XE#7484])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#8374])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#8364])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_reset@gt-stress-reset-bo-invalidation:
    - shard-ptl:          [PASS][43] -> [DMESG-WARN][44] ([Intel XE#8652])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-3/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html

  * igt@xe_exec_reset@multi-queue-close-execqueues:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#8369])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#8378]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [PASS][47] -> [ABORT][48] ([Intel XE#9463]) +1 other test abort
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#6964])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_pm@s3-basic-exec:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#6867]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [PASS][51] -> [ABORT][52] ([Intel XE#9362]) +1 other test abort
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-4/igt@xe_pm@s4-basic.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-8/igt@xe_pm@s4-basic.html

  * igt@xe_vm@out-of-memory:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#5745] / [Intel XE#7892])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_vm@out-of-memory.html

  * igt@xe_vm@overcommit-fault-vram-lr:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#9597])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_vm@overcommit-fault-vram-lr.html

  
#### Possible fixes ####

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][55] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][56]
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [FAIL][57] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][58] +2 other tests pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][59] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][61] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][62] ([Intel XE#3544])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][63] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][64] ([Intel XE#2509] / [Intel XE#7437])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [ABORT][65] ([Intel XE#9362]) -> [DMESG-WARN][66] ([Intel XE#7727])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-7/igt@xe_pm@s4-mocs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_pm@s4-mocs.html

  
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * Linux: xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13 -> xe-pw-164955v9

  IGT_9163: 9163
  xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13: fffd1cafe03b3586c3353988d8c721525753fc13
  xe-pw-164955v9: 164955v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/index.html

--===============8359669282829638831==
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
<tr><td><b>Series:</b></td><td>drm: handle IRQ_HPD events correctly (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164955/">https://patchwork.freedesktop.org/series/164955/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13_FULL -&gt; xe-pw-164955v9_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-164955v9_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-164955v9_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-164955v9_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_spin_batch@spin-fixed-duration:<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_spin_batch@spin-fixed-duration.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-164955v9_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-8/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_pm_dc@dc3co-framedrop-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-2/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-8/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-queue:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_evict@evict-mixed-threads-small-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_exec_balancer@many-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_multi_queue@many-queues-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-bo-invalidation:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-3/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-2/igt@xe_exec_reset@gt-stress-reset-bo-invalidation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-execqueues:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_reset@multi-queue-close-execqueues.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867">Intel XE#6867</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-8/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-5/igt@xe_vm@out-of-memory.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">Intel XE#5745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_vm@overcommit-fault-vram-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-1/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13/shard-ptl-7/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164955v9/shard-ptl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13 -&gt; xe-pw-164955v9</li>
</ul>
<p>IGT_9163: 9163<br />
  xe-6007-fffd1cafe03b3586c3353988d8c721525753fc13: fffd1cafe03b3586c3353988d8c721525753fc13<br />
  xe-pw-164955v9: 164955v9</p>

</body>
</html>

--===============8359669282829638831==--
