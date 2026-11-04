Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BE4606A333
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 01:29:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E23EC10E662;
	Wed,  4 Nov 2026 01:29:21 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196B610E4EF;
 Wed,  4 Nov 2026 01:29:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3990243268284659203=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_gpu/buddy=3A_restore_two-p?=
 =?utf-8?q?ass_clear/dirty_guard_for_range-biased_allocation?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arunpravin Paneer Selvam" <arunpravin.paneerselvam@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 04 Nov 2026 01:29:21 -0000
Message-ID: <179375576107.114209.5962625850701349972@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261103125617.2480786-1-arunpravin.paneerselvam@amd.com>
In-Reply-To: <20261103125617.2480786-1-arunpravin.paneerselvam@amd.com>
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

--===============3990243268284659203==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation
URL   : https://patchwork.freedesktop.org/series/177603/
State : success

== Summary ==

CI Bug Log - changes from xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17_FULL -> xe-pw-177603v1_FULL
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

  Here are the changes found in xe-pw-177603v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#5765])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#5808]) +3 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#7679])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [PASS][4] -> [SKIP][5] ([Intel XE#367])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5822]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_color@gamma:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5824])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#2252]) +1 other test skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][9] ([Intel XE#3304])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-ptl:          NOTRUN -> [SKIP][10] ([Intel XE#5900]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#4302])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5907])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html

  * igt@kms_feature_discovery@display-3x:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7448])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#2316]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][15] -> [FAIL][16] ([Intel XE#301]) +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][17] -> [ABORT][18] ([Intel XE#9362]) +1 other test abort
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#6312]) +3 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5800] / [Intel XE#6312]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#7865]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#7061]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#5812]) +20 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][24] ([Intel XE#7061] / [Intel XE#7356])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#7308])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#5917] / [Intel XE#6174])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_hdr@static-toggle.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#7283])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5849])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#7304]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#1406])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#5821]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic-no-cpu-idle:
    - shard-lnl:          [PASS][32] -> [FAIL][33] ([Intel XE#8618]) +1 other test fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-lnl-4/igt@kms_setmode@basic-no-cpu-idle.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-lnl-5/igt@kms_setmode@basic-no-cpu-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#5910])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [PASS][35] -> [FAIL][36] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-threads-small:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#5764]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_evict@evict-beng-mixed-threads-small.html

  * igt@xe_exec_balancer@twice-virtual-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#7482]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#8374]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#8364]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#8378]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [PASS][43] -> [ABORT][44] ([Intel XE#6652] / [Intel XE#9470])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_multigpu_svm@mgpu-coherency-basic:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#6964])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_multigpu_svm@mgpu-coherency-basic.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-ptl:          NOTRUN -> [SKIP][46] ([Intel XE#5777] / [Intel XE#7590])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-ptl:          [PASS][47] -> [ABORT][48] ([Intel XE#9362]) +1 other test abort
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-1/igt@xe_pm@s2idle-basic-exec.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-8/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#6019])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_query@multigpu-query-invalid-extension.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][50] ([Intel XE#367]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          [FAIL][52] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          [FAIL][54] ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-ptl:          [FAIL][56] ([Intel XE#7397]) -> [PASS][57] +1 other test pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [ABORT][58] ([Intel XE#9362]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [DMESG-WARN][60] ([Intel XE#7727]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][62] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][63] ([Intel XE#1729] / [Intel XE#7424])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][64] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][65] ([Intel XE#2509] / [Intel XE#7437])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5765]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765
  [Intel XE#5777]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470


Build changes
-------------

  * Linux: xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17 -> xe-pw-177603v1

  IGT_9176: 9176
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17
  xe-pw-177603v1: 177603v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/index.html

--===============3990243268284659203==
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
<tr><td><b>Series:</b></td><td>gpu/buddy: restore two-pass clear/dirty guard for range-biased allocation</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177603/">https://patchwork.freedesktop.org/series/177603/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17_FULL -&gt; xe-pw-177603v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177603v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5765">Intel XE#5765</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_bw@connected-linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-4/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917">Intel XE#5917</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_plane@pixel-format-yf-tiled-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5849">Intel XE#5849</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-no-cpu-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-lnl-4/igt@kms_setmode@basic-no-cpu-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-lnl-5/igt@kms_setmode@basic-no-cpu-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8618">Intel XE#8618</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-1/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-6/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_evict@evict-beng-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_balancer@twice-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9470">Intel XE#9470</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_multigpu_svm@mgpu-coherency-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5777">Intel XE#5777</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-1/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-8/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-2/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-2/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-8/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-1/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-4/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-2/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-ptl-5/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177603v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17 -&gt; xe-pw-177603v1</li>
</ul>
<p>IGT_9176: 9176<br />
  xe-6052-a3c3ff69be4e55d4f8f3d93789381ebb23684b17: a3c3ff69be4e55d4f8f3d93789381ebb23684b17<br />
  xe-pw-177603v1: 177603v1</p>

</body>
</html>

--===============3990243268284659203==--
