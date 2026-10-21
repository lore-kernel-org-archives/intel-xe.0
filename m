Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0DA606A31A
	for <intel-xe@archiver.kernel.org>; Wed, 21 Oct 2026 18:11:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1C810E31A;
	Wed, 21 Oct 2026 18:11:37 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 004D110E047;
 Wed, 21 Oct 2026 18:11:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5881788095816301185=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_series_starting_with_=5B1/?=
 =?utf-8?q?2=5D_drm/xe/bo=3A_Add_xe=5Fbo=5Faddr=5Fiter=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 21 Oct 2026 18:11:35 -0000
Message-ID: <179260629599.53513.15753287001346619834@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261021150116.516131-3-dev@lankhorst.se>
In-Reply-To: <20261021150116.516131-3-dev@lankhorst.se>
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

--===============5881788095816301185==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/bo: Add xe_bo_addr_iter.
URL   : https://patchwork.freedesktop.org/series/176571/
State : failure

== Summary ==

CI Bug Log - changes from xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447_FULL -> xe-pw-176571v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-176571v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176571v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176571v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-0:
    - shard-ptl:          [PASS][1] -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-ptl:          ([PASS][3], [PASS][4]) -> [ABORT][5]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
    - shard-lnl:          ([PASS][6], [PASS][7]) -> [ABORT][8] +2 other tests abort
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-ptl:          [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [PASS][11] -> [ABORT][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-bmg:          ([PASS][13], [PASS][14]) -> [ABORT][15] +2 other tests abort
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
    - shard-lnl:          [PASS][16] -> [ABORT][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  
Known issues
------------

  Here are the changes found in xe-pw-176571v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#1407]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1124])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#3432])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#2887])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_chamelium_edid@dp-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#373])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-read.html

  * igt@kms_color_pipeline@plane-lut3d-green-only:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6969] / [Intel XE#7006]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#6969]) +13 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1424])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_dsc@dsc-basic:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#8265])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#1421])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][28] -> [ABORT][29] ([Intel XE#9362]) +1 other test abort
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7178] / [Intel XE#7351])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#6312]) +3 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#7905]) +4 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656] / [Intel XE#7905]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7865]) +4 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1470] / [Intel XE#2853])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#1503])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#7283])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#599])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_vrr@flipline@pipe-a-edp-1:
    - shard-ptl:          [PASS][40] -> [FAIL][41] ([Intel XE#4227] / [Intel XE#7397]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-7/igt@kms_vrr@flipline@pipe-a-edp-1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-8/igt@kms_vrr@flipline@pipe-a-edp-1.html

  * igt@xe_ccs@vm-bind-decompress:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7644])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_ccs@vm-bind-decompress.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7319] / [Intel XE#7350] / [Intel XE#944])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-cm-virtual-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#7482]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_balancer@many-cm-virtual-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1392]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-imm:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#8374])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_fault_mode@many-multi-queue-rebind-imm.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#8364]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-lnl:          [PASS][49] -> [FAIL][50] ([Intel XE#9096] / [Intel XE#9297])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-userptr-invalidate-race:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#9096])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#8378])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          ([PASS][54], [PASS][55]) -> [ABORT][56] ([Intel XE#9362])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][57] -> [ABORT][58] ([Intel XE#9362])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#944])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#4130] / [Intel XE#7366])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#9597])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-bmg:          ([DMESG-WARN][62], [PASS][63]) ([Intel XE#9365] / [Intel XE#9428]) -> [PASS][64]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-10/igt@kms_async_flips@async-flip-suspend-resume.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2:
    - shard-bmg:          ([PASS][65], [DMESG-WARN][66]) ([Intel XE#9365]) -> [PASS][67]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-10/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-bmg:          ([FAIL][68], [PASS][69]) ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][70]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-10/igt@kms_flip@blocking-wf_vblank.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-10/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          ([PASS][71], [SKIP][72]) -> [PASS][73]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-ptl:          ([PASS][74], [FAIL][75]) ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][76]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-5/igt@kms_vrr@flip-basic-fastset.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-4/igt@kms_vrr@flip-basic-fastset.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:
    - shard-ptl:          ([FAIL][77], [PASS][78]) ([Intel XE#6293] / [Intel XE#7397]) -> [PASS][79]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][80] ([Intel XE#9362]) -> [PASS][81]
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0:
    - shard-lnl:          ([PASS][82], [FAIL][83]) ([Intel XE#9347]) -> [PASS][84] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html

  
#### Warnings ####

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-ptl:          ([ABORT][85], [PASS][86]) ([Intel XE#9362]) -> [ABORT][87] ([Intel XE#9362])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-4/igt@xe_pm@s4-vm-bind-userptr.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#9096]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096
  [Intel XE#9297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297
  [Intel XE#9347]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9347
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9428
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * Linux: xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447 -> xe-pw-176571v1

  IGT_9156: 9156
  xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447: 59808d4b3a8e9cb4db43b9162aa08f35956bb447
  xe-pw-176571v1: 176571v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/index.html

--===============5881788095816301185==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/bo: Add xe_bo_addr_iter.</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176571/">https://patchwork.freedesktop.org/series/176571/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447_FULL -&gt; xe-pw-176571v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-176571v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176571v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176571v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-ptl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">ABORT</a></li>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-8/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">ABORT</a> +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-2/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-4/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-1/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">ABORT</a> +2 other tests abort</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176571v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_chamelium_edid@dp-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut3d-green-only@pipe-b-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_flip@2x-plain-flip-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470">Intel XE#1470</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-7/igt@kms_vrr@flipline@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-8/igt@kms_vrr@flipline@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-decompress:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_ccs@vm-bind-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel XE#7350</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_balancer@many-cm-virtual-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-imm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_fault_mode@many-multi-queue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_multi_queue@few-execs-preempt-mode-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-3/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9297">Intel XE#9297</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-5/igt@xe_exec_threads@threads-hang-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9096">Intel XE#9096</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_sriov_auto_provisioning@exclusive-ranges.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7366">Intel XE#7366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-10/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9428">Intel XE#9428</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-10/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2.html">DMESG-WARN</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-1/igt@kms_async_flips@async-flip-suspend-resume@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-bmg:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-7/igt@kms_flip@blocking-wf_vblank.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-bmg-10/igt@kms_flip@blocking-wf_vblank.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-bmg-10/igt@kms_flip@blocking-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-4/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-ptl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-5/igt@kms_vrr@flip-basic-fastset.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-4/igt@kms_vrr@flip-basic-fastset.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-1/igt@kms_vrr@flip-basic-fastset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-4/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">FAIL</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-5/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6293">Intel XE#6293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-1/igt@kms_vrr@flip-basic-fastset@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-6/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0:</p>
<ul>
<li>shard-lnl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html">PASS</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-lnl-7/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html">FAIL</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9347">Intel XE#9347</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_render0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s4-vm-bind-userptr:<ul>
<li>shard-ptl:          (<a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-3/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a>, <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447/shard-ptl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>) (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176571v1/shard-ptl-4/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447 -&gt; xe-pw-176571v1</li>
</ul>
<p>IGT_9156: 9156<br />
  xe-5988-59808d4b3a8e9cb4db43b9162aa08f35956bb447: 59808d4b3a8e9cb4db43b9162aa08f35956bb447<br />
  xe-pw-176571v1: 176571v1</p>

</body>
</html>

--===============5881788095816301185==--
