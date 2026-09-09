Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E19C79F82
	for <intel-xe@archiver.kernel.org>; Wed,  9 Sep 2026 00:56:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C74B10EE2F;
	Wed,  9 Sep 2026 00:56:52 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35A7110EE2F;
 Wed,  9 Sep 2026 00:56:50 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2431210127750194974=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe=3A_Add_wa=5F1402594?=
 =?utf-8?q?1587_to_xe2=2C_xe3_and_xe3p_platforms_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 09 Sep 2026 00:56:50 -0000
Message-ID: <178891541020.138035.8218602186684630019@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908165225.61456-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260908165225.61456-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============2431210127750194974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev7)
URL   : https://patchwork.freedesktop.org/series/167706/
State : success

== Summary ==

CI Bug Log - changes from xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d_FULL -> xe-pw-167706v7_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-167706v7_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [PASS][1] -> [FAIL][2] ([Intel XE#3718] / [Intel XE#6078])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [PASS][3] -> [FAIL][4] ([Intel XE#6078])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:
    - shard-bmg:          [PASS][6] -> [INCOMPLETE][7] ([Intel XE#7084] / [Intel XE#8150])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2252])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html

  * igt@kms_color@ctm-signed:
    - shard-lnl:          [PASS][9] -> [SKIP][10] ([Intel XE#3297])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_color@ctm-signed.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_color@ctm-signed.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          NOTRUN -> [FAIL][11] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][12] ([Intel XE#2320])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][13] -> [SKIP][14] ([Intel XE#9125]) +21 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dp_aux_dev@basic:
    - shard-lnl:          [PASS][15] -> [SKIP][16] ([Intel XE#3009])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dp_aux_dev@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_dp_aux_dev@basic.html

  * igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#8265])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html

  * igt@kms_feature_discovery@dsc:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#8586])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_feature_discovery@dsc.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [PASS][19] -> [FAIL][20] ([Intel XE#3098] / [Intel XE#3149]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - shard-lnl:          [PASS][21] -> [SKIP][22] ([Intel XE#2482]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@basic-flip-vs-modeset.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@flip-vs-dpms-on-nop:
    - shard-lnl:          [PASS][23] -> [SKIP][24] ([Intel XE#9132])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@flip-vs-dpms-on-nop.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2311]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          [PASS][27] -> [SKIP][28] ([Intel XE#2548] / [Intel XE#7779]) +6 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][29] ([Intel XE#4141])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [PASS][30] -> [SKIP][31] ([Intel XE#7779])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#2313]) +5 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][33] -> [SKIP][34] ([Intel XE#1503])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_invalid_mode@uint-max-clock:
    - shard-lnl:          [PASS][35] -> [SKIP][36] ([Intel XE#2568]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_invalid_mode@uint-max-clock.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html

  * igt@kms_plane_scaling@invalid-parameters:
    - shard-lnl:          [PASS][37] -> [SKIP][38] ([Intel XE#7687] / [Intel XE#9125])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@invalid-parameters.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_plane_scaling@invalid-parameters.html

  * igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#8396]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc5-dpms-suspend-resume:
    - shard-lnl:          [PASS][41] -> [FAIL][42] ([Intel XE#8399])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-lnl:          [PASS][43] -> [SKIP][44] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pm_rpm@dpms-lpsp.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#4608]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#1489])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:
    - shard-lnl:          [PASS][48] -> [SKIP][49] ([Intel XE#1489]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2234] / [Intel XE#2850]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-suspend@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend@edp-1.html

  * igt@kms_psr@psr2-suspend:
    - shard-lnl:          [PASS][52] -> [SKIP][53] ([Intel XE#2850] / [Intel XE#929])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@psr2-suspend.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-lnl:          [PASS][54] -> [SKIP][55] ([Intel XE#7795])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_sharpness_filter@filter-strength:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#6503])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_sharpness_filter@filter-strength.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][57] -> [INCOMPLETE][58] ([Intel XE#6321] / [Intel XE#8355])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#8374]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#8364]) +4 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-bmg:          [PASS][61] -> [ABORT][62] ([Intel XE#8007]) +2 other tests abort
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#4733] / [Intel XE#7417])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
#### Possible fixes ####

  * igt@fbdev@eof:
    - shard-lnl:          [SKIP][64] ([Intel XE#2134]) -> [PASS][65]
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@fbdev@eof.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@fbdev@eof.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][66] ([Intel XE#9125]) -> [PASS][67] +23 other tests pass
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_color@legacy-gamma-reset:
    - shard-lnl:          [SKIP][68] ([Intel XE#3297]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_color@legacy-gamma-reset.html

  * igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:
    - shard-lnl:          [SKIP][70] ([Intel XE#7006]) -> [PASS][71]
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [SKIP][72] ([Intel XE#9127]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_feature_discovery@display-1x:
    - shard-lnl:          [SKIP][74] ([Intel XE#702]) -> [PASS][75]
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@display-1x.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_feature_discovery@display-1x.html

  * igt@kms_feature_discovery@psr2:
    - shard-lnl:          [SKIP][76] ([Intel XE#1135] / [Intel XE#6128]) -> [PASS][77]
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@psr2.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [FAIL][78] ([Intel XE#3098]) -> [PASS][79] +1 other test pass
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][80] ([Intel XE#301]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [SKIP][82] ([Intel XE#2482]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][84] ([Intel XE#2548] / [Intel XE#7779]) -> [PASS][85] +5 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:
    - shard-lnl:          [SKIP][86] ([Intel XE#7779]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html

  * igt@kms_invalid_mode@bad-hsync-end:
    - shard-lnl:          [SKIP][88] ([Intel XE#2568]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_invalid_mode@bad-hsync-end.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_invalid_mode@bad-hsync-end.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [SKIP][90] ([Intel XE#9128]) -> [PASS][91] +1 other test pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:
    - shard-lnl:          [SKIP][92] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [PASS][93] +1 other test pass
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-lnl:          [SKIP][94] ([Intel XE#870]) -> [PASS][95]
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [SKIP][96] ([Intel XE#7794]) -> [PASS][97]
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [SKIP][98] ([Intel XE#4886]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          [SKIP][100] ([Intel XE#1489]) -> [PASS][101] +1 other test pass
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr-cursor-plane-onoff:
    - shard-lnl:          [SKIP][102] ([Intel XE#2850] / [Intel XE#929]) -> [PASS][103] +2 other tests pass
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr@fbc-psr-cursor-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-lnl:          [SKIP][104] ([Intel XE#7795]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - shard-lnl:          [SKIP][106] ([Intel XE#3279]) -> [SKIP][107] ([Intel XE#9125])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][108] ([Intel XE#1407]) -> [SKIP][109] ([Intel XE#9125]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [SKIP][110] ([Intel XE#7059] / [Intel XE#7085]) -> [SKIP][111] ([Intel XE#9125])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          [SKIP][112] ([Intel XE#9125]) -> [SKIP][113] ([Intel XE#1407]) +3 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          [SKIP][114] ([Intel XE#1124]) -> [SKIP][115] ([Intel XE#9125]) +4 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          [SKIP][116] ([Intel XE#9125]) -> [SKIP][117] ([Intel XE#1428] / [Intel XE#7387])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          [SKIP][118] ([Intel XE#9125]) -> [SKIP][119] ([Intel XE#1124]) +3 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][120] ([Intel XE#9125]) -> [SKIP][121] ([Intel XE#8365])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:
    - shard-lnl:          [SKIP][122] ([Intel XE#8365]) -> [SKIP][123] ([Intel XE#9125])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][124] ([Intel XE#2887]) -> [SKIP][125] ([Intel XE#9125]) +3 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-lnl:          [SKIP][126] ([Intel XE#2669] / [Intel XE#7389]) -> [SKIP][127] ([Intel XE#9125])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-lnl:          [SKIP][128] ([Intel XE#9125]) -> [SKIP][129] ([Intel XE#2887]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-lnl:          [SKIP][130] ([Intel XE#3432]) -> [SKIP][131] ([Intel XE#9125]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          [SKIP][132] ([Intel XE#9125]) -> [SKIP][133] ([Intel XE#3432])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          [SKIP][134] ([Intel XE#4417] / [Intel XE#5447]) -> [SKIP][135] ([Intel XE#9125])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cdclk@mode-transition.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cdclk@mode-transition.html

  * igt@kms_content_protection@dp-mst-lic-type-0:
    - shard-lnl:          [SKIP][136] ([Intel XE#9125]) -> [SKIP][137] ([Intel XE#307] / [Intel XE#6974])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html

  * igt@kms_content_protection@dp-mst-type-0-suspend-resume:
    - shard-lnl:          [SKIP][138] ([Intel XE#9125]) -> [SKIP][139] ([Intel XE#6974])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-lnl:          [SKIP][140] ([Intel XE#307] / [Intel XE#6974]) -> [SKIP][141] ([Intel XE#9125])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][142] ([Intel XE#7642]) -> [SKIP][143] ([Intel XE#9125])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_content_protection@uevent.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-lnl:          [SKIP][144] ([Intel XE#9125]) -> [SKIP][145] ([Intel XE#1424]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-lnl:          [SKIP][146] ([Intel XE#2321] / [Intel XE#7355]) -> [SKIP][147] ([Intel XE#9125])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x170.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          [SKIP][148] ([Intel XE#1424]) -> [SKIP][149] ([Intel XE#9125]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:
    - shard-lnl:          [SKIP][150] ([Intel XE#9125]) -> [SKIP][151] ([Intel XE#309] / [Intel XE#7343])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][152] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][153] ([Intel XE#309] / [Intel XE#7343])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          [SKIP][154] ([Intel XE#9125]) -> [SKIP][155] ([Intel XE#323] / [Intel XE#6035])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-lnl:          [SKIP][156] ([Intel XE#8265]) -> [SKIP][157] ([Intel XE#9125])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc:
    - shard-lnl:          [SKIP][158] ([Intel XE#9125]) -> [SKIP][159] ([Intel XE#8265]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][160] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) -> [SKIP][161] ([Intel XE#1745] / [Intel XE#9144])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][162] ([Intel XE#1745] / [Intel XE#9144]) -> [SKIP][163] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][164] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][165] ([Intel XE#6312] / [Intel XE#651]) +6 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][166] ([Intel XE#7061] / [Intel XE#7356]) -> [SKIP][167] ([Intel XE#7779]) +2 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          [SKIP][168] ([Intel XE#7779]) -> [SKIP][169] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][170] ([Intel XE#7779]) -> [SKIP][171] ([Intel XE#7905]) +24 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:
    - shard-lnl:          [SKIP][172] ([Intel XE#7779]) -> [SKIP][173] ([Intel XE#6312]) +6 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:
    - shard-lnl:          [SKIP][174] ([Intel XE#6312] / [Intel XE#651]) -> [SKIP][175] ([Intel XE#2548] / [Intel XE#7779]) +7 other tests skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          [SKIP][176] ([Intel XE#6312]) -> [SKIP][177] ([Intel XE#7779]) +6 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          [SKIP][178] ([Intel XE#7905]) -> [SKIP][179] ([Intel XE#7779]) +21 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          [SKIP][180] ([Intel XE#7865]) -> [SKIP][181] ([Intel XE#7779]) +8 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][182] ([Intel XE#7779]) -> [SKIP][183] ([Intel XE#7061])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][184] ([Intel XE#2548] / [Intel XE#7779]) -> [SKIP][185] ([Intel XE#656] / [Intel XE#7905]) +18 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][186] ([Intel XE#7779]) -> [SKIP][187] ([Intel XE#7865]) +15 other tests skip
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:
    - shard-lnl:          [SKIP][188] ([Intel XE#7061]) -> [SKIP][189] ([Intel XE#7779]) +3 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          [SKIP][190] ([Intel XE#656] / [Intel XE#7905]) -> [SKIP][191] ([Intel XE#2548] / [Intel XE#7779]) +15 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][192] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][193] ([Intel XE#3544])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-swap:
    - shard-lnl:          [SKIP][194] ([Intel XE#9125]) -> [SKIP][195] ([Intel XE#1503])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_hdr@static-swap.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_hdr@static-swap.html

  * igt@kms_plane_lowres@tiling-x:
    - shard-lnl:          [SKIP][196] ([Intel XE#599] / [Intel XE#7382]) -> [SKIP][197] ([Intel XE#9125])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_plane_lowres@tiling-x.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          [SKIP][198] ([Intel XE#9125]) -> [SKIP][199] ([Intel XE#599])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-lnl:          [SKIP][200] ([Intel XE#9125]) -> [SKIP][201] ([Intel XE#4596] / [Intel XE#5854])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-x.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          [SKIP][202] ([Intel XE#9125]) -> [SKIP][203] ([Intel XE#5020] / [Intel XE#7348])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:
    - shard-lnl:          [SKIP][204] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) -> [SKIP][205] ([Intel XE#2763] / [Intel XE#6886]) +1 other test skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:
    - shard-lnl:          [SKIP][206] ([Intel XE#2763] / [Intel XE#6886]) -> [SKIP][207] ([Intel XE#2763] / [Intel XE#6886] / [Intel XE#7687] / [Intel XE#9125]) +3 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-lnl:          [SKIP][208] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) -> [SKIP][209] ([Intel XE#1489]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          [SKIP][210] ([Intel XE#1489]) -> [SKIP][211] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-plane-move:
    - shard-lnl:          [SKIP][212] ([Intel XE#1406] / [Intel XE#7345]) -> [SKIP][213] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-lnl:          [SKIP][214] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][215] ([Intel XE#1406] / [Intel XE#7345])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          [SKIP][216] ([Intel XE#1406]) -> [SKIP][217] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_psr@pr-primary-blt.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          [SKIP][218] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][219] ([Intel XE#1406]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@pr-sprite-plane-move.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-lnl:          [SKIP][220] ([Intel XE#9125]) -> [SKIP][221] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-lnl:          [SKIP][222] ([Intel XE#3414] / [Intel XE#3904] / [Intel XE#7342]) -> [SKIP][223] ([Intel XE#9125])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][224] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][225] ([Intel XE#2509] / [Intel XE#7437])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_reset@gt-reset-fault-injection:
    - shard-bmg:          [DMESG-WARN][226] ([Intel XE#9130]) -> [ABORT][227] ([Intel XE#9131] / [Intel XE#9145])
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-1/igt@xe_exec_reset@gt-reset-fault-injection.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2548]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548
  [Intel XE#2568]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3297]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7006]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7059]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7348]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387
  [Intel XE#7389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687
  [Intel XE#7779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779
  [Intel XE#7794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794
  [Intel XE#7795]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935
  [Intel XE#8007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8586]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#9125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125
  [Intel XE#9127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127
  [Intel XE#9128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128
  [Intel XE#9130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130
  [Intel XE#9131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131
  [Intel XE#9132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9145]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929


Build changes
-------------

  * Linux: xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d -> xe-pw-167706v7

  IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d: 5cb17454a3e04fcc1133d87451c9c582c297e92d
  xe-pw-167706v7: 167706v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/index.html

--===============2431210127750194974==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add wa_14025941587 to xe2, xe3 and xe3p platforms (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167706/">https://patchwork.freedesktop.org/series/167706/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d_FULL -&gt; xe-pw-167706v7_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-167706v7_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-d-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-for-each-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_chamelium_hpd@dp-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-signed:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_color@ctm-signed.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_color@ctm-signed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev@basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dp_aux_dev@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_dp_aux_dev@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_dsc@dsc-fractional-bpp-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dsc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_feature_discovery@dsc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8586">Intel XE#8586</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@basic-flip-vs-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip@flip-vs-dpms-on-nop.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_flip@flip-vs-dpms-on-nop.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9132">Intel XE#9132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@uint-max-clock:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_invalid_mode@uint-max-clock.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_invalid_mode@uint-max-clock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@invalid-parameters:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@invalid-parameters.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_plane_scaling@invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_pm_dc@dc3co-framedrop-check@pr-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_pm_dc@dc3co-framedrop-check@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_pm_dc@dc5-dpms-suspend-resume.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_pm_rpm@dpms-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr2_sf@psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@psr2-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr@psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@filter-strength:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_sharpness_filter@filter-strength.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@xe_exec_fault_mode@twice-multi-queue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@xe_exec_multi_queue@max-queues-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-10/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8007">Intel XE#8007</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@fbdev@eof.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma-reset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color@legacy-gamma-reset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3297">Intel XE#3297</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_color@legacy-gamma-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7006">Intel XE#7006</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-pre-ctm3x4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9127">Intel XE#9127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-1x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@display-1x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_feature_discovery@display-1x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_feature_discovery@psr2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6128">Intel XE#6128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_feature_discovery@psr2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-1/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2482">Intel XE#2482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-move.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-1p-offscreen-pri-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-hsync-end:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_invalid_mode@bad-hsync-end.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2568">Intel XE#2568</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_invalid_mode@bad-hsync-end.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane@plane-position-hole.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9128">Intel XE#9128</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_pm_backlight@basic-brightness.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7794">Intel XE#7794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4886">Intel XE#4886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-sf.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr@fbc-psr-cursor-plane-onoff.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7795">Intel XE#7795</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7059">Intel XE#7059</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7387">Intel XE#7387</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_bw@linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7389">Intel XE#7389</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417">Intel XE#4417</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5447">Intel XE#5447</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_content_protection@dp-mst-type-0-suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_cursor_crc@cursor-offscreen-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935">Intel XE#7935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_dsc@dsc-with-output-formats-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">Intel XE#7385</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@drrshdr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-argb161616f-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2548">Intel XE#2548</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7779">Intel XE#7779</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_hdr@static-swap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7382">Intel XE#7382</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_plane_lowres@tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_plane_multiple@2x-tiling-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020">Intel XE#5020</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7348">Intel XE#7348</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7687">Intel XE#7687</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr@fbc-psr2-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-7/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-8/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-6/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-2/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-lnl-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9125">Intel XE#9125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-fault-injection:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d/shard-bmg-6/igt@xe_exec_reset@gt-reset-fault-injection.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9130">Intel XE#9130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167706v7/shard-bmg-1/igt@xe_exec_reset@gt-reset-fault-injection.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9131">Intel XE#9131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9145">Intel XE#9145</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d -&gt; xe-pw-167706v7</li>
</ul>
<p>IGT_9086: a89061ecccede222b8da2f310f3bf71ed908c365 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5709-5cb17454a3e04fcc1133d87451c9c582c297e92d: 5cb17454a3e04fcc1133d87451c9c582c297e92d<br />
  xe-pw-167706v7: 167706v7</p>

</body>
</html>

--===============2431210127750194974==--
