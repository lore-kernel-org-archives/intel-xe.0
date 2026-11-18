Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA755606A320
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 16:11:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C32910FE4E;
	Wed, 18 Nov 2026 16:11:40 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D16C10FE20;
 Wed, 18 Nov 2026 16:11:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9124395096929004943=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/panel=3A_Restrict?=
 =?utf-8?q?_highest_mode_to_DRRS-compatible_modes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Fred Gao" <fred.gao@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 16:11:39 -0000
Message-ID: <179501829924.45139.10483546270304557332@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118014949.399026-1-fred.gao@intel.com>
In-Reply-To: <20261118014949.399026-1-fred.gao@intel.com>
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

--===============9124395096929004943==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/panel: Restrict highest mode to DRRS-compatible modes
URL   : https://patchwork.freedesktop.org/series/178838/
State : success

== Summary ==

CI Bug Log - changes from xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9_FULL -> xe-pw-178838v1_FULL
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

  Here are the changes found in xe-pw-178838v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@device_reset@unbind-reset-rebind:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html

  * igt@intel_hwmon@hwmon-write:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#7225])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@intel_hwmon@hwmon-write.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][4] ([Intel XE#7085])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5808]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5822]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5823] / [Intel XE#6918]) +4 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2887])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#7358])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#6969]) +7 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3304])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#7642])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#6707] / [Intel XE#7439])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#5846])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][17] ([Intel XE#5962]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [PASS][18] -> [FAIL][19] ([Intel XE#7809])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#4302])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#2375])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#2316]) +1 other test skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          [PASS][23] -> [FAIL][24] ([Intel XE#5408] / [Intel XE#6266])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#5408] / [Intel XE#6266])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#7178])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#5800] / [Intel XE#6312]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5812]) +19 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7061] / [Intel XE#7356])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#6312]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][33] ([Intel XE#7399])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#7865]) +5 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2313]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#7061] / [Intel XE#7356])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#7061])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7283])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane@pixel-format-yf-tiled-modifier:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#7283])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#5858]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#1406])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5910]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#5848])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#1499] / [Intel XE#9271])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [PASS][46] -> [FAIL][47] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_err_injection@inject_core_compute_uncorr_error:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#9769])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_err_injection@inject_core_compute_uncorr_error.html

  * igt@xe_evict@evict-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5764]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_evict@evict-threads-small-multi-vm.html

  * igt@xe_exec_balancer@many-virtual-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#7482]) +4 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_balancer@many-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5575] / [Intel XE#7484]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-multi-queue:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#8374]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_fault_mode@once-multi-queue.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#8364]) +6 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#8364]) +1 other test skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:
    - shard-ptl:          NOTRUN -> [SKIP][56] ([Intel XE#8378]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic.html

  * igt@xe_multigpu_svm@mgpu-migration-basic:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#6964])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_multigpu_svm@mgpu-migration-basic.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7793])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pat@pat-sw-hw-reset-compare:
    - shard-ptl:          NOTRUN -> [FAIL][59] ([Intel XE#7695])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_pat@pat-sw-hw-reset-compare.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#5834])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [PASS][61] -> [ABORT][62] ([Intel XE#9362])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [PASS][63] -> [ABORT][64] ([Intel XE#9362])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-10/igt@xe_pm@s4-vm-bind-unbind-all.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4733] / [Intel XE#7417])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-config:
    - shard-ptl:          NOTRUN -> [SKIP][66] ([Intel XE#6019]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_query@multigpu-query-config.html

  * igt@xe_vm@overcommit-nonfault-vram-no-lr:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#9597])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-no-lr.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][68] ([Intel XE#301]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-ptl:          [FAIL][70] -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [ABORT][72] ([Intel XE#9362]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][74] ([Intel XE#3544]) -> [SKIP][75] ([Intel XE#3374] / [Intel XE#3544])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][76] -> [DMESG-WARN][77] ([Intel XE#9365])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-2/igt@xe_survivability@runtime-survivability.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5834]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5834
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
  [Intel XE#9769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769


Build changes
-------------

  * Linux: xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9 -> xe-pw-178838v1

  IGT_9196: 9196
  xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9: 6faeea4d5058d20e3a6e7edba8c13e4918636cd9
  xe-pw-178838v1: 178838v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/index.html

--===============9124395096929004943==
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
<tr><td><b>Series:</b></td><td>drm/i915/panel: Restrict highest mode to DRRS-compatible modes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178838/">https://patchwork.freedesktop.org/series/178838/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9_FULL -&gt; xe-pw-178838v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178838v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@device_reset@unbind-reset-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-6/igt@device_reset@unbind-reset-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-2/igt@device_reset@unbind-reset-rebind.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7225">Intel XE#7225</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs@pipe-d-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-6/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375">Intel XE#2375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbchdr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-modifier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_plane@pixel-format-yf-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5910">Intel XE#5910</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_err_injection@inject_core_compute_uncorr_error:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_err_injection@inject_core_compute_uncorr_error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_evict@evict-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_balancer@many-virtual-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_fault_mode@once-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_multi_queue@one-queue-preempt-mode-dyn-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_multigpu_svm@mgpu-migration-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-reset-compare:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_pat@pat-sw-hw-reset-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5834">Intel XE#5834</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-1/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-10/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-3/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-no-lr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_vm@overcommit-nonfault-vram-no-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-8/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-ptl-8/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9/shard-bmg-2/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178838v1/shard-bmg-8/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9 -&gt; xe-pw-178838v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6165-6faeea4d5058d20e3a6e7edba8c13e4918636cd9: 6faeea4d5058d20e3a6e7edba8c13e4918636cd9<br />
  xe-pw-178838v1: 178838v1</p>

</body>
</html>

--===============9124395096929004943==--
