Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E73B3CD4F21
	for <intel-xe@archiver.kernel.org>; Wed, 13 May 2026 20:40:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A034410E33C;
	Wed, 13 May 2026 20:40:29 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DDF10E33C;
 Wed, 13 May 2026 20:40:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8666657519979538244=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Adjust_the_bo_sh?=
 =?utf-8?q?rinker_batch_size?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 13 May 2026 20:40:28 -0000
Message-ID: <177870482818.69473.6855115875145048559@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260512135332.11702-1-thomas.hellstrom@linux.intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============8666657519979538244==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Adjust the bo shrinker batch size
URL   : https://patchwork.freedesktop.org/series/166426/
State : failure

== Summary ==

CI Bug Log - changes from xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be_FULL -> xe-pw-166426v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166426v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166426v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166426v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@forked-bo:
    - shard-bmg:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck:
    - shard-bmg:          [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html

  
Known issues
------------

  Here are the changes found in xe-pw-166426v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#7059] / [Intel XE#7085])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2887])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2652]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#373])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1468] / [Intel XE#7396])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#2321] / [Intel XE#7355])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][12] -> [FAIL][13] ([Intel XE#7809])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][14] -> [FAIL][15] ([Intel XE#301]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#352])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2311]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#7905]) +7 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#6312])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2313])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7865]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#7061] / [Intel XE#7356])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#1503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][27] -> [SKIP][28] ([Intel XE#7922]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#7915]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#7915]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#6900] / [Intel XE#7362])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#7283]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#4608])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#4608] / [Intel XE#7304])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][37] -> [FAIL][38] ([Intel XE#6361]) +5 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@kms_setmode@basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-5/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1435])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1499])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#7636])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#7482]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#7136])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6874]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6874])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7138]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7793])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#7793])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#944])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#4273])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel.html

  
#### Possible fixes ####

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [SKIP][52] ([Intel XE#5177] / [Intel XE#6703]) -> [PASS][53]
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@intel_hwmon@hwmon-read.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@intel_hwmon@hwmon-read.html

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [SKIP][54] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][55] +1 other test pass
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_feature_discovery@display-1x.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@basic-plain-flip@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][56] -> [PASS][57] +3 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [SKIP][58] ([Intel XE#7915]) -> [PASS][59] +1 other test pass
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][60] ([Intel XE#6321]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [DMESG-FAIL][62] ([Intel XE#5545]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0:
    - shard-bmg:          [FAIL][64] -> [PASS][65] +6 other tests pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][66] ([Intel XE#6703]) -> [PASS][67] +351 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - shard-bmg:          [FAIL][68] ([Intel XE#7736]) -> [PASS][69] +7 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][70] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-6/igt@xe_survivability@runtime-survivability.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-4/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][72] ([Intel XE#6703]) -> [SKIP][73] ([Intel XE#2370])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [SKIP][75] ([Intel XE#2327]) +3 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [SKIP][76] ([Intel XE#6703]) -> [SKIP][77] ([Intel XE#1124]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][78] ([Intel XE#6703]) -> [SKIP][79] ([Intel XE#7679]) +1 other test skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#367])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][82] ([Intel XE#6703]) -> [SKIP][83] ([Intel XE#2887]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][84] ([Intel XE#6703]) -> [SKIP][85] ([Intel XE#2652])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][86] ([Intel XE#6703]) -> [SKIP][87] ([Intel XE#3432])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#2724] / [Intel XE#7449])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cdclk@plane-scaling.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][90] ([Intel XE#6703]) -> [SKIP][91] ([Intel XE#2325] / [Intel XE#7358])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          [SKIP][92] ([Intel XE#6703]) -> [SKIP][93] ([Intel XE#2252])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#7642]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@content-type-change.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][96] ([Intel XE#6703]) -> [SKIP][97] ([Intel XE#6974])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#2320]) +6 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          [SKIP][100] ([Intel XE#6703]) -> [SKIP][101] ([Intel XE#7178] / [Intel XE#7349])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-bmg:          [SKIP][102] ([Intel XE#6703]) -> [SKIP][103] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#7179]) +1 other test skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][106] ([Intel XE#6703]) -> [SKIP][107] ([Intel XE#4141]) +6 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][108] ([Intel XE#6703]) -> [SKIP][109] ([Intel XE#2311]) +29 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][110] ([Intel XE#6703]) -> [SKIP][111] ([Intel XE#2313]) +30 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][112] ([Intel XE#6703]) -> [SKIP][113] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:
    - shard-bmg:          [SKIP][114] ([Intel XE#6703]) -> [SKIP][115] ([Intel XE#7061])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [SKIP][117] ([Intel XE#7283]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][118] ([Intel XE#6703]) -> [SKIP][119] ([Intel XE#1489]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#2234] / [Intel XE#2850]) +6 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#2413])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][124] ([Intel XE#6703]) -> [SKIP][125] ([Intel XE#6503]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][126] ([Intel XE#6703]) -> [SKIP][127] ([Intel XE#1499])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][128] ([Intel XE#6703]) -> [SKIP][129] ([Intel XE#7636]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-bmg:          [SKIP][130] ([Intel XE#6703]) -> [SKIP][131] ([Intel XE#2322] / [Intel XE#7372]) +5 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          [SKIP][132] ([Intel XE#6703]) -> [SKIP][133] ([Intel XE#7136]) +7 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [SKIP][135] ([Intel XE#6874]) +11 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          [SKIP][136] ([Intel XE#6703]) -> [SKIP][137] ([Intel XE#7138]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][138] ([Intel XE#6703]) -> [SKIP][139] ([Intel XE#7954])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_gpgpu_fill@offset-4x4.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          [SKIP][140] ([Intel XE#6703]) -> [SKIP][141] ([Intel XE#7793])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][142] ([Intel XE#6703]) -> [SKIP][143] ([Intel XE#1420] / [Intel XE#7590])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][144] ([Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][145] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_peer2peer@read.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_peer2peer@read.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][146] ([Intel XE#6703]) -> [SKIP][147] ([Intel XE#944]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6627]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7809]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7922]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be -> xe-pw-166426v1

  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be: 161329a551bb5ebd34524b781cd7fb3d84b994be
  xe-pw-166426v1: 166426v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/index.html

--===============8666657519979538244==
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
<tr><td><b>Series:</b></td><td>drm/xe: Adjust the bo shrinker batch size</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166426/">https://patchwork.freedesktop.org/series/166426/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be_FULL -&gt; xe-pw-166426v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166426v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166426v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166426v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@forked-bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-4/igt@kms_cursor_legacy@forked-bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-2/igt@kms_cursor_legacy@forked-bo.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-1/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-6/igt@xe_exec_system_allocator@many-execqueues-mmap-remap-ro-dontunmap-eocheck.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166426v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7809">Intel XE#7809</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-7/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-10/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-7/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-10/igt@kms_hdr@invalid-hdr@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7922">Intel XE#7922</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-5/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-8/igt@kms_hdr@static-toggle-dpms@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-7/igt@xe_page_reclaim@pde-vs-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-lnl-5/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@intel_hwmon@hwmon-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177">Intel XE#5177</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@intel_hwmon@hwmon-read.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_feature_discovery@display-1x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-1/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-6/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-8/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">PASS</a> +351 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736">Intel XE#7736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-4/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_gpgpu_fill@offset-4x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-3/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166426v1/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be -&gt; xe-pw-166426v1</li>
</ul>
<p>IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be: 161329a551bb5ebd34524b781cd7fb3d84b994be<br />
  xe-pw-166426v1: 166426v1</p>

</body>
</html>

--===============8666657519979538244==--
