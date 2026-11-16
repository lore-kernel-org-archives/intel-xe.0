Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82902606A322
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 15:21:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4115210EA43;
	Mon, 16 Nov 2026 15:21:35 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1672A10EA43;
 Mon, 16 Nov 2026 15:21:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4256674671171638376=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/atomic=3A_Try_to_make_?=
 =?utf-8?q?atomic+async_usable=2C_and_clear_up_the_=22async_update=22_helper?=
 =?utf-8?q?_confusion?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ville Syrjala" <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Nov 2026 15:21:33 -0000
Message-ID: <179484249306.33136.2648938000180116102@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
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

--===============4256674671171638376==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: Try to make atomic+async usable, and clear up the "async update" helper confusion
URL   : https://patchwork.freedesktop.org/series/178652/
State : failure

== Summary ==

CI Bug Log - changes from xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3_FULL -> xe-pw-178652v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-178652v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-178652v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-178652v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc-atomic@pipe-a-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] +4 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-7/igt@kms_async_flips@crc-atomic@pipe-a-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-6/igt@kms_async_flips@crc-atomic@pipe-a-edp-1.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - shard-bmg:          [PASS][3] -> [DMESG-FAIL][4] +4 other tests dmesg-fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-6/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-9/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][5] -> [FAIL][6] +3 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-6/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-9/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  
#### Warnings ####

  * igt@kms_sharpness_filter@filter-scaler-downscale:
    - shard-bmg:          [SKIP][7] ([Intel XE#6503]) -> [INCOMPLETE][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html

  
New tests
---------

  New tests have been introduced between xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3_FULL and xe-pw-178652v1_FULL:

### New IGT tests (11) ###

  * igt@kms_concurrent@multi-plane-atomic-lowres:
    - Statuses : 3 pass(s)
    - Exec time: [3.20, 4.40] s

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 2.88] s

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 3.09] s

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - Statuses : 2 skip(s)
    - Exec time: [0.0] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 9.94] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.22] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.14] s

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - Statuses : 1 pass(s) 2 skip(s)
    - Exec time: [0.0, 10.30] s

  * igt@xe_exec_queue_property@basic-get-property:
    - Statuses : 1 pass(s)
    - Exec time: [0.02] s

  * igt@xe_exec_queue_property@invalid-exec-queue:
    - Statuses : 3 pass(s)
    - Exec time: [0.01, 0.04] s

  * igt@xe_exec_queue_property@non-zero-reserved:
    - Statuses : 3 pass(s)
    - Exec time: [0.02, 0.03] s

  

