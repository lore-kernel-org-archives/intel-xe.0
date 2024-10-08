Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666A2CED274
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 07:34:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DAB410E482;
	Tue,  8 Oct 2024 07:34:52 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20EF310E482;
 Tue,  8 Oct 2024 07:34:51 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8018547738035778249=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Fix_xe=5Fforce=5Fwake=5Fget=28?=
 =?utf-8?q?=29_failure_handling_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 07:34:51 -0000
Message-ID: <172837289112.1202264.9322872458736808176@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20241007070017.1732886-1-himal.prasad.ghimiray@intel.com>
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

--===============8018547738035778249==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Fix xe_force_wake_get() failure handling (rev8)
URL   : https://patchwork.freedesktop.org/series/137982/
State : failure

== Summary ==

CI Bug Log - changes from xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634_full -> xe-pw-137982v8_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-137982v8_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-137982v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-137982v8_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@fbc:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_fbcon_fbt@fbc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4] +2 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:
    - shard-lnl:          [PASS][5] -> [DMESG-WARN][6] +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][7] ([Intel XE#1523]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_vblank@accuracy-idle.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@legacy:
    - {shard-bmg}:        [FAIL][9] ([Intel XE#1178]) -> [DMESG-FAIL][10] +9 other tests dmesg-fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_content_protection@legacy.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-8/igt@kms_content_protection@legacy.html

  * igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:
    - {shard-bmg}:        [PASS][11] -> [DMESG-WARN][12] +105 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html

  * igt@xe_live_ktest@xe_bo:
    - {shard-bmg}:        [INCOMPLETE][13] -> [SKIP][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_live_ktest@xe_bo.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-7/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - {shard-bmg}:        [PASS][15] -> [SKIP][16] +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_eudebug:
    - {shard-bmg}:        [SKIP][17] ([Intel XE#2833]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html

  
Known issues
------------

  Here are the changes found in xe-pw-137982v8_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#660])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#873])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#1426]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#1407]) +1 other test skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +4 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#367])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#314])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_frames@hdmi-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#373]) +4 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-single.html

  * igt@kms_color@ctm-0-25@pipe-c-edp-1:
    - shard-lnl:          [PASS][29] -> [DMESG-WARN][30] ([Intel XE#2929]) +1 other test dmesg-warn
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_color@ctm-0-25@pipe-c-edp-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@kms_color@ctm-0-25@pipe-c-edp-1.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#307]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1424]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#309]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][34] ([Intel XE#1508] / [Intel XE#599])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#599])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#1421])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [FAIL][37] ([Intel XE#886]) +2 other tests fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-lnl:          [PASS][38] -> [INCOMPLETE][39] ([Intel XE#2049]) +1 other test incomplete
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate@c-edp1:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#886]) +3 other tests fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1401]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#352])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#651]) +4 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#656]) +18 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [PASS][47] -> [DMESG-FAIL][48] ([Intel XE#324])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#2763]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][50] -> [FAIL][51] ([Intel XE#1430])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][52] -> [INCOMPLETE][53] ([Intel XE#1620] / [Intel XE#2864])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-41:
    - shard-lnl:          [PASS][54] -> [DMESG-FAIL][55] ([Intel XE#1620]) +1 other test dmesg-fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-41.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_pm_rpm@legacy-planes@plane-41.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1439])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2893])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1406]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@psr2-cursor-plane-move:
    - shard-lnl:          [PASS][59] -> [FAIL][60] ([Intel XE#2948]) +1 other test fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-move.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#362])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][62] -> [FAIL][63] ([Intel XE#2443]) +1 other test fail
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][64] ([Intel XE#2443]) +1 other test fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#756])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:
    - shard-lnl:          [PASS][66] -> [FAIL][67] ([Intel XE#2667])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#2905]) +5 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#688]) +3 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1392]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#512])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@xe_mmap@small-bar.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          [PASS][72] -> [INCOMPLETE][73] ([Intel XE#1616])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][75] -> [ABORT][76] ([Intel XE#1794])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][77] -> [FAIL][78] ([Intel XE#958])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#944])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - {shard-bmg}:        [DMESG-WARN][80] ([Intel XE#877]) -> [PASS][81] +1 other test pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:
    - shard-lnl:          [FAIL][82] ([Intel XE#1701]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][84] ([Intel XE#1616]) -> [PASS][85] +1 other test pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][86] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][87] +1 other test pass
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - {shard-bmg}:        [FAIL][88] ([Intel XE#301]) -> [PASS][89]
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][90] ([Intel XE#886]) -> [PASS][91] +6 other tests pass
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][92] ([Intel XE#1503]) -> [PASS][93]
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][94] ([Intel XE#324]) -> [PASS][95] +7 other tests pass
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][96] ([Intel XE#324]) -> [PASS][97] +1 other test pass
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][98] ([Intel XE#2948]) -> [PASS][99] +3 other tests pass
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_vblank@accuracy-idle@pipe-c-edp-1:
    - shard-lnl:          [FAIL][100] ([Intel XE#1523]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [DMESG-FAIL][102] ([Intel XE#482]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][104] ([Intel XE#1630]) -> [PASS][105]
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  
#### Warnings ####

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][106] ([Intel XE#324]) -> [DMESG-WARN][107] ([Intel XE#324])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_plane@plane-position-hole.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2667]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634 -> xe-pw-137982v8

  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634: 39a016b276ce8adac629cc6c31892d0b7d2af634
  xe-pw-137982v8: 137982v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/index.html

--===============8018547738035778249==
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
<tr><td><b>Series:</b></td><td>Fix xe_force_wake_get() failure handling (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137982/">https://patchwork.freedesktop.org/series/137982/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634_full -&gt; xe-pw-137982v8_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-137982v8_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-137982v8_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-137982v8_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_fbcon_fbt@fbc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_fbcon_fbt@fbc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend@pipe-a-edp-1.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-7/igt@xe_exec_compute_mode@many-execqueues-userptr-invalidate.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_vblank@accuracy-idle:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_vblank@accuracy-idle.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-8/igt@kms_content_protection@legacy.html">DMESG-FAIL</a> +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-2/igt@kms_plane_scaling@plane-upscale-20x20-with-pixel-format@pipe-d.html">DMESG-WARN</a> +105 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-7/igt@xe_live_ktest@xe_bo.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-6/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-2/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-137982v8_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_chamelium_frames@hdmi-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@kms_color@ctm-0-25@pipe-c-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-2/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@kms_flip@plain-flip-fb-recreate@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_pm_rpm@legacy-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_pm_rpm@legacy-planes@plane-41.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@xe_drm_fdinfo@utilization-single-full-load-destroy-queue.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2667">Intel XE#2667</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking@1x-outputs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-4/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-6/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-3/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-7/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-8/igt@kms_vblank@accuracy-idle@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-bmg-3/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_plane@plane-position-hole:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137982v8/shard-lnl-1/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634 -&gt; xe-pw-137982v8</li>
</ul>
<p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634: 39a016b276ce8adac629cc6c31892d0b7d2af634<br />
  xe-pw-137982v8: 137982v8</p>

</body>
</html>

--===============8018547738035778249==--
