Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D36FD606A32A
	for <intel-xe@archiver.kernel.org>; Wed, 18 Nov 2026 06:45:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D94E10E588;
	Wed, 18 Nov 2026 06:45:01 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D212410E22B;
 Wed, 18 Nov 2026 06:45:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8187192846791731135=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_gpu/buddy=3A_Fix_quadratic?=
 =?utf-8?q?_cost_of_range-biased_allocation_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sanjay Yadav" <sanjay.kumar.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 18 Nov 2026 06:45:00 -0000
Message-ID: <179498430084.41175.14252269461998235222@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261117145435.1629839-3-sanjay.kumar.yadav@intel.com>
In-Reply-To: <20261117145435.1629839-3-sanjay.kumar.yadav@intel.com>
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
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8187192846791731135==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: gpu/buddy: Fix quadratic cost of range-biased allocation (rev6)
URL   : https://patchwork.freedesktop.org/series/175945/
State : failure

== Summary ==

CI Bug Log - changes from xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7_FULL -> xe-pw-175945v6_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-175945v6_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-175945v6_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-175945v6_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-ptl:          ([PASS][1], [PASS][2], [PASS][3]) -> [FAIL][4] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          ([PASS][5], [PASS][6], [PASS][7]) -> [INCOMPLETE][8]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3:
    - shard-bmg:          ([PASS][9], [PASS][10]) -> [INCOMPLETE][11]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-ptl:          ([PASS][12], [PASS][13], [PASS][14], [PASS][15]) -> [INCOMPLETE][16] +1 other test incomplete
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm_residency@gt-c6-freeze.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@xe_pm_residency@gt-c6-freeze.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-8/igt@xe_pm_residency@gt-c6-freeze.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-5/igt@xe_pm_residency@gt-c6-freeze.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-4/igt@xe_pm_residency@gt-c6-freeze.html

  
Known issues
------------

  Here are the changes found in xe-pw-175945v6_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug-lateclose-with-load:
    - shard-bmg:          ([PASS][17], [PASS][18], [PASS][19], [PASS][20]) -> [ABORT][21] ([Intel XE#9463])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose-with-load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose-with-load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@core_hotunplug@hotreplug-lateclose-with-load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@core_hotunplug@hotreplug-lateclose-with-load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-9/igt@core_hotunplug@hotreplug-lateclose-with-load.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2887])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2652]) +3 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#2252])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#7358])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][26] ([Intel XE#3304])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8265]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#4141])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2311]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2387] / [Intel XE#7429])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2234] / [Intel XE#2850])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-bmg:          ([PASS][32], [PASS][33], [PASS][34]) -> [ABORT][35] ([Intel XE#9279]) +1 other test abort
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_compute_preempt@compute-preempt-many-vram.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-3/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_configfs@ctx-restore-mid-bb-invalid:
    - shard-bmg:          ([PASS][36], [PASS][37], [PASS][38]) -> [ABORT][39] ([Intel XE#9463])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@xe_configfs@ctx-restore-mid-bb-invalid.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@xe_configfs@ctx-restore-mid-bb-invalid.html

  * igt@xe_exec_fault_mode@many-multi-queue-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8374]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_exec_fault_mode@many-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8364]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem.html

  * igt@xe_multigpu_svm@mgpu-latency-copy-basic:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#6964])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-copy-basic.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          ([FAIL][43], [PASS][44], [PASS][45], [PASS][46]) ([Intel XE#3718] / [Intel XE#6078]) -> [PASS][47]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          ([PASS][48], [PASS][49], [PASS][50], [FAIL][51]) ([Intel XE#6078]) -> [PASS][52]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-180:
    - shard-lnl:          ([PASS][53], [PASS][54], [ABORT][55], [PASS][56]) ([Intel XE#4760]) -> [PASS][57]
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          ([SKIP][58], [SKIP][59], [SKIP][60]) ([Intel XE#367]) -> [PASS][61]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [INCOMPLETE][62] -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          ([FAIL][64], [FAIL][65], [PASS][66], [PASS][67]) ([Intel XE#7809]) -> [PASS][68]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-bmg:          ([PASS][69], [PASS][70], [PASS][71], [FAIL][72]) ([Intel XE#5408] / [Intel XE#6266]) -> [PASS][73]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3:
    - shard-bmg:          ([PASS][74], [PASS][75], [PASS][76], [FAIL][77]) ([Intel XE#3098] / [Intel XE#3149]) -> [PASS][78] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-5/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-lnl:          ([FAIL][79], [PASS][80], [PASS][81], [FAIL][82]) ([Intel XE#301] / [Intel XE#3149]) -> [PASS][83]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          ([PASS][84], [PASS][85], [FAIL][86], [PASS][87]) ([Intel XE#301]) -> [PASS][88]
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          ([PASS][89], [PASS][90], [FAIL][91], [PASS][92]) ([Intel XE#301] / [Intel XE#3149]) -> [PASS][93]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          ([PASS][94], [PASS][95], [SKIP][96], [SKIP][97]) ([Intel XE#1503]) -> [PASS][98]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_hdr@invalid-hdr.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr@invalid-hdr.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          ([INCOMPLETE][99], [PASS][100], [INCOMPLETE][101]) ([Intel XE#9792]) -> [PASS][102]
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_hdr@static-toggle-suspend.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f:
    - shard-bmg:          ([PASS][103], [INCOMPLETE][104]) ([Intel XE#9792]) -> [PASS][105]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          ([FAIL][106], [PASS][107], [PASS][108], [FAIL][109]) ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][110] +1 other test pass
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-6/igt@kms_vrr@flip-basic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@kms_vrr@flip-basic.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@kms_vrr@flip-basic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@kms_vrr@flip-basic.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-5/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          ([PASS][111], [FAIL][112], [FAIL][113]) ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][114] +1 other test pass
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          ([PASS][115], [FAIL][116], [PASS][117]) ([Intel XE#8578]) -> [PASS][118]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_exec_fault_mode@atomic-many.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:
    - shard-lnl:          ([PASS][119], [FAIL][120], [PASS][121]) ([Intel XE#7850]) -> [PASS][122]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-2/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          ([PASS][123], [PASS][124], [PASS][125], [ABORT][126]) ([Intel XE#9463]) -> [PASS][127]
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_oa@non-zero-reason:
    - shard-bmg:          ([PASS][128], [PASS][129], [PASS][130], [FAIL][131]) ([Intel XE#7334]) -> [PASS][132] +1 other test pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_oa@non-zero-reason.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@xe_oa@non-zero-reason.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@xe_oa@non-zero-reason.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_oa@non-zero-reason.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-3/igt@xe_oa@non-zero-reason.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          ([ABORT][133], [PASS][134], [PASS][135], [PASS][136]) ([Intel XE#9362]) -> [PASS][137] +1 other test pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@xe_pm@s4-basic-exec.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@xe_pm@s4-basic-exec.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@xe_pm@s4-basic-exec.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm@s4-basic-exec.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-1/igt@xe_pm@s4-basic-exec.html
    - shard-lnl:          ([PASS][138], [ABORT][139], [PASS][140], [PASS][141]) ([Intel XE#9476]) -> [PASS][142]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-2/igt@xe_pm@s4-basic-exec.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@xe_pm@s4-basic-exec.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-8/igt@xe_pm@s4-basic-exec.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@xe_pm@s4-basic-exec.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-5/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          ([PASS][143], [ABORT][144], [PASS][145], [PASS][146]) ([Intel XE#9362]) -> [PASS][147] +2 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          ([SKIP][148], [SKIP][149], [SKIP][150], [SKIP][151]) ([Intel XE#2426] / [Intel XE#2509] / [Intel XE#5848] / [Intel XE#7437]) -> [SKIP][152] ([Intel XE#2426] / [Intel XE#5848])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          ([ABORT][153], [PASS][154], [PASS][155], [PASS][156]) ([Intel XE#9362]) -> [DMESG-WARN][157] ([Intel XE#7727])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm@s4-mocs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@xe_pm@s4-mocs.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-8/igt@xe_pm@s4-mocs.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@xe_pm@s4-mocs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-4/igt@xe_pm@s4-mocs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          ([PASS][158], [PASS][159], [FAIL][160], [FAIL][161]) ([Intel XE#9254]) -> [FAIL][162] ([Intel XE#9254]) +1 other test fail
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7334]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7334
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9279
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476
  [Intel XE#9792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9792


Build changes
-------------

  * Linux: xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7 -> xe-pw-175945v6

  IGT_9196: 9196
  xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7: 1bcf6d6c4e900492a190123010854ee3e5f6a6c7
  xe-pw-175945v6: 175945v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/index.html

--===============8187192846791731135==
Content-Type: text/html; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE html>
<html xmlns=3D"http://www.w3.org/1999/xhtml">
 <head>
  <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8"/>
  <title>Project List - Patchwork</title>
  <style id=3D"css-table-select" type=3D"text/css">
   td { padding: 2pt; }
  </style>
</head>
<body>


<b>Patch Details</b>
<table>
<tr><td><b>Series:</b></td><td>gpu/buddy: Fix quadratic cost of range-biase=
d allocation (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/175945/">https://patchwork.freedesktop.org/series/175945/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-175945v6/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175945v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6160-1bcf6d6c4e900492a190123010854ee3e=
5f6a6c7_FULL -&gt; xe-pw-175945v6_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-175945v6_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-175945v6_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1759=
45v6_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@kms_pla=
ne@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492=
a190123010854ee3e5f6a6c7/shard-ptl-4/igt@kms_plane@pixel-format-4-tiled-lnl=
-ccs-modifier-source-clamping.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/sh=
ard-ptl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clampi=
ng.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-175945v6/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-mo=
difier-source-clamping.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_pl=
ane_multiple@2x-tiling-4.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-b=
mg-7/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e=
5f6a6c7/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html">PASS</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard=
-bmg-2/igt@kms_plane_multiple@2x-tiling-4.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_pla=
ne_multiple@2x-tiling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1901=
23010854ee3e5f6a6c7/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-4@pipe-b-=
dp-2-pipe-c-hdmi-a-3.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_plane_multiple@2x-t=
iling-4@pipe-b-dp-2-pipe-c-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm_r=
esidency@gt-c6-freeze.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-=
4/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6=
c7/shard-ptl-8/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a19012301=
0854ee3e5f6a6c7/shard-ptl-5/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6=
/shard-ptl-4/igt@xe_pm_residency@gt-c6-freeze.html">INCOMPLETE</a> +1 other=
 test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175945v6_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose-with-load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@core_ho=
tunplug@hotreplug-lateclose-with-load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f=
6a6c7/shard-bmg-8/igt@core_hotunplug@hotreplug-lateclose-with-load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d=
6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@core_hotunplug@hotreplug=
-lateclose-with-load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2=
/igt@core_hotunplug@hotreplug-lateclose-with-load.html">PASS</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-=
9/igt@core_hotunplug@hotreplug-lateclose-with-load.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_ccs@bad-pixel-format-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-c-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-c-dp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_chamelium_audio@dp-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lut1d:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt709-lut1d.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_content_protection@srm@pi=
pe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_dsc@dsc-with-output-forma=
ts-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-rend=
er:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_psr@pr-cursor-plane-onoff=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_com=
pute_preempt@compute-preempt-many-vram.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5=
f6a6c7/shard-bmg-4/igt@xe_compute_preempt@compute-preempt-many-vram.html">P=
ASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6=
d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_compute_preempt@comp=
ute-preempt-many-vram.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-3/igt@xe_compute_preempt@com=
pute-preempt-many-vram.html">ABORT</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/9279">Intel XE#9279</a>) +1 other test abort</l=
i>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-mid-bb-invalid:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-10/igt@xe_con=
figfs@ctx-restore-mid-bb-invalid.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7=
/shard-bmg-8/igt@xe_configfs@ctx-restore-mid-bb-invalid.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a=
190123010854ee3e5f6a6c7/shard-bmg-7/igt@xe_configfs@ctx-restore-mid-bb-inva=
lid.html">PASS</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175945v6/shard-bmg-6/igt@xe_configfs@ctx-restore-mid-bb-invalid.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_exec_fault_mode@many-multi=
-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-dyn-priority-smem:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_exec_multi_queue@two-queue=
s-preempt-mode-fault-dyn-priority-smem.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-latency-copy-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@xe_multigpu_svm@mgpu-latency-=
copy-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">FAIL</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6=
c7/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e90=
0492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_async_flips@alternate-sync=
-async-flip.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_=
async_flips@alternate-sync-async-flip.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#607=
8</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175=
945v6/shard-bmg-6/igt@kms_async_flips@alternate-sync-async-flip.html">PASS<=
/a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_asy=
nc_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010=
854ee3e5f6a6c7/shard-bmg-5/igt@kms_async_flips@alternate-sync-async-flip@pi=
pe-c-dp-2.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_as=
ync_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a19012301=
0854ee3e5f6a6c7/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@p=
ipe-c-dp-2.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_async_flips@alt=
ernate-sync-async-flip@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_big=
_fb@x-tiled-8bpp-rotate-180.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shar=
d-lnl-3/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010=
854ee3e5f6a6c7/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-180.html">ABO=
RT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d=
6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-7/igt@kms_big_fb@x-tiled-8bpp-=
rotate-180.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-3/igt@kms_big_fb@x-tiled-=
8bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_bw@=
linear-tiling-1-displays-target-2160x1440p.html">SKIP</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854e=
e3e5f6a6c7/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-2160x1440=
p.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6=
160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@kms_bw@linear-=
tiling-1-displays-target-2160x1440p.html">SKIP</a>) (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/=
igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">INCOMPLETE</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_c=
ursor_legacy@cursorb-vs-flipa-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_cur=
sor_legacy@flip-vs-cursor-atomic.html">FAIL</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7=
/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492=
a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-a=
tomic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_cursor=
_legacy@flip-vs-cursor-atomic.html">PASS</a>) (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms_fli=
p@2x-wf_vblank-ts-check-interruptible.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f=
6a6c7/shard-bmg-9/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d=
6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt@kms_flip@2x-wf_vblank-ts=
-check-interruptible.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3=
/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">FAIL</a>) (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266"=
>Intel XE#6266</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-175945v6/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check-interrupt=
ible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_fli=
p@dpms-vs-vblank-race@d-hdmi-a3.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/=
shard-bmg-2/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1=
90123010854ee3e5f6a6c7/shard-bmg-10/igt@kms_flip@dpms-vs-vblank-race@d-hdmi=
-a3.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-7/igt@kms_flip@dpm=
s-vs-vblank-race@d-hdmi-a3.html">FAIL</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard=
-bmg-5/igt@kms_flip@dpms-vs-vblank-race@d-hdmi-a3.html">PASS</a> +1 other t=
est pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_fli=
p@flip-vs-expired-vblank.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-l=
nl-5/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3=
e5f6a6c7/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492=
a190123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank.ht=
ml">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_flip@flip-vs-exp=
ired-vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_fli=
p@flip-vs-expired-vblank@b-edp1.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/=
shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1=
90123010854ee3e5f6a6c7/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-ed=
p1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_flip@flip=
-vs-expired-vblank@b-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-2/igt@kms_fl=
ip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@kms_fli=
p@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/=
shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1=
90123010854ee3e5f6a6c7/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@c-ed=
p1.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/igt@kms_flip@flip=
-vs-expired-vblank@c-edp1.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ln=
l-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_hdr=
@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-6/igt@kms=
_hdr@invalid-hdr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5/igt=
@kms_hdr@invalid-hdr.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3=
/igt@kms_hdr@invalid-hdr.html">SKIP</a>) (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-6/igt@kms_h=
dr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-4/igt@kms_hdr=
@static-toggle-suspend.html">INCOMPLETE</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/sha=
rd-bmg-7/igt@kms_hdr@static-toggle-suspend.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854e=
e3e5f6a6c7/shard-bmg-3/igt@kms_hdr@static-toggle-suspend.html">INCOMPLETE</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9792">I=
ntel XE#9792</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-175945v6/shard-bmg-2/igt@kms_hdr@static-toggle-suspend.html">PASS</=
a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_hdr=
@static-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1901230=
10854ee3e5f6a6c7/shard-bmg-4/igt@kms_hdr@static-toggle-suspend@pipe-a-dp-2-=
xrgb16161616f.html">INCOMPLETE</a>) (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/9792">Intel XE#9792</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-2/igt@kms_hdr@st=
atic-toggle-suspend@pipe-a-dp-2-xrgb16161616f.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-6/igt@kms_vrr=
@flip-basic.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@kms_=
vrr@flip-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@k=
ms_vrr@flip-basic.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/ig=
t@kms_vrr@flip-basic.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-5=
/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@kms_vrr=
@flip-suspend@pipe-a-edp-1.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard=
-ptl-7/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a19012301085=
4ee3e5f6a6c7/shard-ptl-2/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</=
a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">I=
ntel XE#4227</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7397">Intel XE#7397</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v6/shard-ptl-1/igt@kms_vrr@flip-suspend@pipe-a-=
edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/igt@xe_exec=
_fault_mode@atomic-many.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bm=
g-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5=
f6a6c7/shard-bmg-7/igt@xe_exec_fault_mode@atomic-many.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8=
578</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75945v6/shard-bmg-10/igt@xe_exec_fault_mode@atomic-many.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-threads:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-2/igt@xe_exec=
_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1901230=
10854ee3e5f6a6c7/shard-lnl-5/igt@xe_exec_reset@long-spin-comp-reuse-many-pr=
eempt-threads.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@xe=
_exec_reset@long-spin-comp-reuse-many-preempt-threads.html">PASS</a>) (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7850">Intel XE#7=
850</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
75945v6/shard-lnl-6/igt@xe_exec_reset@long-spin-comp-reuse-many-preempt-thr=
eads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_faul=
t_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a1901=
23010854ee3e5f6a6c7/shard-bmg-10/igt@xe_fault_injection@vm-bind-fail-xe_pt_=
update_ops_prepare.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-2/i=
gt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900=
492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_fault_injection@vm-bind-fail=
-xe_pt_update_ops_prepare.html">ABORT</a>) (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-8/igt@xe_=
fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@xe_oa@n=
on-zero-reason.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@x=
e_oa@non-zero-reason.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-5=
/igt@xe_oa@non-zero-reason.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard=
-bmg-3/igt@xe_oa@non-zero-reason.html">FAIL</a>) (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7334">Intel XE#7334</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-bmg-3/i=
gt@xe_oa@non-zero-reason.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-4/igt@xe_pm@s=
4-basic-exec.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-1/igt@xe=
_pm@s4-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/ig=
t@xe_pm@s4-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-=
3/igt@xe_pm@s4-basic-exec.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-ptl-1/igt@xe_p=
m@s4-basic-exec.html">PASS</a> +1 other test pass</li>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-2/igt@xe_pm@s=
4-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-3/igt@xe_=
pm@s4-basic-exec.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-8/ig=
t@xe_pm@s4-basic-exec.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-=
6/igt@xe_pm@s4-basic-exec.html">PASS</a>) (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/9476">Intel XE#9476</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/shard-lnl-5/igt@xe_p=
m@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-6/igt@xe_pm@s=
4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-lnl-5/ig=
t@xe_pm@s4-vm-bind-userptr.html">ABORT</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shar=
d-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6=
a6c7/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a>) (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/=
shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> +2 other tests pass=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-8/igt@kms_til=
ed_display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a19012301085=
4ee3e5f6a6c7/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-cham=
elium.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@kms_tiled_=
display@basic-test-pattern-with-chamelium.html">SKIP</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee=
3e5f6a6c7/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chameli=
um.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2426">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175945v6/s=
hard-bmg-6/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426=
">Intel XE#2426</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-3/igt@xe_pm@s=
4-mocs.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-2/igt@xe_pm@s4=
-mocs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-8/igt@xe_pm@s4-m=
ocs.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-ptl-7/igt@xe_pm@s4-moc=
s.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v6/shard-ptl-4/igt@xe_pm@s4-mocs.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727=
">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-bmg-9/igt@xe_pm_r=
esidency@gt-c6-freeze@gt0.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7/shard-=
bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900492a190123010854e=
e3e5f6a6c7/shard-bmg-2/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6160-1bcf6d6c4e900=
492a190123010854ee3e5f6a6c7/shard-bmg-3/igt@xe_pm_residency@gt-c6-freeze@gt=
0.html">FAIL</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/9254">Intel XE#9254</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-175945v6/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze=
@gt0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7 -&gt; xe-pw-175=
945v6</li>
</ul>
<p>IGT_9196: 9196<br />
  xe-6160-1bcf6d6c4e900492a190123010854ee3e5f6a6c7: 1bcf6d6c4e900492a190123=
010854ee3e5f6a6c7<br />
  xe-pw-175945v6: 175945v6</p>

</body>
</html>

--===============8187192846791731135==--
