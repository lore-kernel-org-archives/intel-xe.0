Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD04D711CC
	for <intel-xe@archiver.kernel.org>; Thu, 18 Dec 2025 23:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D082710E0E6;
	Thu, 18 Dec 2025 23:19:48 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D0910E0E6;
 Thu, 18 Dec 2025 23:19:46 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8549177365573130648=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_PF=3A_Add_handling_for_new?=
 =?utf-8?q?_adverse_event_thresholds_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 18 Dec 2025 23:19:46 -0000
Message-ID: <176609998691.103427.415457267106140137@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251216214902.1429-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251216214902.1429-1-michal.wajdeczko@intel.com>
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

--===============8549177365573130648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Add handling for new adverse event thresholds (rev5)
URL   : https://patchwork.freedesktop.org/series/158874/
State : failure

== Summary ==

CI Bug Log - changes from xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864_FULL -> xe-pw-158874v5_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-158874v5_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-158874v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-158874v5_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-bmg:          [SKIP][2] ([Intel XE#6703]) -> [DMESG-FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x256.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-bmg:          [SKIP][4] ([Intel XE#6703]) -> [SKIP][5] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html

  
Known issues
------------

  Here are the changes found in xe-pw-158874v5_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [PASS][6] -> [SKIP][7] ([Intel XE#6779])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-bmg:          [PASS][8] -> [FAIL][9] ([Intel XE#4674])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#607])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][12] -> [SKIP][13] ([Intel XE#2314] / [Intel XE#2894])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2252])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2390])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-bmg:          [PASS][18] -> [SKIP][19] ([Intel XE#2291]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_fb_coherency@memset-crc@mmap-offset-wc:
    - shard-bmg:          NOTRUN -> [CRASH][20] ([Intel XE#6706])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2316]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2316]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [PASS][24] -> [FAIL][25] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2293]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2293] / [Intel XE#2380])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2380])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#2311])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2312]) +8 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2313])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#4141])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-bmg:          [PASS][33] -> [ABORT][34] ([Intel XE#6740]) +1 other test abort
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@bpc-switch@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [ABORT][35] ([Intel XE#6740]) +1 other test abort
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html

  * igt@kms_pipe_crc_basic@disable-crc-after-crtc:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#6557] / [Intel XE#6703]) +6 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#6886]) +3 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#6693]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr@fbc-pr-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#6361])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@xe_eudebug_online@pagefault-write-stress:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#6665] / [Intel XE#6681])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_eudebug_online@pagefault-write-stress.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][45] -> [INCOMPLETE][46] ([Intel XE#6321])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2322])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_multi_queue@two-queues-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#6874]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html

  * igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#4943])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html

  * igt@xe_exec_system_allocator@once-mmap-new-nomemset:
    - shard-bmg:          [PASS][50] -> [SKIP][51] ([Intel XE#6703]) +580 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2229])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2459] / [Intel XE#2596])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_media_fill@media-fill.html

  * igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#6251]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-rpm:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#4733])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [SKIP][58] ([Intel XE#6779]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@fbdev@unaligned-read:
    - shard-bmg:          [SKIP][60] ([Intel XE#2134]) -> [PASS][61] +2 other tests pass
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@fbdev@unaligned-read.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@fbdev@unaligned-read.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-bmg:          [SKIP][62] ([Intel XE#2291]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:
    - shard-bmg:          [FAIL][64] ([Intel XE#5299]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html

  * igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:
    - shard-bmg:          [SKIP][66] ([Intel XE#2316]) -> [PASS][67] +2 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-10/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-bmg:          [SKIP][68] ([Intel XE#6693]) -> [PASS][69] +2 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_pm_rpm@basic-rte.html

  * igt@testdisplay:
    - shard-bmg:          [ABORT][70] ([Intel XE#6740]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-1/igt@testdisplay.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@testdisplay.html

  * igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:
    - shard-bmg:          [SKIP][72] ([Intel XE#6557] / [Intel XE#6703]) -> [PASS][73] +5 other tests pass
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html

  * igt@xe_exec_system_allocator@many-free-race-nomemset:
    - shard-bmg:          [SKIP][74] ([Intel XE#6703]) -> [PASS][75] +294 other tests pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_system_allocator@many-free-race-nomemset.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@xe_exec_system_allocator@many-free-race-nomemset.html

  * igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:
    - shard-lnl:          [FAIL][76] ([Intel XE#6251]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-bmg:          [SKIP][78] ([Intel XE#2370]) -> [SKIP][79] ([Intel XE#6703])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          [SKIP][80] ([Intel XE#6703]) -> [SKIP][81] ([Intel XE#2327]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          [SKIP][82] ([Intel XE#2327]) -> [SKIP][83] ([Intel XE#6703]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-bmg:          [SKIP][84] ([Intel XE#2328]) -> [SKIP][85] ([Intel XE#6703])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][86] ([Intel XE#1124]) -> [SKIP][87] ([Intel XE#6703]) +9 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-bmg:          [SKIP][88] ([Intel XE#6703]) -> [SKIP][89] ([Intel XE#1124]) +4 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          [SKIP][90] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][91] ([Intel XE#6703])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          [SKIP][92] ([Intel XE#367]) -> [SKIP][93] ([Intel XE#6703]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          [SKIP][94] ([Intel XE#6703]) -> [SKIP][95] ([Intel XE#367]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][96] ([Intel XE#2887]) -> [SKIP][97] ([Intel XE#6557] / [Intel XE#6703])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][98] ([Intel XE#6703]) -> [SKIP][99] ([Intel XE#3432])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][100] ([Intel XE#6703]) -> [SKIP][101] ([Intel XE#2652] / [Intel XE#787])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-bmg:          [SKIP][102] ([Intel XE#3432]) -> [SKIP][103] ([Intel XE#6703])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:
    - shard-bmg:          [SKIP][104] ([Intel XE#6703]) -> [SKIP][105] ([Intel XE#2887]) +7 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][106] ([Intel XE#2887]) -> [SKIP][107] ([Intel XE#6703]) +15 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][108] ([Intel XE#6703]) -> [SKIP][109] ([Intel XE#2325]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][110] ([Intel XE#2252]) -> [SKIP][111] ([Intel XE#6703]) +9 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-bmg:          [SKIP][112] ([Intel XE#6703]) -> [SKIP][113] ([Intel XE#2252]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-suspend-resume:
    - shard-bmg:          [SKIP][114] ([Intel XE#6743]) -> [SKIP][115] ([Intel XE#6703])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_content_protection@dp-mst-suspend-resume.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html

  * igt@kms_content_protection@suspend-resume:
    - shard-bmg:          [SKIP][116] ([Intel XE#6703]) -> [FAIL][117] ([Intel XE#1178])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_content_protection@suspend-resume.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_content_protection@suspend-resume.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][118] ([Intel XE#2341]) -> [SKIP][119] ([Intel XE#6703])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_content_protection@type1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][120] ([Intel XE#6703]) -> [SKIP][121] ([Intel XE#2320]) +2 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          [SKIP][122] ([Intel XE#6703]) -> [SKIP][123] ([Intel XE#2321])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-bmg:          [SKIP][124] ([Intel XE#2320]) -> [SKIP][125] ([Intel XE#6557] / [Intel XE#6703])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          [SKIP][126] ([Intel XE#2320]) -> [SKIP][127] ([Intel XE#6703]) +5 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][128] ([Intel XE#2291]) -> [SKIP][129] ([Intel XE#6703])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-bmg:          [SKIP][130] ([Intel XE#6703]) -> [SKIP][131] ([Intel XE#2286])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          [SKIP][132] ([Intel XE#4354]) -> [SKIP][133] ([Intel XE#6703])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][134] ([Intel XE#6703]) -> [SKIP][135] ([Intel XE#2244])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_fb_coherency@memset-crc:
    - shard-bmg:          [SKIP][136] ([Intel XE#6703]) -> [CRASH][137] ([Intel XE#6706])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_fb_coherency@memset-crc.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          [SKIP][138] ([Intel XE#4422]) -> [SKIP][139] ([Intel XE#6703]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][140] ([Intel XE#2373]) -> [SKIP][141] ([Intel XE#6703])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [SKIP][142] ([Intel XE#2316]) -> [SKIP][143] ([Intel XE#6703])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][144] ([Intel XE#6703]) -> [SKIP][145] ([Intel XE#2380])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][146] ([Intel XE#6703]) -> [SKIP][147] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][148] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][149] ([Intel XE#6557] / [Intel XE#6703])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][150] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][151] ([Intel XE#6703]) +3 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][152] ([Intel XE#2311]) -> [SKIP][153] ([Intel XE#6703]) +22 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-bmg:          [SKIP][154] ([Intel XE#6703]) -> [SKIP][155] ([Intel XE#2311]) +14 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][156] ([Intel XE#6703]) -> [SKIP][157] ([Intel XE#4141]) +6 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][158] ([Intel XE#4141]) -> [SKIP][159] ([Intel XE#2312]) +4 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][160] ([Intel XE#4141]) -> [SKIP][161] ([Intel XE#6703]) +9 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][162] ([Intel XE#2312]) -> [SKIP][163] ([Intel XE#4141])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][164] ([Intel XE#2312]) -> [SKIP][165] ([Intel XE#6557] / [Intel XE#6703]) +1 other test skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][166] ([Intel XE#2311]) -> [SKIP][167] ([Intel XE#2312]) +6 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][168] ([Intel XE#2312]) -> [SKIP][169] ([Intel XE#2311]) +5 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][170] ([Intel XE#6703]) -> [SKIP][171] ([Intel XE#2352])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-bmg:          [SKIP][172] ([Intel XE#2313]) -> [SKIP][173] ([Intel XE#6703]) +25 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-bmg:          [SKIP][174] ([Intel XE#6703]) -> [SKIP][175] ([Intel XE#2313]) +15 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][176] ([Intel XE#2313]) -> [SKIP][177] ([Intel XE#2312]) +8 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][178] ([Intel XE#2312]) -> [SKIP][179] ([Intel XE#2313]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][180] ([Intel XE#2312]) -> [SKIP][181] ([Intel XE#6703]) +9 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][182] ([Intel XE#6703]) -> [SKIP][183] ([Intel XE#3544])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][184] ([Intel XE#1503]) -> [SKIP][185] ([Intel XE#6703])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [SKIP][186] ([Intel XE#6703]) -> [ABORT][187] ([Intel XE#6740]) +1 other test abort
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          [SKIP][188] ([Intel XE#6703]) -> [SKIP][189] ([Intel XE#6901])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          [SKIP][190] ([Intel XE#2486]) -> [SKIP][191] ([Intel XE#6703])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_panel_fitting@legacy.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][192] ([Intel XE#4596]) -> [SKIP][193] ([Intel XE#5021])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-bmg:          [SKIP][194] ([Intel XE#4596]) -> [SKIP][195] ([Intel XE#6703])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-bmg:          [SKIP][196] ([Intel XE#5020]) -> [SKIP][197] ([Intel XE#6703])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75:
    - shard-bmg:          [SKIP][198] ([Intel XE#6703]) -> [SKIP][199] ([Intel XE#6886])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          [SKIP][200] ([Intel XE#870]) -> [SKIP][201] ([Intel XE#6703]) +1 other test skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_pm_backlight@fade.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][202] ([Intel XE#6703]) -> [SKIP][203] ([Intel XE#870])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-bmg:          [SKIP][204] ([Intel XE#2505]) -> [SKIP][205] ([Intel XE#6703])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][206] ([Intel XE#1439] / [Intel XE#836]) -> [SKIP][207] ([Intel XE#6693])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-bmg:          [SKIP][208] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][209] ([Intel XE#1406] / [Intel XE#1489]) +4 other tests skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          [SKIP][210] ([Intel XE#1406] / [Intel XE#1489]) -> [SKIP][211] ([Intel XE#1406] / [Intel XE#6703]) +6 other tests skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][212] ([Intel XE#1406] / [Intel XE#2387]) -> [SKIP][213] ([Intel XE#1406] / [Intel XE#6703])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          [SKIP][214] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][215] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-blt.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-primary-page-flip:
    - shard-bmg:          [SKIP][216] ([Intel XE#1406] / [Intel XE#2234] / [Intel XE#2850]) -> [SKIP][217] ([Intel XE#1406] / [Intel XE#6703]) +13 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][218] ([Intel XE#1406] / [Intel XE#6703]) -> [SKIP][219] ([Intel XE#1406] / [Intel XE#2414])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][220] ([Intel XE#6703]) -> [SKIP][221] ([Intel XE#3414] / [Intel XE#3904]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][222] ([Intel XE#2330]) -> [SKIP][223] ([Intel XE#6703]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][224] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][225] ([Intel XE#6703])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sharpness_filter@filter-modifiers:
    - shard-bmg:          [SKIP][226] ([Intel XE#6703]) -> [SKIP][227] ([Intel XE#6503])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_sharpness_filter@filter-modifiers.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_sharpness_filter@filter-modifiers.html

  * igt@kms_sharpness_filter@invalid-filter-with-plane:
    - shard-bmg:          [SKIP][228] ([Intel XE#6503]) -> [SKIP][229] ([Intel XE#6703]) +1 other test skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][230] ([Intel XE#2426]) -> [SKIP][231] ([Intel XE#6703])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][232] ([Intel XE#6703]) -> [SKIP][233] ([Intel XE#1499])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_vrr@flip-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@seamless-rr-switch-drrs:
    - shard-bmg:          [SKIP][234] ([Intel XE#1499]) -> [SKIP][235] ([Intel XE#6703])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-drrs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html

  * igt@xe_eudebug@basic-vm-access-userptr:
    - shard-bmg:          [SKIP][236] ([Intel XE#4837]) -> [SKIP][237] ([Intel XE#6703]) +5 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][238] ([Intel XE#6703]) -> [SKIP][239] ([Intel XE#4837]) +4 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug_online@pagefault-one-of-many:
    - shard-bmg:          [SKIP][240] ([Intel XE#6665]) -> [SKIP][241] ([Intel XE#6703])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][242] ([Intel XE#4837] / [Intel XE#6665]) -> [SKIP][243] ([Intel XE#6703]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_eudebug_online@pagefault-write.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_eudebug_online@single-step:
    - shard-bmg:          [SKIP][244] ([Intel XE#6703]) -> [SKIP][245] ([Intel XE#4837] / [Intel XE#6665]) +3 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_eudebug_online@single-step.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_eudebug_online@single-step.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][246] ([Intel XE#6703]) -> [SKIP][247] ([Intel XE#2322]) +3 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][248] ([Intel XE#2322]) -> [SKIP][249] ([Intel XE#6703]) +7 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:
    - shard-bmg:          [SKIP][250] ([Intel XE#6874]) -> [SKIP][251] ([Intel XE#6703]) +30 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:
    - shard-bmg:          [SKIP][252] ([Intel XE#6703]) -> [SKIP][253] ([Intel XE#6874]) +21 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html

  * igt@xe_exec_system_allocator@many-64k-mmap-huge:
    - shard-bmg:          [SKIP][254] ([Intel XE#5007]) -> [SKIP][255] ([Intel XE#6703]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_exec_system_allocator@many-64k-mmap-huge.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:
    - shard-bmg:          [SKIP][256] ([Intel XE#4943]) -> [SKIP][257] ([Intel XE#6703]) +23 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:
    - shard-bmg:          [SKIP][258] ([Intel XE#6703]) -> [SKIP][259] ([Intel XE#4943]) +20 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          [SKIP][260] ([Intel XE#6281]) -> [SKIP][261] ([Intel XE#6703])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][262] ([Intel XE#1420]) -> [SKIP][263] ([Intel XE#6703])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-bmg:          [SKIP][264] ([Intel XE#6703]) -> [SKIP][265] ([Intel XE#2284])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3hot-i2c:
    - shard-bmg:          [SKIP][266] ([Intel XE#5742]) -> [SKIP][267] ([Intel XE#6703])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_pm@d3hot-i2c.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:
    - shard-bmg:          [SKIP][268] ([Intel XE#4733]) -> [SKIP][269] ([Intel XE#6703]) +2 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][270] ([Intel XE#6703]) -> [SKIP][271] ([Intel XE#944]) +1 other test skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-query:
    - shard-bmg:          [SKIP][272] ([Intel XE#944]) -> [SKIP][273] ([Intel XE#6703]) +2 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@xe_query@multigpu-query-invalid-query.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          [FAIL][274] ([Intel XE#6569]) -> [SKIP][275] ([Intel XE#6703])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4674]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#5007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6557]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665
  [Intel XE#6681]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681
  [Intel XE#6693]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693
  [Intel XE#6703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703
  [Intel XE#6706]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706
  [Intel XE#6740]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740
  [Intel XE#6743]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743
  [Intel XE#6779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779
  [Intel XE#6874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864 -> xe-pw-158874v5

  IGT_8670: 8670
  xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864: b8b72578c50083961ef150f128e6e8c0c3396864
  xe-pw-158874v5: 158874v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/index.html

--===============8549177365573130648==
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
<tr><td><b>Series:</b></td><td>PF: Add handling for new adverse event thresholds (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158874/">https://patchwork.freedesktop.org/series/158874/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864_FULL -&gt; xe-pw-158874v5_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-158874v5_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-158874v5_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-158874v5_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x256@pipe-d-dp-2.html">DMESG-FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-158874v5_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@core_hotunplug@unplug-rescan.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4674">Intel XE#4674</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc@mmap-offset-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_fb_coherency@memset-crc@mmap-offset-wc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_flip@2x-blocking-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_hdr@bpc-switch-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@disable-crc-after-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pipe_crc_basic@disable-crc-after-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_psr@fbc-pr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-2/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-3/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6361">Intel XE#6361</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_eudebug_online@pagefault-write-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6681">Intel XE#6681</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_exec_multi_queue@two-queues-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_exec_system_allocator@once-mmap-free-huge-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@once-mmap-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_system_allocator@once-mmap-new-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +580 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-2/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-3/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_decode0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-rpm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@xe_pxp@pxp-stale-bo-exec-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6779">Intel XE#6779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-read:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@fbdev@unaligned-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@fbdev@unaligned-read.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic-transitions.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-10/igt@kms_flip@2x-flip-vs-wf_vblank-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_pm_rpm@basic-rte.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-1/igt@testdisplay.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@testdisplay.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@xe_exec_balancer@many-parallel-userptr-invalidate-race.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free-race-nomemset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_system_allocator@many-free-race-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@xe_exec_system_allocator@many-free-race-nomemset.html">PASS</a> +294 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251">Intel XE#6251</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-lnl-8/igt@xe_pmu@engine-activity-accuracy-90@engine-drm_xe_engine_class_compute0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_big_fb@linear-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2328">Intel XE#2328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_bw@linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6743">Intel XE#6743</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_content_protection@dp-mst-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_content_protection@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_content_protection@suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_content_protection@type1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-8/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fb_coherency@memset-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_fb_coherency@memset-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_fb_coherency@memset-crc.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6706">Intel XE#6706</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6557">Intel XE#6557</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-10/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_hdr@static-toggle-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740">Intel XE#6740</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-10/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6693">Intel XE#6693</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-modifiers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_sharpness_filter@filter-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@kms_sharpness_filter@filter-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-plane:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_sharpness_filter@invalid-filter-with-plane.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@kms_vrr@seamless-rr-switch-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_eudebug@basic-vm-access-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-one-of-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_eudebug_online@pagefault-one-of-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_eudebug_online@single-step.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665">Intel XE#6665</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6874">Intel XE#6874</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-64k-mmap-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007">Intel XE#5007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_system_allocator@many-64k-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_exec_system_allocator@process-many-large-execqueues-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_exec_system_allocator@threads-many-stride-mmap-new-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420">Intel XE#1420</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-3/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Intel XE#5742</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_pm@d3hot-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-8/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_pxp@pxp-stale-bo-bind-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-5/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-9/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-query:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-4/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_query@multigpu-query-invalid-query.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864/shard-bmg-10/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158874v5/shard-bmg-5/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6703">Intel XE#6703</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864 -&gt; xe-pw-158874v5</li>
</ul>
<p>IGT_8670: 8670<br />
  xe-4260-b8b72578c50083961ef150f128e6e8c0c3396864: b8b72578c50083961ef150f128e6e8c0c3396864<br />
  xe-pw-158874v5: 158874v5</p>

</body>
</html>

--===============8549177365573130648==--
