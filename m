Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CB7ACED274
	for <intel-xe@archiver.kernel.org>; Tue,  8 Oct 2024 08:27:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69A3010E4A5;
	Tue,  8 Oct 2024 08:27:34 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A23110E4A5;
 Tue,  8 Oct 2024 08:27:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1942748773690470728=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_series_starting_with_=5B1/2=5D_?=
 =?utf-8?q?drm/xe=3A_Separate_the_d3cold_and_non-d3cold_runtime_PM_handling?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Oct 2024 08:27:32 -0000
Message-ID: <172837605262.1202630.7134413476200690367@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241007140531.1044630-1-imre.deak@intel.com>
In-Reply-To: <20241007140531.1044630-1-imre.deak@intel.com>
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

--===============1942748773690470728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe: Separate the d3cold and non-d3cold runtime PM handling
URL   : https://patchwork.freedesktop.org/series/139638/
State : failure

== Summary ==

CI Bug Log - changes from xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634_full -> xe-pw-139638v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139638v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139638v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139638v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic@plane-cursor-legacy:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-2/igt@kms_atomic@plane-cursor-legacy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-8/igt@kms_atomic@plane-cursor-legacy.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-lnl:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-41:
    - shard-lnl:          NOTRUN -> [FAIL][7] +8 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html

  * igt@kms_pm_rpm@universal-planes@plane-77:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +22 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-77.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-77.html

  
