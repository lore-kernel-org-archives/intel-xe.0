Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9548B606A31C
	for <intel-xe@archiver.kernel.org>; Tue, 17 Nov 2026 05:52:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C07B10E4E7;
	Tue, 17 Nov 2026 05:52:22 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B132710E480;
 Tue, 17 Nov 2026 05:52:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2620077052987710268=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_Crescent_Island_PMT_suppor?=
 =?utf-8?q?t_=28rev18=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 17 Nov 2026 05:52:21 -0000
Message-ID: <179489474171.35214.13094491855402331914@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261116150649.368686-19-michael.j.ruhl@intel.com>
In-Reply-To: <20261116150649.368686-19-michael.j.ruhl@intel.com>
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

--===============2620077052987710268==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Crescent Island PMT support (rev18)
URL   : https://patchwork.freedesktop.org/series/160717/
State : failure

== Summary ==

CI Bug Log - changes from xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2_FULL -> xe-pw-160717v18_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-160717v18_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-160717v18_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-160717v18_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-with-load:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-7/igt@core_hotunplug@hotrebind-with-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-10/igt@core_hotunplug@hotrebind-with-load.html

  
#### Warnings ####

  * igt@xe_survivability@runtime-survivability:
    - shard-bmg:          [DMESG-WARN][3] ([Intel XE#9365]) -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-5/igt@xe_survivability@runtime-survivability.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-5/igt@xe_survivability@runtime-survivability.html

  
Known issues
------------

  Here are the changes found in xe-pw-160717v18_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          [PASS][5] -> [FAIL][6] ([Intel XE#3718] / [Intel XE#6078])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][7] ([Intel XE#3718] / [Intel XE#6078])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#8098] / [Intel XE#9561]) +1 other test fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2327]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#1231])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#1124])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2887]) +2 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652]) +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2724] / [Intel XE#7449])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2252]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#6974])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][21] ([Intel XE#3304])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#6707] / [Intel XE#7439]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#2321] / [Intel XE#7355])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#1508])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#8265])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#4422] / [Intel XE#7442])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#8680])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][30] -> [FAIL][31] ([Intel XE#301]) +1 other test fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#7179])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#4141])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2311]) +13 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#7061])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2313]) +10 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][37] ([Intel XE#7061] / [Intel XE#7356])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7283])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#5021] / [Intel XE#7377])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#9779])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#8396]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#1489]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@psr-no-drrs:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_psr@psr-no-drrs.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#3904] / [Intel XE#7342])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-scaler-upscale:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#6503])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_sharpness_filter@filter-scaler-upscale.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1499] / [Intel XE#9271])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8608])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#8374]) +5 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@two-queues-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#8364]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#8378]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#7793])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2284] / [Intel XE#7370])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-lnl:          [PASS][54] -> [ABORT][55] ([Intel XE#9476])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-4/igt@xe_pm@s4-basic-exec.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-3/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-ptl:          [PASS][56] -> [ABORT][57] ([Intel XE#9362])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-ptl-2/igt@xe_pm@s4-multiple-execs.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [PASS][58] -> [FAIL][59] ([Intel XE#9254])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#944])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_wedged@cold-reset-wedged:
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#9747])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_wedged@cold-reset-wedged.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:
    - shard-bmg:          [SKIP][62] ([Intel XE#367]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [FAIL][64] ([Intel XE#301]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][66] ([Intel XE#2029] / [Intel XE#7395]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_vrr@flip-basic:
    - shard-ptl:          [FAIL][68] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][69] +1 other test pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-ptl-6/igt@kms_vrr@flip-basic.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-ptl-1/igt@kms_vrr@flip-basic.html

  * igt@xe_compute_preempt@compute-preempt-many-all-ram:
    - shard-bmg:          [ABORT][70] ([Intel XE#9481]) -> [PASS][71] +1 other test pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many-all-ram.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many-all-ram.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][72] ([Intel XE#9463]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [FAIL][74] ([Intel XE#9254]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6707]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7377]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377
  [Intel XE#7395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#8098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476
  [Intel XE#9481]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481
  [Intel XE#9561]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561
  [Intel XE#9747]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779


Build changes
-------------

  * Linux: xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2 -> xe-pw-160717v18

  IGT_9194: 9194
  xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2: d5a6e2921e68b0cc42812376ca6c8095b6c941a2
  xe-pw-160717v18: 160717v18

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/index.html

--===============2620077052987710268==
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
<tr><td><b>Series:</b></td><td>Crescent Island PMT support (rev18)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160717/">https://patchwork.freedesktop.org/series/160717/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2_FULL -&gt; xe-pw-160717v18_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-160717v18_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-160717v18_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-160717v18_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@hotrebind-with-load:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-7/igt@core_hotunplug@hotrebind-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-10/igt@core_hotunplug@hotrebind-with-load.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_survivability@runtime-survivability:<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365">Intel XE#9365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-5/igt@xe_survivability@runtime-survivability.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-160717v18_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-10/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8098">Intel XE#8098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9561">Intel XE#9561</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-8/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-7/igt@kms_content_protection@uevent@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6707">Intel XE#6707</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7439">Intel XE#7439</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_dsc@dsc-fractional-bpp-with-bpc-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_flip_scaled_crc@flip-p016-linear-to-p016-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7377">Intel XE#7377</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-90-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-no-drrs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_psr@psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_sharpness_filter@filter-scaler-upscale.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_exec_multi_queue@two-queues-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_page_reclaim@binds-full-pd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-4/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-3/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476">Intel XE#9476</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-ptl-2/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-ptl-8/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@cold-reset-wedged:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_wedged@cold-reset-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9747">Intel XE#9747</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-10/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2160x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7395">Intel XE#7395</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-ptl-6/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-ptl-1/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-all-ram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-7/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9481">Intel XE#9481</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_compute_preempt@compute-preempt-many-all-ram.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-1/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160717v18/shard-bmg-9/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2 -&gt; xe-pw-160717v18</li>
</ul>
<p>IGT_9194: 9194<br />
  xe-6153-d5a6e2921e68b0cc42812376ca6c8095b6c941a2: d5a6e2921e68b0cc42812376ca6c8095b6c941a2<br />
  xe-pw-160717v18: 160717v18</p>

</body>
</html>

--===============2620077052987710268==--
