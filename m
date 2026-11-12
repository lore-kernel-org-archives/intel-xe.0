Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A7AC606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 17:50:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F17510E496;
	Thu, 12 Nov 2026 17:50:47 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34CCB10E496;
 Thu, 12 Nov 2026 17:50:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4551126482399504574=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/psr=3A_Check_the_?=
 =?utf-8?q?transcoder_for_eDP_Panel_Replay?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mika Kahola" <mika.kahola@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Nov 2026 17:50:46 -0000
Message-ID: <179450584620.17056.16124816663028381171@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261112110345.571870-1-mika.kahola@intel.com>
In-Reply-To: <20261112110345.571870-1-mika.kahola@intel.com>
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

--===============4551126482399504574==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Check the transcoder for eDP Panel Replay
URL   : https://patchwork.freedesktop.org/series/178390/
State : success

== Summary ==

CI Bug Log - changes from xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce_FULL -> xe-pw-178390v1_FULL
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

  Here are the changes found in xe-pw-178390v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunbind-rebind-with-load:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind-with-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind-with-load.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#1231] / [Intel XE#8628])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#367])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2652]) +20 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#7358])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7358]) +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304] / [Intel XE#7374])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_content_protection@legacy.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#8680])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_fbcon_fbt@psr.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][18] -> [FAIL][19] ([Intel XE#301]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#7178] / [Intel XE#7351])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7178] / [Intel XE#7349])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#6312] / [Intel XE#651])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7061])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4141]) +3 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7061] / [Intel XE#7356]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +10 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7905])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2313]) +10 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][29] -> [SKIP][30] ([Intel XE#1503])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7283]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8854])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#1489])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2413])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_vrr@cmrr-desktop-mode:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#9271])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_vrr@cmrr-desktop-mode.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][38] ([Intel XE#8868])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-4/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8374])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#8364])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8364]) +4 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html

  * igt@xe_exec_threads@threads-multi-queue-hang-basic:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#8378]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#8378])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#7590])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-4/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-lnl:          [PASS][47] -> [ABORT][48] ([Intel XE#9362]) +1 other test abort
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [PASS][49] -> [ABORT][50] ([Intel XE#9362])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-ptl-6/igt@xe_pm@s4-mocs.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-ptl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#9461]) +1 other test fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-6/igt@xe_pmu@engine-activity-accuracy-90.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][53] ([Intel XE#9365])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_survivability@runtime-survivability.html

  * igt@xe_wedged@cold-reset-wedged:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#9747])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_wedged@cold-reset-wedged.html

  
#### Possible fixes ####

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][55] ([Intel XE#9365]) -> [PASS][56] +1 other test pass
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [FAIL][57] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][58] +1 other test pass
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-ptl-8/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:
    - shard-bmg:          [ABORT][59] ([Intel XE#9463]) -> [PASS][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [DMESG-WARN][61] ([Intel XE#7727]) -> [PASS][62]
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [DMESG-WARN][63] ([Intel XE#7727]) -> [PASS][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-ptl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-ptl-7/igt@xe_pm@s4-vm-bind-userptr.html
    - shard-lnl:          [ABORT][65] ([Intel XE#9362]) -> [PASS][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][67] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][68] ([Intel XE#1729] / [Intel XE#7424])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8628]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747


Build changes
-------------

  * Linux: xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce -> xe-pw-178390v1

  IGT_9187: 9187
  xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce: 020bf044c3c299e9b0961753bf5f8b92c3b505ce
  xe-pw-178390v1: 178390v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/index.html

--===============4551126482399504574==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Check the transcoder for eDP Panel Replay</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178390/">https://patchwork.freedesktop.org/series/178390/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce_FULL -&gt; xe-pw-178390v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178390v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-8/igt@core_hotunplug@hotunbind-rebind-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8628">Intel XE#8628</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_bw@linear-tiling-2-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-9/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_fbcon_fbt@psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcpsrhdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-9/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_pm_dc@dc5-psr-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8854">Intel XE#8854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr-desktop-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@kms_vrr@cmrr-desktop-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-4/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_fault_mode@many-execqueues-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-priority:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_multi_queue@two-queues-preempt-mode-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-hang-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-hang-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-4/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328">Intel XE#7328</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-ptl-6/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-ptl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-6/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@cold-reset-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_wedged@cold-reset-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747">Intel XE#9747</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-8/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-ptl-3/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-ptl-8/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-guc_wait_ucode.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-7/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-ptl-5/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-ptl-7/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-lnl-8/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_tiled_display@basic-test-pattern:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178390v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce -&gt; xe-pw-178390v1</li>
</ul>
<p>IGT_9187: 9187<br />
  xe-6121-020bf044c3c299e9b0961753bf5f8b92c3b505ce: 020bf044c3c299e9b0961753bf5f8b92c3b505ce<br />
  xe-pw-178390v1: 178390v1</p>

</body>
</html>

--===============4551126482399504574==--
