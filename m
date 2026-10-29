Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BD62606A320
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 03:35:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCCDB10FF29;
	Thu, 29 Oct 2026 03:35:30 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4749610E18C;
 Thu, 29 Oct 2026 03:35:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0932964100435268547=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Unwrap_sync_fenc?=
 =?utf-8?q?es_before_adding_them_as_job_dependencies_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chen, Junjia" <junjia.chen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 03:35:30 -0000
Message-ID: <179324493028.84385.5150959114352590046@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261028161358.1917359-1-junjia.chen@intel.com>
In-Reply-To: <20261028161358.1917359-1-junjia.chen@intel.com>
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

--===============0932964100435268547==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Unwrap sync fences before adding them as job dependencies (rev2)
URL   : https://patchwork.freedesktop.org/series/176796/
State : failure

== Summary ==

CI Bug Log - changes from xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10_FULL -> xe-pw-176796v2_FULL
====================================================

Summary
-------

  **WARNING**

  Minor unknown changes coming with xe-pw-176796v2_FULL need to be verified
  manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-176796v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-176796v2_FULL:

### IGT changes ###

#### Warnings ####

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][1] ([Intel XE#9362]) -> [ABORT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-8/igt@xe_pm@s4-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-4/igt@xe_pm@s4-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-176796v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#3718] / [Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#7679])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#8365])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#2887]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#3432])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#7358])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html

  * igt@kms_chamelium_frames@hdmi-cmp-planar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#373])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +5 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#7642])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_content_protection@atomic-dpms-hdcp14.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][16] ([Intel XE#3304])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#6707] / [Intel XE#7439])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#2321] / [Intel XE#7355]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#309] / [Intel XE#7343]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7178] / [Intel XE#7349])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#6312])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#7865]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#7905]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7399])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#4596] / [Intel XE#5854])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_exec_balancer@twice-cm-parallel-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7482])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_balancer@twice-cm-parallel-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1392])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#8374])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html

  * igt@xe_exec_multi_queue@two-queues-priority:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#8364]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_multi_queue@two-queues-priority.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#8378]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html

  * igt@xe_madvise@atomic-device:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7980])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_madvise@atomic-device.html

  * igt@xe_page_reclaim@invalid-1g:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7793])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_page_reclaim@invalid-1g.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][37] -> [DMESG-WARN][38] ([Intel XE#7727])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [PASS][39] -> [ABORT][40] ([Intel XE#9362]) +1 other test abort
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#9254]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#4273])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][44] ([Intel XE#6321] / [Intel XE#8355]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@gt-stress-reset-rapid-cycle:
    - shard-lnl:          [DMESG-WARN][46] ([Intel XE#8652]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-7/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][48] ([Intel XE#9362]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][50] ([Intel XE#3544]) -> [SKIP][51] ([Intel XE#3374] / [Intel XE#3544])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][52] ([Intel XE#2509] / [Intel XE#7437]) -> [SKIP][53] ([Intel XE#2426] / [Intel XE#5848])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7980]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362


Build changes
-------------

  * Linux: xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10 -> xe-pw-176796v2

  IGT_9169: 9169
  xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10: 18bb5742e834aeb869af8b7262ce7e16ad9e1b10
  xe-pw-176796v2: 176796v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/index.html

--===============0932964100435268547==
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
<tr><td><b>Series:</b></td><td>drm/xe: Unwrap sync fences before adding them as job dependencies (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176796/">https://patchwork.freedesktop.org/series/176796/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10_FULL -&gt; xe-pw-176796v2_FULL</h1>
<h2>Summary</h2>
<p><strong>WARNING</strong></p>
<p>Minor unknown changes coming with xe-pw-176796v2_FULL need to be verified<br />
  manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-176796v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-176796v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_pm@s4-basic:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-8/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-4/igt@xe_pm@s4-basic.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-176796v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709-lim.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_chamelium_frames@hdmi-cmp-planar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_content_protection@atomic-dpms-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-7/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-6/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-cm-parallel-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_balancer@twice-cm-parallel-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_multi_queue@two-queues-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_madvise@atomic-device:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_madvise@atomic-device.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7980">Intel XE#7980</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@invalid-1g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_page_reclaim@invalid-1g.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-2/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-5/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-rapid-cycle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-7/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-3/igt@xe_exec_reset@gt-stress-reset-rapid-cycle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-lnl-4/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-8/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176796v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10 -&gt; xe-pw-176796v2</li>
</ul>
<p>IGT_9169: 9169<br />
  xe-6020-18bb5742e834aeb869af8b7262ce7e16ad9e1b10: 18bb5742e834aeb869af8b7262ce7e16ad9e1b10<br />
  xe-pw-176796v2: 176796v2</p>

</body>
</html>

--===============0932964100435268547==--