#### Warnings ####

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-lnl:          [SKIP][10] ([Intel XE#1439]) -> [FAIL][11] +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-dg2-set2:     [INCOMPLETE][12] ([Intel XE#1195]) -> [TIMEOUT][13] +1 other test timeout
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - {shard-bmg}:        [FAIL][14] ([Intel XE#301]) -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:
    - {shard-bmg}:        [PASS][16] -> [INCOMPLETE][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:
    - {shard-bmg}:        [PASS][18] -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html

  
Known issues
------------

  Here are the changes found in xe-pw-139638v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1466])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#660])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#873])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][23] -> [FAIL][24] ([Intel XE#1659])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][25] -> [DMESG-WARN][26] ([Intel XE#877])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [FAIL][27] ([Intel XE#1659])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1407]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#1124]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#367])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1512])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][34] -> [INCOMPLETE][35] ([Intel XE#1195]) +1 other test incomplete
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#314])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#373])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#373]) +5 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#307]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1424]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#309]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][42] -> [FAIL][43] ([Intel XE#1475]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1508] / [Intel XE#599])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#599]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-adlp:         NOTRUN -> [ABORT][46] ([Intel XE#2915])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1421]) +1 other test skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [FAIL][48] ([Intel XE#886]) +2 other tests fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     [PASS][49] -> [FAIL][50] ([Intel XE#301]) +2 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@plain-flip-fb-recreate@b-edp1:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#886]) +7 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#455]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#1401]) +3 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1397] / [Intel XE#1745])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1397])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][58] -> [FAIL][59] ([Intel XE#1874]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#352])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#651]) +6 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#656]) +24 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#651]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#653]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][65] -> [SKIP][66] ([Intel XE#455])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:
    - shard-lnl:          [PASS][67] -> [DMESG-WARN][68] ([Intel XE#324]) +1 other test dmesg-warn
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-1:
    - shard-lnl:          [PASS][69] -> [DMESG-FAIL][70] ([Intel XE#324])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2763]) +7 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][72] -> [FAIL][73] ([Intel XE#1430])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes@plane-68:
    - shard-lnl:          [PASS][74] -> [TIMEOUT][75] ([Intel XE#1620]) +1 other test timeout
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1439])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-lnl:          [PASS][77] -> [INCOMPLETE][78] ([Intel XE#2864])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#2893]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1406]) +2 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][81] ([Intel XE#2850] / [Intel XE#929])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1127])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#1437])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#362])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vrr@max-min@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][85] ([Intel XE#2443]) +1 other test fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#756])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#2905]) +6 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#688]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][89] ([Intel XE#261] / [Intel XE#688])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@xe_evict@evict-beng-small.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#1392]) +3 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_compute_mode@many-userptr-invalidate-race:
    - shard-lnl:          [PASS][91] -> [FAIL][92] ([Intel XE#2754])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html

  * igt@xe_mmap@small-bar:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#512])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@xe_mmap@small-bar.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-lnl:          [PASS][94] -> [TIMEOUT][95] ([Intel XE#1358])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-6/igt@xe_pm@d3hot-basic-exec.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-lnl:          [PASS][96] -> [TIMEOUT][97] ([Intel XE#1358] / [Intel XE#2574])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][99] -> [ABORT][100] ([Intel XE#1358] / [Intel XE#1607])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@xe_pm@s4-exec-after.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][101] -> [ABORT][102] ([Intel XE#1794])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-3/igt@xe_pm@s4-mocs.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#944])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][104] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][105] +2 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs:
    - {shard-bmg}:        [DMESG-WARN][106] ([Intel XE#1033]) -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - {shard-bmg}:        [DMESG-WARN][108] ([Intel XE#877]) -> [PASS][109] +2 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][110] ([Intel XE#1659]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][112] ([Intel XE#1616]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [DMESG-WARN][114] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][115]
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][116] ([Intel XE#301]) -> [PASS][117] +6 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][118] ([Intel XE#886]) -> [PASS][119] +5 other tests pass
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][120] ([Intel XE#1503]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][122] ([Intel XE#324]) -> [PASS][123] +3 other tests pass
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][124] ([Intel XE#324]) -> [PASS][125] +6 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-lnl:          [DMESG-FAIL][126] ([Intel XE#1620]) -> [PASS][127]
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          [FAIL][128] ([Intel XE#2948]) -> [PASS][129] +3 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][130] ([Intel XE#2159]) -> [PASS][131] +1 other test pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][132] ([Intel XE#1473] / [Intel XE#402]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][134] ([Intel XE#1000]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - {shard-bmg}:        [DMESG-FAIL][136] ([Intel XE#482]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][138] ([Intel XE#1630]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {shard-bmg}:        [INCOMPLETE][140] -> [PASS][141] +1 other test pass
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][142] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][144] ([Intel XE#1794]) -> [PASS][145]
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][146] ([Intel XE#1231]) -> [DMESG-FAIL][147] ([Intel XE#324])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][148] ([Intel XE#1500]) -> [SKIP][149] ([Intel XE#362])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1630]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
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
  [Intel XE#2574]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2754]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915
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
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#660]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/660
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634 -> xe-pw-139638v1

  IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634: 39a016b276ce8adac629cc6c31892d0b7d2af634
  xe-pw-139638v1: 139638v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/index.html

--===============1942748773690470728==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe: Separate the d3cold and non-d3cold runtime PM handling</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139638/">https://patchwork.freedesktop.org/series/139638/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634_full -&gt; xe-pw-139638v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139638v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139638v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139638v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic@plane-cursor-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-2/igt@kms_atomic@plane-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-8/igt@kms_atomic@plane-cursor-legacy.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_pm_rpm@universal-planes-dpms@plane-41.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-77:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_pm_rpm@universal-planes@plane-77.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-77.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">TIMEOUT</a> +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-dp2-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-dp2.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139638v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/660">Intel XE#660</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_dsc@dsc-with-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-8/igt@kms_fbcon_fbt@fbc-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2915">Intel XE#2915</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-434/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-5/igt@kms_plane@plane-position-hole-dpms@pipe-a-plane-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-7/igt@kms_pm_rpm@system-suspend-modeset.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-436/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_vrr@max-min@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-small-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_evict@evict-beng-mixed-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-5/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-6/igt@xe_exec_compute_mode@many-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2754">Intel XE#2754</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@xe_pm@d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-6/igt@xe_pm@d3hot-basic-exec.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@xe_pm@d3hot-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@xe_pm@d3hot-multiple-execs.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2574">Intel XE#2574</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-3/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-hdmi-a-3-4-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-4/igt@kms_atomic_transition@modeset-transition-nonblocking.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-6/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-8/igt@kms_pm_rpm@modeset-lpsp-stress.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-4/igt@kms_pm_rpm@modeset-lpsp-stress.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-8/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1630">Intel XE#1630</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-lnl-2/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-bmg-4/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139638v1/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634 -&gt; xe-pw-139638v1</li>
</ul>
<p>IGT_8054: 3f627b7fd48c6ab324ceaa80dd8cf0131292bf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2017-39a016b276ce8adac629cc6c31892d0b7d2af634: 39a016b276ce8adac629cc6c31892d0b7d2af634<br />
  xe-pw-139638v1: 139638v1</p>

</body>
</html>

--===============1942748773690470728==--
