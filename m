Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAE57606A32C
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 03:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9B10E1F0;
	Thu, 19 Nov 2026 03:15:01 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 547A610E1F0;
 Thu, 19 Nov 2026 03:15:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3795200405252555860=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/psr=3A_Adjust_Xia?=
 =?utf-8?q?omi_Book_Pro_14_2026_psr2_disable_quirk?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Nov 2026 03:15:00 -0000
Message-ID: <179505810033.48157.12831586986008976952@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261118110220.77370-1-jouni.hogander@intel.com>
In-Reply-To: <20261118110220.77370-1-jouni.hogander@intel.com>
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

--===============3795200405252555860==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/psr: Adjust Xiaomi Book Pro 14 2026 psr2 disable quirk
URL   : https://patchwork.freedesktop.org/series/178884/
State : success

== Summary ==

CI Bug Log - changes from xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f_FULL -> xe-pw-178884v1_FULL
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

  Here are the changes found in xe-pw-178884v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][1] ([Intel XE#2327])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][2] ([Intel XE#1124]) +1 other test skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#367])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#367]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#2652]) +3 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887]) +4 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#7358]) +2 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2252])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#6969]) +7 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#7642])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#9536])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#7178] / [Intel XE#7351])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +13 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#4141]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#7061] / [Intel XE#7356])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#2313]) +17 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7061]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-ptl:          [PASS][22] -> [FAIL][23] ([Intel XE#9799]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7283])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#9779])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][26] -> [FAIL][27] ([Intel XE#2029] / [Intel XE#7395])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2499])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#1499] / [Intel XE#9271]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_vrr@flip-suspend.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8374]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#8364]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#8369])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_system_allocator@many-stride-new-prefetch:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][36] ([Intel XE#7098] / [Intel XE#8159])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#8378]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_page_reclaim@prl-max-entries:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7793])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_page_reclaim@prl-max-entries.html

  * igt@xe_pat@pat-sw-hw-compare:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#7695])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][40] -> [ABORT][41] ([Intel XE#9362])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-lnl-5/igt@xe_pm@s4-mocs.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-lnl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_pxp@pxp-optout:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4733] / [Intel XE#7417])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#944])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][44] ([Intel XE#367]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][46] ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][47] +1 other test pass
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][48] ([Intel XE#1503]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [ABORT][50] ([Intel XE#9463]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          [DMESG-WARN][52] ([Intel XE#9391]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-ptl-6/igt@xe_pm@s4-vm-bind-userptr.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-ptl-6/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][54] ([Intel XE#9254]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][56] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][57] ([Intel XE#2426] / [Intel XE#5848])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][58] ([Intel XE#9365]) -> [DMESG-WARN][59] ([Intel XE#9762])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-4/igt@xe_survivability@runtime-survivability.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-9/igt@xe_survivability@runtime-survivability.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536
  [Intel XE#9762]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9799]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9799


Build changes
-------------

  * Linux: xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f -> xe-pw-178884v1

  IGT_9196: 9196
  xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f: b06015536eeea9b106eccd274e6f8b7bbc180e9f
  xe-pw-178884v1: 178884v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/index.html

--===============3795200405252555860==
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
<tr><td><b>Series:</b></td><td>drm/i915/psr: Adjust Xiaomi Book Pro 14 2026 psr2 disable quirk</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178884/">https://patchwork.freedesktop.org/series/178884/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f_FULL -&gt; xe-pw-178884v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178884v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-5/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-5/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_chamelium_color_pipeline@plane-lut1d-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9536">Intel XE#9536</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-ptl-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9799">Intel XE#9799</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_plane@pixel-format-y-tiled-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-max-crc-yf-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_multi_queue@many-queues-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_reset@cm-multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-new-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_system_allocator@many-stride-new-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7098">Intel XE#7098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8159">Intel XE#8159</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-shared-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@prl-max-entries:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_page_reclaim@prl-max-entries.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-compare:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_pat@pat-sw-hw-compare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-lnl-5/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-lnl-5/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-4/igt@xe_pxp@pxp-optout.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-3/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible@ac-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-ptl-6/igt@xe_pm@s4-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9391">Intel XE#9391</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-ptl-6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f/shard-bmg-4/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178884v1/shard-bmg-9/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9762">Intel XE#9762</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f -&gt; xe-pw-178884v1</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6171-b06015536eeea9b106eccd274e6f8b7bbc180e9f: b06015536eeea9b106eccd274e6f8b7bbc180e9f<br />
  xe-pw-178884v1: 178884v1</p>

</body>
</html>

--===============3795200405252555860==--
