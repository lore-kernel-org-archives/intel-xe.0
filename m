Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD22C54FDF
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jul 2026 07:18:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322B6890CE;
	Thu, 30 Jul 2026 07:18:08 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEC1610E66C;
 Thu, 30 Jul 2026 07:18:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2866861794296001363=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/xe=3A_make_CTX=5FTIMES?=
 =?utf-8?q?TAMP_TOCTOU-safe_and_handle_sentinels_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gajendra Uttamchand" <gajendra.uttamchand@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 30 Jul 2026 07:18:06 -0000
Message-ID: <178539588676.3374.14059782275413181726@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260730052343.1205472-5-gajendra.uttamchand@intel.com>
In-Reply-To: <20260730052343.1205472-5-gajendra.uttamchand@intel.com>
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

--===============2866861794296001363==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: make CTX_TIMESTAMP TOCTOU-safe and handle sentinels (rev8)
URL   : https://patchwork.freedesktop.org/series/168394/
State : failure

== Summary ==

CI Bug Log - changes from xe-5507-593120331e000d147d0c405b446c82de0740c57e_FULL -> xe-pw-168394v8_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-168394v8_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-168394v8_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-168394v8_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-dp-2.html

  
Known issues
------------

  Here are the changes found in xe-pw-168394v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-bmg:          NOTRUN -> [FAIL][2] ([Intel XE#8714]) +1 other test fail
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@core_getversion@basic.html

  * igt@intel_hwmon@hwmon-read:
    - shard-bmg:          [PASS][3] -> [SKIP][4] ([Intel XE#5177] / [Intel XE#8714])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@intel_hwmon@hwmon-read.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@intel_hwmon@hwmon-read.html

  * igt@kms_big_fb@linear-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327]) +3 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][6] ([Intel XE#610] / [Intel XE#7387])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124]) +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2887]) +9 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][9] -> [INCOMPLETE][10] ([Intel XE#7084] / [Intel XE#8150]) +1 other test incomplete
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2652]) +8 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2724] / [Intel XE#7449])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][13] ([Intel XE#2252]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][14] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +3 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#2390] / [Intel XE#6974])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#6974])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2320]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2321] / [Intel XE#7355])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-bmg:          NOTRUN -> [SKIP][19] ([Intel XE#8265]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-bmg:          NOTRUN -> [SKIP][20] ([Intel XE#4422] / [Intel XE#7442]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#7178] / [Intel XE#7349])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#4141]) +6 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2311]) +31 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#7061]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2313]) +21 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#6911] / [Intel XE#7378])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#7283]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#8395] / [Intel XE#8396])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#8396]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [PASS][34] -> [FAIL][35] ([Intel XE#8399])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#8710] / [Intel XE#8714])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_pm_rpm@legacy-planes-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#1489]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#2387] / [Intel XE#7429])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@psr2-cursor-plane-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_psr@psr2-cursor-plane-onoff.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#6503]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#1499]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_vrr@max-min.html

  * igt@xe_exec_basic@multigpu-once-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2322] / [Intel XE#7372]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr-rebind.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#8374]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#8364]) +13 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@xe_exec_multi_queue@many-queues-basic-smem.html

  * igt@xe_exec_reset@multi-queue-close-fd:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#8369])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@xe_exec_reset@multi-queue-close-fd.html

  * igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#8714]) +135 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset.html

  * igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][48] ([Intel XE#8378]) +2 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][49] -> [SKIP][50] ([Intel XE#8714]) +658 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][51] -> [SKIP][52] ([Intel XE#2229]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_live_ktest@xe_bo.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_multigpu_svm@mgpu-pagefault-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#6964])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefault-prefetch.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#7793])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#7695])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@xe_pat@pat-sw-hw-suspend.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#944])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][57] ([Intel XE#5545])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-bmg:          [ABORT][58] ([Intel XE#8007]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@core_hotunplug@hotrebind.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@core_hotunplug@hotrebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][60] ([Intel XE#8714]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@eof:
    - shard-bmg:          [SKIP][62] ([Intel XE#2134]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@fbdev@eof.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@fbdev@eof.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [SKIP][64] ([Intel XE#5177]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@intel_hwmon@hwmon-write.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@intel_hwmon@hwmon-write.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][66] ([Intel XE#301]) -> [PASS][67] +1 other test pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:
    - shard-bmg:          [SKIP][68] ([Intel XE#8714]) -> [PASS][69] +675 other tests pass
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_pmu@engine-activity-accuracy-50:
    - shard-bmg:          [FAIL][70] ([Intel XE#8555]) -> [PASS][71] +4 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_pmu@engine-activity-accuracy-50.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@xe_pmu@engine-activity-accuracy-50.html

  
#### Warnings ####

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][72] ([Intel XE#8714]) -> [SKIP][73] ([Intel XE#2327]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][74] ([Intel XE#2327]) -> [SKIP][75] ([Intel XE#8714])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [SKIP][76] ([Intel XE#8714]) -> [SKIP][77] ([Intel XE#7059] / [Intel XE#7085])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [SKIP][78] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][79] ([Intel XE#8714])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-bmg:          [SKIP][80] ([Intel XE#8714]) -> [SKIP][81] ([Intel XE#1124]) +9 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          [SKIP][82] ([Intel XE#1124]) -> [SKIP][83] ([Intel XE#8714]) +9 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][84] ([Intel XE#8714]) -> [SKIP][85] ([Intel XE#7679])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          [SKIP][86] ([Intel XE#7679]) -> [SKIP][87] ([Intel XE#8714]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][88] ([Intel XE#8714]) -> [SKIP][89] ([Intel XE#367]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][90] ([Intel XE#367]) -> [SKIP][91] ([Intel XE#8714])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:
    - shard-bmg:          [SKIP][92] ([Intel XE#8714]) -> [SKIP][93] ([Intel XE#2887]) +12 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_ccs@bad-aux-stride-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][94] ([Intel XE#2652]) -> [SKIP][95] ([Intel XE#8714])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][96] ([Intel XE#3432]) -> [SKIP][97] ([Intel XE#8714])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][98] ([Intel XE#2887]) -> [SKIP][99] ([Intel XE#8714]) +13 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][100] ([Intel XE#8714]) -> [SKIP][101] ([Intel XE#2724] / [Intel XE#7449])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cdclk@mode-transition-all-outputs.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_audio@hdmi-audio-after-suspend:
    - shard-bmg:          [SKIP][102] ([Intel XE#2252]) -> [SKIP][103] ([Intel XE#8714]) +8 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          [SKIP][104] ([Intel XE#2325] / [Intel XE#7358]) -> [SKIP][105] ([Intel XE#8714])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_chamelium_color@ctm-0-50.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          [SKIP][106] ([Intel XE#8714]) -> [SKIP][107] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_color_pipeline@plane-lut1d:
    - shard-bmg:          [SKIP][108] ([Intel XE#7358]) -> [SKIP][109] ([Intel XE#8714])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-lut1d.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_chamelium_color_pipeline@plane-lut1d.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][110] ([Intel XE#8714]) -> [SKIP][111] ([Intel XE#2252]) +6 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][112] ([Intel XE#7642]) -> [SKIP][113] ([Intel XE#8714]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_content_protection@content-type-change.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:
    - shard-bmg:          [SKIP][114] ([Intel XE#8714]) -> [SKIP][115] ([Intel XE#6974])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          [SKIP][116] ([Intel XE#2390] / [Intel XE#6974]) -> [SKIP][117] ([Intel XE#8714])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_content_protection@dp-mst-lic-type-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-bmg:          [SKIP][118] ([Intel XE#8714]) -> [FAIL][119] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@legacy-hdcp14.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          [SKIP][120] ([Intel XE#8714]) -> [SKIP][121] ([Intel XE#7642])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_content_protection@type1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-bmg:          [SKIP][122] ([Intel XE#8714]) -> [SKIP][123] ([Intel XE#2320]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-bmg:          [SKIP][124] ([Intel XE#2320]) -> [SKIP][125] ([Intel XE#8714]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_cursor_crc@cursor-offscreen-256x85.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-bmg:          [SKIP][126] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][127] ([Intel XE#8714])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_cursor_crc@cursor-random-512x512.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-256x256:
    - shard-bmg:          [SKIP][128] ([Intel XE#8714]) -> [FAIL][129] ([Intel XE#8117])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-256x256.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding-256x256.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [FAIL][130] ([Intel XE#7571]) -> [SKIP][131] ([Intel XE#8714])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][132] ([Intel XE#1508]) -> [SKIP][133] ([Intel XE#8714])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-bmg:          [SKIP][134] ([Intel XE#8714]) -> [SKIP][135] ([Intel XE#4354] / [Intel XE#5882])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dp_link_training@non-uhbr-mst.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dsc@dsc-with-output-formats-bigjoiner:
    - shard-bmg:          [SKIP][136] ([Intel XE#8265]) -> [SKIP][137] ([Intel XE#8714]) +3 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          [SKIP][138] ([Intel XE#8714]) -> [SKIP][139] ([Intel XE#8265]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-bmg:          [SKIP][140] ([Intel XE#8714]) -> [SKIP][141] ([Intel XE#4422] / [Intel XE#7442])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          [SKIP][142] ([Intel XE#4156] / [Intel XE#7425]) -> [SKIP][143] ([Intel XE#8714])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_fbcon_fbt@fbc.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_fbcon_fbt@psr:
    - shard-bmg:          [SKIP][144] ([Intel XE#8714]) -> [SKIP][145] ([Intel XE#8680])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fbcon_fbt@psr.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][146] ([Intel XE#8714]) -> [SKIP][147] ([Intel XE#2373] / [Intel XE#7448])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_feature_discovery@display-3x.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          [SKIP][148] ([Intel XE#8586]) -> [SKIP][149] ([Intel XE#8714])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_feature_discovery@dsc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_feature_discovery@dsc.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][150] ([Intel XE#8714]) -> [SKIP][151] ([Intel XE#2374] / [Intel XE#6127])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_feature_discovery@psr1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][152] ([Intel XE#8714]) -> [SKIP][153] ([Intel XE#7178] / [Intel XE#7349]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][154] ([Intel XE#7178] / [Intel XE#7351]) -> [SKIP][155] ([Intel XE#8714]) +3 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          [SKIP][156] ([Intel XE#8714]) -> [SKIP][157] ([Intel XE#7178] / [Intel XE#7351]) +4 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:
    - shard-bmg:          [SKIP][158] ([Intel XE#7179]) -> [SKIP][159] ([Intel XE#8714])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][160] ([Intel XE#2311]) -> [SKIP][161] ([Intel XE#8714]) +57 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][162] ([Intel XE#7061]) -> [SKIP][163] ([Intel XE#8714]) +1 other test skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:
    - shard-bmg:          [SKIP][164] ([Intel XE#4141]) -> [SKIP][165] ([Intel XE#8714]) +14 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-linear:
    - shard-bmg:          [SKIP][166] ([Intel XE#8714]) -> [SKIP][167] ([Intel XE#4141]) +14 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-linear.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][168] ([Intel XE#8714]) -> [SKIP][169] ([Intel XE#2311]) +66 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-tiling-y:
    - shard-bmg:          [SKIP][170] ([Intel XE#7399]) -> [SKIP][171] ([Intel XE#8714])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbchdr-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:
    - shard-bmg:          [SKIP][172] ([Intel XE#8714]) -> [SKIP][173] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:
    - shard-bmg:          [SKIP][174] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][175] ([Intel XE#8714]) +4 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][176] ([Intel XE#2313]) -> [SKIP][177] ([Intel XE#8714]) +58 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          [SKIP][178] ([Intel XE#8714]) -> [SKIP][179] ([Intel XE#7061]) +6 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][180] ([Intel XE#8714]) -> [SKIP][181] ([Intel XE#2313]) +59 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-bmg:          [SKIP][182] ([Intel XE#8714]) -> [SKIP][183] ([Intel XE#7308])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_hdmi_inject@inject-audio.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][184] ([Intel XE#1503]) -> [SKIP][185] ([Intel XE#8714])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          [SKIP][186] ([Intel XE#6901]) -> [SKIP][187] ([Intel XE#8714])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_joiner@invalid-modeset-big-joiner.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][188] ([Intel XE#6911] / [Intel XE#7466]) -> [SKIP][189] ([Intel XE#8714])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-bmg:          [SKIP][190] ([Intel XE#8714]) -> [SKIP][191] ([Intel XE#4090] / [Intel XE#7443])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][192] ([Intel XE#7591]) -> [SKIP][193] ([Intel XE#8714])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_pipe_stress@stress-xrgb8888-yftiled:
    - shard-bmg:          [SKIP][194] ([Intel XE#6912] / [Intel XE#7375]) -> [SKIP][195] ([Intel XE#8714])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:
    - shard-bmg:          [SKIP][196] ([Intel XE#7283]) -> [SKIP][197] ([Intel XE#8714]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-bmg:          [SKIP][198] ([Intel XE#8714]) -> [SKIP][199] ([Intel XE#7283]) +8 other tests skip
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-bmg:          [SKIP][200] ([Intel XE#8714]) -> [SKIP][201] ([Intel XE#2393])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plane_lowres@tiling-yf.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:
    - shard-bmg:          [SKIP][202] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][203] ([Intel XE#8714])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-bmg:          [SKIP][204] ([Intel XE#2938] / [Intel XE#7376] / [Intel XE#7760]) -> [SKIP][205] ([Intel XE#8714])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_pm_backlight@brightness-with-dpms.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          [SKIP][206] ([Intel XE#8714]) -> [SKIP][207] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_backlight@fade-with-dpms.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-bmg:          [SKIP][208] ([Intel XE#7376] / [Intel XE#7760] / [Intel XE#870]) -> [SKIP][209] ([Intel XE#8714])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_pm_backlight@fade-with-suspend.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-after-dc6:
    - shard-bmg:          [SKIP][210] ([Intel XE#8714]) -> [SKIP][211] ([Intel XE#8395] / [Intel XE#8396])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_dc@dc3co-after-dc6.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6.html

  * igt@kms_pm_dc@dc5-retention-flops:
    - shard-bmg:          [SKIP][212] ([Intel XE#8714]) -> [SKIP][213] ([Intel XE#3309] / [Intel XE#7368])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_dc@dc5-retention-flops.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_pm_dc@dc5-retention-flops.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][214] ([Intel XE#7794]) -> [SKIP][215] ([Intel XE#8714])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_pm_dc@dc6-psr.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][216] ([Intel XE#8714]) -> [SKIP][217] ([Intel XE#1439] / [Intel XE#7402] / [Intel XE#836])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][218] ([Intel XE#8714]) -> [SKIP][219] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          [SKIP][220] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836]) -> [SKIP][221] ([Intel XE#8714])
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@package-g7:
    - shard-bmg:          [SKIP][222] ([Intel XE#6814] / [Intel XE#7428]) -> [SKIP][223] ([Intel XE#8714])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_pm_rpm@package-g7.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:
    - shard-bmg:          [SKIP][224] ([Intel XE#8714]) -> [SKIP][225] ([Intel XE#1489]) +7 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          [SKIP][226] ([Intel XE#1489]) -> [SKIP][227] ([Intel XE#8714]) +7 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-bmg:          [SKIP][228] ([Intel XE#8714]) -> [SKIP][229] ([Intel XE#2387] / [Intel XE#7429])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2_su@page_flip-nv12.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          [SKIP][230] ([Intel XE#2387] / [Intel XE#7429]) -> [SKIP][231] ([Intel XE#8714])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_psr2_su@page_flip-p010.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-bmg:          [SKIP][232] ([Intel XE#8714]) -> [SKIP][233] ([Intel XE#2234] / [Intel XE#2850]) +10 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-bmg:          [SKIP][234] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][235] ([Intel XE#8714]) +11 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_psr@psr2-no-drrs.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          [SKIP][236] ([Intel XE#8714]) -> [SKIP][237] ([Intel XE#2234])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@psr2-primary-render.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_psr@psr2-primary-render.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][238] ([Intel XE#8714]) -> [SKIP][239] ([Intel XE#7795])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][240] ([Intel XE#8714]) -> [SKIP][241] ([Intel XE#2330] / [Intel XE#5813])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-bmg:          [SKIP][242] ([Intel XE#8714]) -> [SKIP][243] ([Intel XE#3904] / [Intel XE#7342])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-bmg:          [SKIP][244] ([Intel XE#3904] / [Intel XE#7342]) -> [SKIP][245] ([Intel XE#8714])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][246] ([Intel XE#2330] / [Intel XE#5813]) -> [SKIP][247] ([Intel XE#8714])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][248] ([Intel XE#2413]) -> [SKIP][249] ([Intel XE#8714]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_scaling_modes@scaling-mode-center.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][250] ([Intel XE#8714]) -> [SKIP][251] ([Intel XE#2413])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-full.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][252] ([Intel XE#8714]) -> [SKIP][253] ([Intel XE#1435] / [Intel XE#8695])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_sharpness_filter@filter-tap:
    - shard-bmg:          [SKIP][254] ([Intel XE#6503]) -> [SKIP][255] ([Intel XE#8714]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_sharpness_filter@filter-tap.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_sharpness_filter@filter-tap.html

  * igt@kms_sharpness_filter@invalid-filter-with-scaler:
    - shard-bmg:          [SKIP][256] ([Intel XE#8714]) -> [SKIP][257] ([Intel XE#6503]) +2 other tests skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_sharpness_filter@invalid-filter-with-scaler.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_sharpness_filter@invalid-filter-with-scaler.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][258] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][259] ([Intel XE#1729] / [Intel XE#7424])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][260] ([Intel XE#8714]) -> [SKIP][261] ([Intel XE#2509] / [Intel XE#7437])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][262] ([Intel XE#1499]) -> [SKIP][263] ([Intel XE#8714]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_vrr@flip-suspend.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-bmg:          [SKIP][264] ([Intel XE#6599]) -> [SKIP][265] ([Intel XE#8714]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@xe_compute@ccs-mode-basic.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_configfs@ctx-restore-post-bb-invalid:
    - shard-bmg:          [SKIP][266] ([Intel XE#8714]) -> [ABORT][267] ([Intel XE#8007])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_configfs@ctx-restore-post-bb-invalid.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/igt@xe_configfs@ctx-restore-post-bb-invalid.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          [SKIP][268] ([Intel XE#2504] / [Intel XE#7319] / [Intel XE#7350]) -> [SKIP][269] ([Intel XE#8714])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_create@multigpu-create-massive-size.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-bmg:          [INCOMPLETE][270] ([Intel XE#6321] / [Intel XE#8355]) -> [SKIP][271] ([Intel XE#8714])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [SKIP][272] ([Intel XE#8714]) -> [INCOMPLETE][273] ([Intel XE#6321] / [Intel XE#8355])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict@evict-mixed-many-threads-small.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          [SKIP][274] ([Intel XE#8714]) -> [SKIP][275] ([Intel XE#8370]) +1 other test skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict@evict-small-multi-queue-cm.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict@evict-threads-small-multi-queue:
    - shard-bmg:          [SKIP][276] ([Intel XE#8370]) -> [SKIP][277] ([Intel XE#8714]) +2 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_evict@evict-threads-small-multi-queue.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_evict@evict-threads-small-multi-queue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-bmg:          [SKIP][278] ([Intel XE#8714]) -> [SKIP][279] ([Intel XE#2322] / [Intel XE#7372]) +9 other tests skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-bmg:          [SKIP][280] ([Intel XE#2322] / [Intel XE#7372]) -> [SKIP][281] ([Intel XE#8714]) +8 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:
    - shard-bmg:          [SKIP][282] ([Intel XE#8714]) -> [SKIP][283] ([Intel XE#8374]) +11 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr:
    - shard-bmg:          [SKIP][284] ([Intel XE#8374]) -> [SKIP][285] ([Intel XE#8714]) +12 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html

  * igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:
    - shard-bmg:          [SKIP][286] ([Intel XE#8364]) -> [SKIP][287] ([Intel XE#8714]) +24 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate.html

  * igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:
    - shard-bmg:          [SKIP][288] ([Intel XE#8714]) -> [SKIP][289] ([Intel XE#8364]) +24 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority.html

  * igt@xe_exec_reset@multi-queue-cat-error-on-secondary:
    - shard-bmg:          [SKIP][290] ([Intel XE#8714]) -> [SKIP][291] ([Intel XE#8369]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:
    - shard-bmg:          [SKIP][292] ([Intel XE#8378]) -> [SKIP][293] ([Intel XE#8714]) +8 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          [SKIP][294] ([Intel XE#8714]) -> [SKIP][295] ([Intel XE#8378]) +10 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init:
    - shard-bmg:          [ABORT][296] ([Intel XE#8007]) -> [SKIP][297] ([Intel XE#8714])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init.html

  * igt@xe_gpgpu_fill@offset-4x4:
    - shard-bmg:          [SKIP][298] ([Intel XE#8714]) -> [SKIP][299] ([Intel XE#7954])
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_gpgpu_fill@offset-4x4.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_gpgpu_fill@offset-4x4.html

  * igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:
    - shard-bmg:          [SKIP][300] ([Intel XE#6964]) -> [SKIP][301] ([Intel XE#6964] / [Intel XE#8714]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html

  * igt@xe_page_reclaim@pde-vs-pd:
    - shard-bmg:          [SKIP][302] ([Intel XE#7793]) -> [SKIP][303] ([Intel XE#8714]) +1 other test skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_page_reclaim@pde-vs-pd.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_page_reclaim@pde-vs-pd.html

  * igt@xe_page_reclaim@random:
    - shard-bmg:          [SKIP][304] ([Intel XE#8714]) -> [SKIP][305] ([Intel XE#7793])
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_page_reclaim@random.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_page_reclaim@random.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-bmg:          [SKIP][306] ([Intel XE#8714]) -> [SKIP][307] ([Intel XE#1420] / [Intel XE#7590])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pat@pat-index-xehpc.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          [SKIP][308] ([Intel XE#8714]) -> [SKIP][309] ([Intel XE#2236] / [Intel XE#7590])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@xa-app-transient-media-off:
    - shard-bmg:          [SKIP][310] ([Intel XE#7590]) -> [SKIP][311] ([Intel XE#8714])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_pat@xa-app-transient-media-off.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_pat@xa-app-transient-media-off.html

  * igt@xe_peer2peer@read:
    - shard-bmg:          [SKIP][312] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353]) -> [SKIP][313] ([Intel XE#2427] / [Intel XE#6953] / [Intel XE#7326] / [Intel XE#7353] / [Intel XE#8714])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_peer2peer@read.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          [SKIP][314] ([Intel XE#8714]) -> [SKIP][315] ([Intel XE#2284] / [Intel XE#7370])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pm@d3cold-basic.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          [SKIP][316] ([Intel XE#8714]) -> [SKIP][317] ([Intel XE#5694] / [Intel XE#7370])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pm@d3cold-i2c.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][318] ([Intel XE#2284] / [Intel XE#7370]) -> [SKIP][319] ([Intel XE#8714])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@xe_pm@d3cold-mocs.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_pm@d3cold-mocs.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          [SKIP][320] ([Intel XE#8714]) -> [SKIP][321] ([Intel XE#7599])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_prefetch_fault@prefetch-fault.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-stale-queue-post-suspend:
    - shard-bmg:          [SKIP][322] ([Intel XE#8714]) -> [SKIP][323] ([Intel XE#4733] / [Intel XE#7417]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pxp@pxp-stale-queue-post-suspend.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-suspend.html

  * igt@xe_pxp@pxp-termination-key-update-post-suspend:
    - shard-bmg:          [SKIP][324] ([Intel XE#4733] / [Intel XE#7417]) -> [SKIP][325] ([Intel XE#8714]) +1 other test skip
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_pxp@pxp-termination-key-update-post-suspend.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][326] ([Intel XE#944]) -> [SKIP][327] ([Intel XE#8714]) +2 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-bmg:          [SKIP][328] ([Intel XE#8714]) -> [SKIP][329] ([Intel XE#944]) +2 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3309
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5177
  [Intel XE#5545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5545
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5882
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#6127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6127
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6814
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6911
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7319
  [Intel XE#7326]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7368]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7368
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7376
  [Intel XE#7378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7378
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7399
  [Intel XE#7402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7402
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7428
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7443
  [Intel XE#7448]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7448
  [Intel XE#7449]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449
  [Intel XE#7466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466
  [Intel XE#7571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7571
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7954
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8117]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8117
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8555]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8555
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#8680]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8680
  [Intel XE#8695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#8710]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8710
  [Intel XE#8714]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * IGT: IGT_9032 -> IGT_9033
  * Linux: xe-5507-593120331e000d147d0c405b446c82de0740c57e -> xe-pw-168394v8

  IGT_9032: 9032
  IGT_9033: 9033
  xe-5507-593120331e000d147d0c405b446c82de0740c57e: 593120331e000d147d0c405b446c82de0740c57e
  xe-pw-168394v8: 168394v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/index.html

--===============2866861794296001363==
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
<tr><td><b>Series:</b></td><td>drm/xe: make CTX_TIMESTAMP TOCTOU-safe and h=
andle sentinels (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/168394/">https://patchwork.freedesktop.org/series/168394/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168394v8/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168394v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5507-593120331e000d147d0c405b446c82de0=
740c57e_FULL -&gt; xe-pw-168394v8_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-168394v8_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-168394v8_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1683=
94v8_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_cursor_crc@cursor-sliding-256x256@pipe-d-dp-2:<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_cursor_crc@cursor-sliding=
-256x256@pipe-d-dp-2.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-168394v8_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@core_getversion@basic.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@intel_hw=
mon@hwmon-read.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@intel_hwmon@hwmon-read.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/517=
7">Intel XE#5177</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_big_fb@linear-8bpp-rotate=
-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/610">Intel XE#610</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_big_fb@yf-tiled-8bpp-rota=
te-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_ccs@c=
rc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8=
150</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7449">Intel XE#7449</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_content_protection@atomic=
-hdcp14.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +3 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/igt@kms_content_protection@dp-ms=
t-type-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2390">Intel XE#2390</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_cursor_crc@cursor-offscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-m=
ovement-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-lnl-6/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149=
</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +31 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbch=
dr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +3 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
srhdr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6911">Intel XE#6911</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7378">Intel XE#7378</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_plane@pixel-format-y-tile=
d-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +1 other test s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_pm_backlight@bad-brightne=
ss.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7376">Intel XE#7376</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6@pr-=
xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-3/igt@kms_pm_d=
c@dc5-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168394v8/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel X=
E#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_pm_r=
pm@legacy-planes-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_rpm@legacy-plane=
s-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8710">Intel XE#8710</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_psr2_sf@psr2-plane-move-s=
f-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_psr@psr2-cursor-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_sharpness_filter@invalid-=
plane-with-filter.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6503">Intel XE#6503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_vrr@max-min.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Int=
el XE#1499</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@xe_exec_basic@multigpu-once-u=
serptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +2 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_exec_fault_mode@twice-mult=
i-queue-userptr-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@xe_exec_multi_queue@many-queu=
es-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8364">Intel XE#8364</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-close-fd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@xe_exec_reset@multi-queue-clo=
se-fd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-execqueues-new-nomemset:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_exec_system_allocator@proc=
ess-many-large-execqueues-new-nomemset.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +135 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@xe_exec_threads@threads-multi=
-queue-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/sha=
rd-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) +658 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@xe_live_=
ktest@xe_bo.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Int=
el XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_multigpu_svm@mgpu-pagefaul=
t-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_page_reclaim@binds-1g-part=
ial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@xe_pat@pat-sw-hw-suspend.html=
">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
7695">Intel XE#7695</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@xe_wedged@wedged-at-any-timeo=
ut.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5545">Intel XE#5545</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@core_hot=
unplug@hotrebind.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8007">Intel XE#8007</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@core_hotunplu=
g@hotrebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@core_set=
master@master-drop-set-root.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@cor=
e_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@fbdev@eo=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@intel_hw=
mon@hwmon-write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5177">Intel XE#5177</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@intel_hwmon@hwm=
on-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-lnl-7/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-lnl-8/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
basic@once-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v=
8/shard-bmg-1/igt@xe_exec_basic@once-bindexecqueue-userptr-invalidate-race.=
html">PASS</a> +675 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@engine-activity-accuracy-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_pmu@e=
ngine-activity-accuracy-50.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8555">Intel XE#8555</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@xe_p=
mu@engine-activity-accuracy-50.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/igt@kms=
_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +4 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_big_=
fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_b=
ig_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_=
fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/sh=
ard-bmg-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-0-hflip.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059=
">Intel XE#7059</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_big_=
fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Inte=
l XE#7085</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-168394v8/shard-bmg-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-=
180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_big_=
fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_big_=
fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_=
big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +9 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-3-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-9/igt@kms_bw@connected-linear-tiling-3-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-4-displays-target-1920x1080p.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-7/igt@kms_bw@connected-linear-tiling-4-displays-target-1920x=
1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_bw@l=
inear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard=
-bmg-6/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel=
 XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_bw@l=
inear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-b=
mg-7/igt@kms_bw@linear-tiling-2-displays-target-3840x2160p.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_ccs@=
bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms=
_ccs@bad-aux-stride-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_ccs=
@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard=
-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel=
 XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_ccs@=
crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-=
bmg-7/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bm=
g-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cdcl=
k@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@k=
ms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7449">Intel XE#7449=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_cham=
elium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-=
7/igt@kms_chamelium_audio@hdmi-audio-after-suspend.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_cham=
elium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/=
igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cham=
elium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms=
_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut1d:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_cha=
melium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/i=
gt@kms_chamelium_color_pipeline@plane-lut1d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cham=
elium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/ig=
t@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/=
igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-b=
mg-2/igt@kms_content_protection@dp-mst-lic-type-0-hdcp14.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE=
#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_con=
tent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8=
/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@legacy-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@km=
s_content_protection@legacy-hdcp14.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">In=
tel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_cont=
ent_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_conten=
t_protection@type1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_curs=
or_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/ig=
t@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_curs=
or_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/ig=
t@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_curs=
or_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shar=
d-bmg-7/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x256:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_curs=
or_crc@cursor-sliding-256x256.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@k=
ms_cursor_crc@cursor-sliding-256x256.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8117">Intel XE#8117</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7571">Intel XE#7571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/ig=
t@kms_cursor_legacy@flip-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_dirt=
yfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_dirty=
fb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dp_l=
ink_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_d=
p_link_training@non-uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5882">Intel XE#5882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-bigjoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_dsc@=
dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/i=
gt@kms_dsc@dsc-with-output-formats-bigjoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_dsc@=
dsc-with-output-formats-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/sh=
ard-bmg-9/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265=
">Intel XE#8265</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fbc_=
dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8=
/shard-bmg-9/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4422">Intel XE#4422</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_fbco=
n_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4156">Intel XE#4156</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_fbc=
on_fbt@fbc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fbco=
n_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_fbcon_fbt@psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8680">Intel XE#8680</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7448">Intel XE#7448</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_feat=
ure_discovery@dsc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8586">Intel XE#8586</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_feature_d=
iscovery@dsc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_feat=
ure_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_feature_=
discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2374">Intel XE#2374</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6127">Intel XE#6127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">I=
ntel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-168394v8/shard-bmg-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#=
7178</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7=
351">Intel XE#7351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-ytile=
-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#87=
14</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8394v8/shard-bmg-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-=
upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7178">Intel XE#7178</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +4 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-nv12-linear-to-nv12-linear-reflect-x.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#71=
79</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8394v8/shard-bmg-7/igt@kms_flip_scaled_crc@flip-nv12-linear-to-nv12-linear-=
reflect-x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8714">Intel XE#8714</a>) +57 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrshdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-7/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-mmap=
-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-1p-offscreen-pri-shrfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#414=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/8714">Intel XE#8714</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-linear:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/=
igt@kms_frontbuffer_tracking@fbc-tiling-linear.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel =
XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-168394v8/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pr=
i-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +66 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7399">Intel XE#7399</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/ig=
t@kms_frontbuffer_tracking@fbchdr-tiling-y.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-abgr161616f-draw-blt.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061=
">Intel XE#7061</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-argb161616f-draw-render.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Int=
el XE#7356</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-argb161616f-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsrhdr-1p-offscreen-pri-shrfb-draw-mmap-wc.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">In=
tel XE#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-168394v8/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-offsc=
reen-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +58 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/s=
hard-bmg-2/igt@kms_frontbuffer_tracking@hdr-abgr161616f-draw-mmap-wc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/70=
61">Intel XE#7061</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_hdmi=
_inject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_hdmi_i=
nject@inject-audio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_hdr@invalid-hdr=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@kms_join=
er@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@k=
ms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_join=
er@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6911">Intel XE#6911</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7466">Intel XE#7466=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-7/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_join=
er@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard=
-bmg-8/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Inte=
l XE#4090</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/7443">Intel XE#7443</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_mult=
ipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bm=
g-7/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-yftiled:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_pipe=
_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/s=
hard-bmg-7/igt@kms_pipe_stress@stress-xrgb8888-yftiled.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8=
714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@kms_pla=
ne@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/=
shard-bmg-7/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-cc-modifier.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plan=
e@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-168394v8/shard-bmg-1/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-m=
odifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +8 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-8/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_plan=
e_scaling@planes-upscale-20x20-downscale-factor-0-5.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886"=
>Intel XE#6886</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-20x20-d=
ownscale-factor-0-5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_pm_b=
acklight@brightness-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2938">Intel XE#2938</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel X=
E#7760</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168394v8/shard-bmg-7/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">=
Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_b=
acklight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_pm_=
backlight@fade-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7376">Intel XE#7376</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7760">Intel XE#7760</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#87=
0</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168=
394v8/shard-bmg-7/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE=
#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_d=
c@dc3co-after-dc6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-4/igt@kms_pm_dc@dc3=
co-after-dc6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-retention-flops:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_d=
c@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_pm_dc=
@dc5-retention-flops.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3309">Intel XE#3309</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7368">Intel XE#7368</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_pm_d=
c@dc6-psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_dc@dc6-psr.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@kms_pm_=
rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7402">Intel XE#7402</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms_pm_rpm@mode=
set-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</=
a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel =
XE#7383</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_pm_rpm@modeset-lpsp-stress-no-w=
ait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@kms_pm_r=
pm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/6814">Intel XE#6814</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7428">Intel XE#7428</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms=
_pm_rpm@package-g7.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2=
_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8=
/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_psr2=
_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
68394v8/shard-bmg-7/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8714">Intel XE#8714</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/igt@kms_psr2_su@=
page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7429">Intel XE#7429</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/ig=
t@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@=
fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@kms_=
psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +=
10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@kms_psr@=
psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_=
psr@psr2-no-drrs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr@=
psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@kms_psr@psr=
2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_psr_=
stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/sha=
rd-bmg-9/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">=
Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bm=
g-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2=
330</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/58=
13">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bm=
g-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3=
904</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
42">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714=
">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-5/igt@kms_rota=
tion_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#58=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8394v8/shard-bmg-7/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_scal=
ing_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@k=
ms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_scal=
ing_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@kms=
_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_setm=
ode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-3/ig=
t@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8695">Intel XE=
#8695</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-tap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@kms_shar=
pness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_sha=
rpness_filter@filter-tap.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-filter-with-scaler:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_shar=
pness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-b=
mg-4/igt@kms_sharpness_filter@invalid-filter-with-scaler.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE=
#6503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-6/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shar=
d-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">In=
tel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@kms_tile=
d_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/sha=
rd-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">=
Intel XE#2509</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@kms_vrr@=
flip-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@kms_vrr@flip-suspe=
nd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@xe_compu=
te@ccs-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6599">Intel XE#6599</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_compute@cc=
s-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_configfs@ctx-restore-post-bb-invalid:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_confi=
gfs@ctx-restore-post-bb-invalid.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/i=
gt@xe_configfs@ctx-restore-post-bb-invalid.html">ABORT</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_crea=
te@multigpu-create-massive-size.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/7319">Intel XE#7319</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7350">Intel=
 XE#7350</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-168394v8/shard-bmg-7/igt@xe_create@multigpu-create-massive-size.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/871=
4">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_evic=
t@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel X=
E#8355</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168394v8/shard-bmg-7/igt@xe_evict@evict-beng-mixed-many-threads-small.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict=
@evict-mixed-many-threads-small.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-10/i=
gt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">In=
tel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_evict=
@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@xe_=
evict@evict-small-multi-queue-cm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small-multi-queue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-3/igt@xe_evict=
@evict-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/ig=
t@xe_evict@evict-threads-small-multi-queue.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel X=
E#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-168394v8/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-u=
serptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +9 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_exec=
_basic@multigpu-no-exec-bindexecqueue.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714"=
>Intel XE#8714</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
fault_mode@many-multi-queue-userptr-invalidate-race-imm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#=
8714</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
168394v8/shard-bmg-6/igt@xe_exec_fault_mode@many-multi-queue-userptr-invali=
date-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_exec_=
fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-=
7/igt@xe_exec_fault_mode@twice-multi-queue-userptr.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_exec_=
multi_queue@few-execs-preempt-mode-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#83=
64</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8394v8/shard-bmg-7/igt@xe_exec_multi_queue@few-execs-preempt-mode-userptr-i=
nvalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8714">Intel XE#8714</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-priority:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
multi_queue@two-queues-preempt-mode-fault-priority.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-8/igt@xe_exec_multi_queue@two-queues-preempt-mode-fault-prio=
rity.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/8364">Intel XE#8364</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error-on-secondary:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-=
bmg-6/igt@xe_exec_reset@multi-queue-cat-error-on-secondary.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel =
XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard=
-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Inte=
l XE#8714</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_exec_=
threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v=
8/shard-bmg-8/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/8378">Intel XE#8378</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wa_gt_init:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-9/igt@xe_fault=
_injection@inject-fault-probe-function-xe_wa_gt_init.html">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#80=
07</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8394v8/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wa=
_gt_init.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gpgpu_fill@offset-4x4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_gpgpu=
_fill@offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_gpgpu_fill@=
offset-4x4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/7954">Intel XE#7954</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_multi=
gpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-b=
mg-7/igt@xe_multigpu_svm@mgpu-concurrent-access-prefetch.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE=
#6964</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
8714">Intel XE#8714</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pde-vs-pd:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_page_=
reclaim@pde-vs-pd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7793">Intel XE#7793</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_page_recla=
im@pde-vs-pd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@random:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_page_=
reclaim@random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_page_reclaim@=
random.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pat@p=
at-index-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-1/igt@xe_pat@pat-index=
-xehpc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1420">Intel XE#1420</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pat@p=
at-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@xe_pat@pat-index=
-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2236">Intel XE#2236</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@xa-app-transient-media-off:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-4/igt@xe_pat@x=
a-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_pa=
t@xa-app-transient-media-off.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-1/igt@xe_peer2=
peer@read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2427">Intel XE#2427</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6953">Intel XE#6953</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7326">Intel XE#7326</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7353">Intel XE#7353=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1683=
94v8/shard-bmg-7/igt@xe_peer2peer@read.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2427">Intel XE#2427</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6953">Intel XE#695=
3</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7326=
">Intel XE#7326</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/7353">Intel XE#7353</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pm@d3=
cold-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-6/igt@xe_pm@d3cold-basic.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pm@d3=
cold-i2c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-5/igt@xe_pm@d3cold-i2c.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
694">Intel XE#5694</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-2/igt@xe_pm@d3=
cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/igt@xe_pm@d=
3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8714">Intel XE#8714</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_prefe=
tch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-2/igt@xe_pre=
fetch_fault@prefetch-fault.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_pxp@p=
xp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-9/igt@xe_=
pxp@pxp-stale-queue-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-10/igt@xe_pxp@=
pxp-termination-key-update-post-suspend.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#74=
17</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-16=
8394v8/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
714">Intel XE#8714</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-8/igt@xe_query=
@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard-bmg-7/ig=
t@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) +2=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5507-593120331e000d147d0c405b446c82de0740c57e/shard-bmg-7/igt@xe_query=
@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/8714">Intel XE#8714</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168394v8/shard=
-bmg-9/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel=
 XE#944</a>) +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9032 -&gt; IGT_9033</li>
<li>Linux: xe-5507-593120331e000d147d0c405b446c82de0740c57e -&gt; xe-pw-168=
394v8</li>
</ul>
<p>IGT_9032: 9032<br />
  IGT_9033: 9033<br />
  xe-5507-593120331e000d147d0c405b446c82de0740c57e: 593120331e000d147d0c405=
b446c82de0740c57e<br />
  xe-pw-168394v8: 168394v8</p>

</body>
</html>

--===============2866861794296001363==--
