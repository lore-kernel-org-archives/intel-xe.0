Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607C8CD37AC
	for <intel-xe@archiver.kernel.org>; Thu, 14 May 2026 01:01:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13B8810F0F5;
	Thu, 14 May 2026 01:01:32 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72A0C10E386;
 Thu, 14 May 2026 01:01:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8409080926036116231=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_Make_drm=5Fdrive?=
 =?utf-8?q?r_const?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 14 May 2026 01:01:30 -0000
Message-ID: <177872049045.69473.7759567322318905176@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260512183342.3374-1-michal.wajdeczko@intel.com>
In-Reply-To: <20260512183342.3374-1-michal.wajdeczko@intel.com>
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

--===============8409080926036116231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Make drm_driver const
URL   : https://patchwork.freedesktop.org/series/166441/
State : failure

== Summary ==

CI Bug Log - changes from xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be_FULL -> xe-pw-166441v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-166441v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-166441v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-166441v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +19 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html

  
Known issues
------------

  Here are the changes found in xe-pw-166441v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][3] ([Intel XE#2327])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#1124]) +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2887]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#2887]) +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#2652]) +7 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][8] -> [INCOMPLETE][9] ([Intel XE#7084]) +1 other test incomplete
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#3432])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2252])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#373])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1468] / [Intel XE#7396])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#2321] / [Intel XE#7355])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2320])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][16] -> [FAIL][17] ([Intel XE#7571])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2286] / [Intel XE#6035])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][19] -> [FAIL][20] ([Intel XE#301]) +3 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#7178] / [Intel XE#7351]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#352])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#7905]) +7 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4141]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#6312] / [Intel XE#651]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#656] / [Intel XE#7905]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#6312])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2311]) +7 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#7865]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#7061] / [Intel XE#7356])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313]) +7 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7915]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html

  * igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#7915]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#6900] / [Intel XE#7362])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7283]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7794])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#4608])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#4608] / [Intel XE#7304])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1489])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_psr@psr-basic.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [PASS][43] -> [FAIL][44] ([Intel XE#6361]) +5 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@kms_setmode@basic.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1435])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1499])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#7636])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@read-metadata:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#7636]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_eudebug@read-metadata.html

  * igt@xe_evict@evict-mixed-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#6540] / [Intel XE#688]) +2 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_evict@evict-mixed-threads-small.html

  * igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#7482]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#7136])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7136])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#6874]) +4 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#6874]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-close-fd.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#7866])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#7138])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#7138]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#6703]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_mmap@small-bar:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#586] / [Intel XE#7323] / [Intel XE#7384])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_mmap@small-bar.html

  * igt@xe_multigpu_svm@mgpu-coherency-conflict:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#6964])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-conflict.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#7793])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#7793])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#5694] / [Intel XE#7370])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_pm@d3cold-i2c.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#944])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#4273])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_vfio@bind-unbind-vfs:
    - shard-bmg:          [PASS][67] -> [DMESG-FAIL][68] ([Intel XE#5545])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs.html

  * igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-4:
    - shard-bmg:          [PASS][69] -> [DMESG-WARN][70] ([Intel XE#5545])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-4.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-4.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-lnl:          [PASS][71] -> [ABORT][72] ([Intel XE#7914])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html
    - shard-bmg:          [PASS][73] -> [ABORT][74] ([Intel XE#7914])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_feature_discovery@display-1x:
    - shard-bmg:          [SKIP][75] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_feature_discovery@display-1x.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_feature_discovery@display-1x.html

  * igt@kms_flip@basic-plain-flip@d-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][77] -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][79] ([Intel XE#6361]) -> [PASS][80] +2 other tests pass
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:
    - shard-bmg:          [DMESG-FAIL][81] ([Intel XE#5545]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0:
    - shard-bmg:          [FAIL][83] -> [PASS][84] +6 other tests pass
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html

  * igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:
    - shard-bmg:          [FAIL][85] ([Intel XE#7956]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html

  * igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:
    - shard-bmg:          [SKIP][87] ([Intel XE#6703]) -> [PASS][88] +212 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:
    - shard-bmg:          [FAIL][89] ([Intel XE#7736]) -> [PASS][90] +2 other tests pass
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][91] ([Intel XE#6627] / [Intel XE#7419]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-6/igt@xe_survivability@runtime-survivability.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html

  
#### Warnings ####

  * igt@kms_atomic@crtc-invalid-params-fence:
    - shard-bmg:          [DMESG-WARN][93] -> [SKIP][94] ([Intel XE#6703])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_atomic@crtc-invalid-params-fence.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_atomic@crtc-invalid-params-fence.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          [SKIP][95] ([Intel XE#6703]) -> [SKIP][96] ([Intel XE#2327]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][97] ([Intel XE#6703]) -> [SKIP][98] ([Intel XE#1124]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][99] ([Intel XE#6703]) -> [SKIP][100] ([Intel XE#7679])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][101] ([Intel XE#6703]) -> [SKIP][102] ([Intel XE#367])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          [SKIP][103] ([Intel XE#6703]) -> [SKIP][104] ([Intel XE#2887]) +1 other test skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][105] ([Intel XE#6703]) -> [SKIP][106] ([Intel XE#2652])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][107] ([Intel XE#6703]) -> [SKIP][108] ([Intel XE#3432])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][109] ([Intel XE#2887]) -> [SKIP][110] ([Intel XE#6703]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          [SKIP][111] ([Intel XE#6703]) -> [SKIP][112] ([Intel XE#2724] / [Intel XE#7449])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cdclk@plane-scaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-bmg:          [SKIP][113] ([Intel XE#6703]) -> [SKIP][114] ([Intel XE#2325] / [Intel XE#7358])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-bmg:          [SKIP][115] ([Intel XE#6703]) -> [SKIP][116] ([Intel XE#2252])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          [SKIP][117] ([Intel XE#6703]) -> [SKIP][118] ([Intel XE#6974])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][119] ([Intel XE#6703]) -> [SKIP][120] ([Intel XE#7642])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@type1.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42:
    - shard-bmg:          [SKIP][121] ([Intel XE#6703]) -> [SKIP][122] ([Intel XE#2320]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][123] ([Intel XE#6703]) -> [SKIP][124] ([Intel XE#7178] / [Intel XE#7351])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][125] ([Intel XE#6703]) -> [SKIP][126] ([Intel XE#7179]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][127] ([Intel XE#4141]) -> [SKIP][128] ([Intel XE#6703])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][129] ([Intel XE#6703]) -> [SKIP][130] ([Intel XE#4141]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][131] ([Intel XE#6703]) -> [SKIP][132] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:
    - shard-bmg:          [SKIP][133] ([Intel XE#2311]) -> [SKIP][134] ([Intel XE#6703])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][135] ([Intel XE#6703]) -> [SKIP][136] ([Intel XE#2311]) +17 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][137] ([Intel XE#7061]) -> [SKIP][138] ([Intel XE#6703])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-rte:
    - shard-bmg:          [SKIP][139] ([Intel XE#6703]) -> [SKIP][140] ([Intel XE#2313]) +17 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][141] ([Intel XE#6703]) -> [SKIP][142] ([Intel XE#7283]) +1 other test skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][143] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][144] ([Intel XE#6703])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][145] ([Intel XE#6703]) -> [SKIP][146] ([Intel XE#1489]) +1 other test skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-bmg:          [SKIP][147] ([Intel XE#6703]) -> [SKIP][148] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][149] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][150] ([Intel XE#6703])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_sharpness_filter@filter-toggle:
    - shard-bmg:          [SKIP][151] ([Intel XE#6703]) -> [SKIP][152] ([Intel XE#6503])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_sharpness_filter@filter-toggle.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][153] ([Intel XE#6703]) -> [SKIP][154] ([Intel XE#1499])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug_online@stopped-thread:
    - shard-bmg:          [SKIP][155] ([Intel XE#6703]) -> [SKIP][156] ([Intel XE#7636]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          [SKIP][157] ([Intel XE#6703]) -> [SKIP][158] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@twice-multi-queue:
    - shard-bmg:          [SKIP][159] ([Intel XE#6703]) -> [SKIP][160] ([Intel XE#7136]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:
    - shard-bmg:          [SKIP][161] ([Intel XE#6874]) -> [SKIP][162] ([Intel XE#6703]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][163] ([Intel XE#6703]) -> [SKIP][164] ([Intel XE#6874]) +8 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-rebind:
    - shard-bmg:          [SKIP][165] ([Intel XE#6703]) -> [SKIP][166] ([Intel XE#7138]) +2 other tests skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          [SKIP][167] ([Intel XE#6703]) -> [SKIP][168] ([Intel XE#7793])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-bmg:          [SKIP][169] ([Intel XE#6703]) -> [SKIP][170] ([Intel XE#944])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/586
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
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
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136
  [Intel XE#7138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7384]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7636]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914
  [Intel XE#7915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915
  [Intel XE#7956]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be -> xe-pw-166441v1

  IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be: 161329a551bb5ebd34524b781cd7fb3d84b994be
  xe-pw-166441v1: 166441v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/index.html

--===============8409080926036116231==
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
<tr><td><b>Series:</b></td><td>drm/xe: Make drm_driver const</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166441/">https://patchwork.freedesktop.org/series/166441/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be_FULL -&gt; xe-pw-166441v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-166441v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-166441v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-166441v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-16.html">FAIL</a> +19 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166441v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-9/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrshdr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_hdr@static-toggle@pipe-a-hdmi-a-3-xrgb16161616f.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7915">Intel XE#7915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_eudebug@read-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_evict@evict-mixed-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_balancer@no-exec-virtual-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_fault_mode@many-execqueues-multi-queue-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7866">Intel XE#7866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_exec_threads@threads-multi-queue-mixed-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/586">Intel XE#586</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7323">Intel XE#7323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7384">Intel XE#7384</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-conflict:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_multigpu_svm@mgpu-coherency-conflict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-8/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-1/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-4:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_sriov_vfio@bind-unbind-vfs@numvfs-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-6/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7914">Intel XE#7914</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_feature_discovery@display-1x.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-plain-flip@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@kms_flip@basic-plain-flip@d-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545">Intel XE#5545</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_basic@many-execqueues-many-vm-basic-defer-mmap@bcs0.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@long-spin-many-preempt-gt1-threads:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-10/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7956">Intel XE#7956</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-5/igt@xe_exec_reset@long-spin-many-preempt-gt1-threads.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-free-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-stride-free-nomemset.html">PASS</a> +212 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7736">Intel XE#7736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@xe_live_ktest@xe_migrate@xe_migrate_sanity_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6627">Intel XE#6627</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7419">Intel XE#7419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-6/igt@xe_survivability@runtime-survivability.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic@crtc-invalid-params-fence:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_atomic@crtc-invalid-params-fence.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_atomic@crtc-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@kms_cursor_crc@cursor-onscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-linear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psrhdr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_sharpness_filter@filter-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@stopped-thread:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_eudebug_online@stopped-thread.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7636">Intel XE#7636</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7136">Intel XE#7136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-3/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-mixed-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7138">Intel XE#7138</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_page_reclaim@binds-1g-partial.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be/shard-bmg-2/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166441v1/shard-bmg-1/igt@xe_query@multigpu-query-hwconfig.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be -&gt; xe-pw-166441v1</li>
</ul>
<p>IGT_8907: 6b305d78c65768c09cc7c0e902273bf409bbd218 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5052-161329a551bb5ebd34524b781cd7fb3d84b994be: 161329a551bb5ebd34524b781cd7fb3d84b994be<br />
  xe-pw-166441v1: 166441v1</p>

</body>
</html>

--===============8409080926036116231==--