Known issues
------------

  Here are the changes found in xe-pw-178652v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][9] -> [FAIL][10] ([Intel XE#3718] / [Intel XE#6078])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#3718] / [Intel XE#7265])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][13] ([Intel XE#3718] / [Intel XE#6078])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:
    - shard-bmg:          [PASS][14] -> [FAIL][15] ([Intel XE#6078]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][16] -> [FAIL][17] ([Intel XE#7265])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#6078]) +2 other tests fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:
    - shard-ptl:          [PASS][19] -> [FAIL][20] ([Intel XE#6078]) +2 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2327])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#1124]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#367])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2887]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2652]) +3 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2325] / [Intel XE#7358])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7358])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2252]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][30] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@type1:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#7642])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_content_protection@type1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][32] ([Intel XE#6707] / [Intel XE#7439])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2320]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2321] / [Intel XE#7355])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#1424])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][36] -> [DMESG-WARN][37] ([Intel XE#9522])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1340] / [Intel XE#7435])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8265]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1421]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#7178] / [Intel XE#7351])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#7179])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#352])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2311]) +18 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#7061])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#4141]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#6312] / [Intel XE#651])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#656] / [Intel XE#7905])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6312])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7865])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7399])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313]) +20 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#7905]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7283])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#5021] / [Intel XE#7377])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010:
    - shard-bmg:          NOTRUN -> [FAIL][58] ([Intel XE#9780]) +3 other tests fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#1489])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1406])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_psr@pr-suspend.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2234])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#3904] / [Intel XE#7342])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2509] / [Intel XE#7437])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#1499] / [Intel XE#9271])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#6540] / [Intel XE#688])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7482]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#8374]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-rebind.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:
    - shard-bmg:          NOTRUN -> [SKIP][71] ([Intel XE#8364]) +10 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-ptl:          NOTRUN -> [SKIP][72] ([Intel XE#8364])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#8364]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#8378]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#6964]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7793])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pat@pat-index-xelp:
    - shard-bmg:          NOTRUN -> [SKIP][77] ([Intel XE#2245] / [Intel XE#7590])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#2284] / [Intel XE#7370])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][79] -> [DMESG-WARN][80] ([Intel XE#7727])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-6/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [PASS][81] -> [ABORT][82] ([Intel XE#9362])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-8/igt@xe_pm@s4-exec-after.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][83] -> [ABORT][84] ([Intel XE#9362])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#7271])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][86] -> [FAIL][87] ([Intel XE#9254]) +1 other test fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_pmu@engine-activity-accuracy-90:
    - shard-lnl:          [PASS][88] -> [FAIL][89] ([Intel XE#9461]) +2 other tests fail
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][90] ([Intel XE#4733] / [Intel XE#7417])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-engines:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#944])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#944]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_ras@gpu-health:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#9588])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_ras@gpu-health.html

  
#### Possible fixes ####

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][94] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][95] +1 other test pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][96] ([Intel XE#6652]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [ABORT][98] ([Intel XE#9362]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-8/igt@xe_pm@s4-mocs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][100] ([Intel XE#3544]) -> [SKIP][101] ([Intel XE#3374] / [Intel XE#3544])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][102] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][103] ([Intel XE#2426] / [Intel XE#5848])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][104] ([Intel XE#6281] / [Intel XE#7426]) -> [ABORT][105] ([Intel XE#9463])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-ptl:          [DMESG-WARN][106] ([Intel XE#7727]) -> [ABORT][107] ([Intel XE#9362])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-prefetch.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9461]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9522
  [Intel XE#9588]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780


Build changes
-------------

  * Linux: xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3 -> xe-pw-178652v1

  IGT_9192: 9192
  xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3: 7bc1ac64a8303bd83e0394f306c4137a5a2febf3
  xe-pw-178652v1: 178652v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/index.html

--===============4256674671171638376==
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
<tr><td><b>Series:</b></td><td>drm/atomic: Try to make atomic+async usable, and clear up the &quot;async update&quot; helper confusion</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/178652/">https://patchwork.freedesktop.org/series/178652/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3_FULL -&gt; xe-pw-178652v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-178652v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-178652v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-178652v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-7/igt@kms_async_flips@crc-atomic@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-6/igt@kms_async_flips@crc-atomic@pipe-a-edp-1.html">FAIL</a> +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-6/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-9/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html">DMESG-FAIL</a> +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-6/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-9/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_sharpness_filter@filter-scaler-downscale:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-5/igt@kms_sharpness_filter@filter-scaler-downscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-8/igt@kms_sharpness_filter@filter-scaler-downscale.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3_FULL and xe-pw-178652v1_FULL:</p>
<h3>New IGT tests (11)</h3>
<ul>
<li>
<p>igt@kms_concurrent@multi-plane-atomic-lowres:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [3.20, 4.40] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 2.88] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-samefd:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 3.09] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>Statuses : 2 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 9.94] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.22] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.14] s</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>Statuses : 1 pass(s) 2 skip(s)</li>
<li>Exec time: [0.0, 10.30] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@basic-get-property:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@invalid-exec-queue:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.01, 0.04] s</li>
</ul>
</li>
<li>
<p>igt@xe_exec_queue_property@non-zero-reserved:</p>
<ul>
<li>Statuses : 3 pass(s)</li>
<li>Exec time: [0.02, 0.03] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-178652v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-2/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-4/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-d-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@kms_bw@linear-tiling-1-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9522">Intel XE#9522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7435">Intel XE#7435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_frontbuffer_tracking@psrhdr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_plane@pixel-format-4-tiled-dg2-rc-ccs-cc-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-7/igt@kms_plane_scaling@plane-upscale-max-crc-linear@pipe-d-dp-1-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_psr@pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_exec_balancer@many-execqueues-parallel-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_fault_mode@many-multi-queue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_multi_queue@few-execs-preempt-mode-fault-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-mixed-fd-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_pat@pat-index-xelp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245">Intel XE#2245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-6/igt@xe_pm@s4-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-8/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-7/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_pm_residency@aspm_link_residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-90.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9461">Intel XE#9461</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-4/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ras@gpu-health:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-5/igt@xe_ras@gpu-health.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9588">Intel XE#9588</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-8/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-lnl-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-8/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-6/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-10/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-bmg-2/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-bmg-1/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3/shard-ptl-6/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-178652v1/shard-ptl-1/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3 -&gt; xe-pw-178652v1</li>
</ul>
<p>IGT_9192: 9192<br />
  xe-6148-7bc1ac64a8303bd83e0394f306c4137a5a2febf3: 7bc1ac64a8303bd83e0394f306c4137a5a2febf3<br />
  xe-pw-178652v1: 178652v1</p>

</body>
</html>

--===============4256674671171638376==--
