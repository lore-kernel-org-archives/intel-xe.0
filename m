Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20046CEB2C9
	for <intel-xe@archiver.kernel.org>; Mon, 30 Sep 2024 21:50:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B0B10E28F;
	Mon, 30 Sep 2024 21:50:24 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BD1D10E161;
 Mon, 30 Sep 2024 21:50:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2611482041286598642=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/i915/display=3A_platform_id?=
 =?utf-8?q?entification_with_display-=3Eplatform=2E=3Cplatform=3E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Sep 2024 21:50:23 -0000
Message-ID: <172773302335.1139131.16973106788684654940@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <cover.1727699233.git.jani.nikula@intel.com>
In-Reply-To: <cover.1727699233.git.jani.nikula@intel.com>
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

--===============2611482041286598642==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: platform identification with display->platform.<platform>
URL   : https://patchwork.freedesktop.org/series/139301/
State : failure

== Summary ==

CI Bug Log - changes from xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f_full -> xe-pw-139301v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139301v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139301v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139301v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          NOTRUN -> [FAIL][1] +8 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][2] +13 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         NOTRUN -> [ABORT][3] +6 other tests abort
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:
    - shard-lnl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html

  * igt@kms_pm_rpm@basic-pci-d3-state:
    - shard-dg2-set2:     [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][9] +4 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_create@create-big-vram.html

  * igt@xe_exec_basic@once-null-defer-bind:
    - shard-adlp:         [PASS][10] -> [TIMEOUT][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@xe_exec_basic@once-null-defer-bind.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_exec_basic@once-null-defer-bind.html

  * igt@xe_exec_compute_mode@once-userptr-invalidate:
    - shard-lnl:          [PASS][12] -> [DMESG-WARN][13] +4 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@xe_exec_compute_mode@once-userptr-invalidate.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] +12 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-dg2-set2:     NOTRUN -> [FAIL][15]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         NOTRUN -> [FAIL][16] +3 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@crc@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][17] ([Intel XE#1656]) -> [DMESG-FAIL][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-1/igt@kms_async_flips@crc@pipe-c-dp-2.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-3/igt@kms_async_flips@crc@pipe-c-dp-2.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][19] ([Intel XE#1288]) -> [DMESG-FAIL][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-1/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - {shard-bmg}:        [SKIP][21] -> [FAIL][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe:
    - {shard-bmg}:        NOTRUN -> [FAIL][23] +5 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - {shard-bmg}:        NOTRUN -> [SKIP][24] +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html

  
Known issues
------------

  Here are the changes found in xe-pw-139301v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [PASS][25] -> [DMESG-WARN][26] ([Intel XE#1033]) +1 other test dmesg-warn
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#801]) +5 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][28] -> [FAIL][29] ([Intel XE#1426]) +1 other test fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#316]) +3 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][31] ([Intel XE#1407]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#610])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#1659])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          [PASS][35] -> [FAIL][36] ([Intel XE#1231] / [Intel XE#1496])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][37] ([Intel XE#1725])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][38] ([Intel XE#1204])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +14 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#316]) +4 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][41] ([Intel XE#1231])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#1231]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1124]) +16 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#1124]) +12 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#1428])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2191]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2191]) +4 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#2191]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1512]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#367]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#367]) +3 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#367]) +5 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#787]) +59 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#787]) +111 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#2669]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455] / [Intel XE#787]) +39 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#2887]) +16 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#373]) +18 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#306]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#306]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#306]) +3 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#373]) +16 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@hdmi-hpd-fast:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#373]) +15 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#307]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][67] ([Intel XE#1178]) +3 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#308]) +3 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#308]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455]) +24 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1424]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][72] ([Intel XE#2055]) +1 other test dmesg-warn
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#309]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#309]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#323])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#323])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#323])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#776])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#776])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1421]) +4 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#310]) +5 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          NOTRUN -> [FAIL][82] ([Intel XE#886]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#886]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#1397] / [Intel XE#1745])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1397])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#455]) +31 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1401] / [Intel XE#1745]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1401]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][90] ([Intel XE#324]) +1 other test dmesg-fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#352])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([i915#5274])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#651]) +22 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#656]) +61 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     NOTRUN -> [SKIP][95] ([Intel XE#651]) +41 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [FAIL][96] ([Intel XE#1861]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][97] ([Intel XE#656]) +47 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651]) +17 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [FAIL][99] ([Intel XE#2879])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#658])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1158])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1158])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][103] ([Intel XE#653]) +27 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#653]) +43 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2853])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#356])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#356])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#356])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [PASS][109] -> [DMESG-FAIL][110] ([Intel XE#324]) +1 other test dmesg-fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane_cursor@primary:
    - shard-adlp:         NOTRUN -> [FAIL][111] ([Intel XE#1874]) +9 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][112] ([Intel XE#616]) +10 other tests fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#599]) +7 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#2763]) +19 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#2763]) +8 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#2763]) +8 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][119] ([Intel XE#2029])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2007])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#836])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#2893]) +4 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1489]) +12 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#1489]) +15 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#2850]) +21 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#1649]) +25 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#2850]) +22 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@pr-primary-blt:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#1406]) +8 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_psr@pr-primary-blt.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#1437]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1127])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1127])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#327]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#327]) +3 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#362])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][135] ([Intel XE#1729])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][136] -> [DMESG-WARN][137] ([Intel XE#1638]) +1 other test dmesg-warn
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-1.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-1.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [FAIL][138] ([Intel XE#2159]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@kms_vrr@flipline:
    - shard-lnl:          [PASS][139] -> [FAIL][140] ([Intel XE#2443]) +1 other test fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-3/igt@kms_vrr@flipline.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vrr@flipline.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#1499] / [Intel XE#599])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#756])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#756]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#756])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_ccs@block-copy-compressed:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][145] ([Intel XE#1195]) +1 other test incomplete
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#455] / [Intel XE#488]) +1 other test skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-basic:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1447]) +1 other test skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#1447])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][149] ([Intel XE#1050]) +1 other test fail
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#688]) +15 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     NOTRUN -> [FAIL][151] ([Intel XE#1600])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#261] / [Intel XE#688]) +17 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][153] ([Intel XE#1473])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-simple:
    - shard-adlp:         NOTRUN -> [SKIP][154] ([Intel XE#688])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1392]) +14 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#1392]) +14 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#288]) +37 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#288]) +36 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][159] ([Intel XE#1962])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][160] ([Intel XE#2105])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][161] ([Intel XE#584]) +1 other test skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#2229])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     NOTRUN -> [SKIP][163] ([Intel XE#378])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@xe_module_load@force-load.html
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#378])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@xe_module_load@force-load.html

  * igt@xe_module_load@load:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#378]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_module_load@load.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#379])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2541]) +6 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@oa-regs-whitelisted@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][168] ([Intel XE#2514]) +1 other test fail
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html

  * igt@xe_oa@short-reads:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#2541]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@xe_oa@short-reads.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     NOTRUN -> [FAIL][170] ([Intel XE#1173]) +1 other test fail
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [ABORT][172] ([Intel XE#1358])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [ABORT][173] ([Intel XE#1358])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#2284] / [Intel XE#366])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#2284] / [Intel XE#366]) +3 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][176] -> [ABORT][177] ([Intel XE#1358] / [Intel XE#1607])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#579])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#579])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#579])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [PASS][181] -> [FAIL][182] ([Intel XE#958])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#944]) +2 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][184] ([Intel XE#944]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#944]) +2 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-adlp:         [PASS][186] -> [ABORT][187] ([Intel XE#2310])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-x:
    - shard-dg2-set2:     [INCOMPLETE][188] ([Intel XE#1195]) -> [PASS][189] +2 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-x.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][190] ([Intel XE#324]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][192] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_async_flips@crc:
    - shard-adlp:         [FAIL][194] ([Intel XE#1874]) -> [PASS][195] +2 other tests pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@kms_async_flips@crc.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-1:
    - shard-adlp:         [FAIL][196] ([Intel XE#1656]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][198] ([Intel XE#1426]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][200] ([Intel XE#1426]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-lnl:          [INCOMPLETE][202] -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][204] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [DMESG-WARN][206] ([Intel XE#877]) -> [PASS][207] +7 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@absolute-wf_vblank-interruptible:
    - shard-lnl:          [FAIL][208] ([Intel XE#2631]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-8/igt@kms_flip@absolute-wf_vblank-interruptible.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-lnl:          [FAIL][210] ([Intel XE#886]) -> [PASS][211] +5 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-lnl:          [INCOMPLETE][212] ([Intel XE#2050]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-dg2-set2:     [SKIP][214] -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html
    - shard-lnl:          [SKIP][216] -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][218] ([Intel XE#324]) -> [PASS][219] +1 other test pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [DMESG-WARN][220] ([Intel XE#324]) -> [PASS][221] +3 other tests pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:
    - {shard-bmg}:        [INCOMPLETE][222] ([Intel XE#2566]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html

  * igt@kms_pm_rpm@legacy-planes@plane-68:
    - shard-lnl:          [DMESG-WARN][224] ([Intel XE#1620]) -> [PASS][225] +1 other test pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@kms_pm_rpm@legacy-planes@plane-68.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-lnl:          [INCOMPLETE][226] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html

  * igt@kms_pm_rpm@universal-planes@plane-50:
    - shard-lnl:          [DMESG-FAIL][228] ([Intel XE#1620]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-50.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-50.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][230] ([Intel XE#899]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][232] ([Intel XE#1523]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-8/igt@kms_vblank@accuracy-idle.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:
    - shard-lnl:          [INCOMPLETE][234] ([Intel XE#2712]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][236] ([Intel XE#2443]) -> [PASS][237] +1 other test pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@kms_vrr@flip-basic.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vrr@flip-basic.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-lnl:          [FAIL][238] -> [PASS][239] +1 other test pass
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][240] ([Intel XE#2105]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_gt_freq@throttle_basic_api:
    - {shard-bmg}:        [FAIL][242] -> [PASS][243] +2 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-5/igt@xe_gt_freq@throttle_basic_api.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-2/igt@xe_gt_freq@throttle_basic_api.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-lnl:          [INCOMPLETE][244] ([Intel XE#1358] / [Intel XE#1616]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-5/igt@xe_pm@s2idle-multiple-execs.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-lnl:          [INCOMPLETE][246] ([Intel XE#1616] / [Intel XE#1694] / [Intel XE#2699]) -> [PASS][247]
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][248] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][249]
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@xe_pm@s4-basic.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [ABORT][250] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][251]
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [DMESG-WARN][252] ([Intel XE#1760]) -> [PASS][253]
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][254] ([Intel XE#324]) -> [FAIL][255] ([Intel XE#1231])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][256] ([Intel XE#1231]) -> [DMESG-FAIL][257] ([Intel XE#324])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][258] ([Intel XE#1638] / [Intel XE#358]) -> [DMESG-WARN][259] ([Intel XE#358])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-9/igt@xe_exec_reset@cat-error.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1496]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1496
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1638]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1725]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962
  [Intel XE#2007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2055]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2245
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2699]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2699
  [Intel XE#2712]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#2879]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2879
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8042 -> IGT_8043
  * Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -> xe-pw-139301v1

  IGT_8042: b446e8e07135e2ae5c9e020242233e0662f47e75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8043: 8043
  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f
  xe-pw-139301v1: 139301v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/index.html

--===============2611482041286598642==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: platform identification with display-&gt;platform.&lt;platform&gt;</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139301/">https://patchwork.freedesktop.org/series/139301/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f_full -&gt; xe-pw-139301v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139301v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139301v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139301v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_fbcon_fbt@psr-suspend.html">FAIL</a> +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_feature_discovery@psr1.html">SKIP</a> +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">ABORT</a> +6 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a1.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_flip@plain-flip-ts-check-interruptible@a-edp1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-pci-d3-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-433/igt@kms_pm_rpm@basic-pci-d3-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-463/igt@kms_pm_rpm@basic-pci-d3-state.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_create@create-big-vram.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-null-defer-bind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@xe_exec_basic@once-null-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_exec_basic@once-null-defer-bind.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-8/igt@xe_exec_compute_mode@once-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@xe_exec_compute_mode@once-userptr-invalidate.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@xe_exec_reset@gt-reset-stress.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-1/igt@kms_async_flips@crc@pipe-c-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656">Intel XE#1656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-3/igt@kms_async_flips@crc@pipe-c-dp-2.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-1/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288">Intel XE#1288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-3/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-2/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner@big_joiner_on_last_pipe.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-1/igt@kms_pm_backlight@brightness-with-dpms.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139301v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-6-4-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1496">Intel XE#1496</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1725">Intel XE#1725</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +59 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +111 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_chamelium_color@ctm-blue-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-fast:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +3 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +24 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2055">Intel XE#2055</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +61 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2879">Intel XE#2879</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-x@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_plane_lowres@tiling-x@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2007">Intel XE#2007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +25 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_psr@pr-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1437">Intel XE#1437</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-3/igt@kms_vrr@flipline.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vrr@flipline.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_compute@ccs-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-1/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +17 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-simple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-simple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +36 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1962">Intel XE#1962</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_module_load@load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@xe_oa@oa-regs-whitelisted@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-466/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-436/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-9/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-435/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-4/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-8/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2310">Intel XE#2310</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-x.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-433/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-dp-4-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@kms_async_flips@crc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_async_flips@crc.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656">Intel XE#1656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_async_flips@crc@pipe-b-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-464/igt@kms_atomic_transition@plane-all-modeset-transition-fencing@pipe-a-hdmi-a-6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-panning-interruptible@ab-dp2-hdmi-a3.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-8/igt@kms_flip@absolute-wf_vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631">Intel XE#2631</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-7/igt@kms_flip@absolute-wf_vblank-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-dg2-464/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-dg2-463/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@kms_pm_rpm@legacy-planes@plane-68.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_pm_rpm@legacy-planes@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_pm_rpm@universal-planes.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_pm_rpm@universal-planes@plane-50.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@kms_pm_rpm@universal-planes@plane-50.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-8/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2712">Intel XE#2712</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vblank@ts-continuation-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@kms_vrr@flip-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-1/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-2/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-8/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@throttle_basic_api:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-bmg-5/igt@xe_gt_freq@throttle_basic_api.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-bmg-2/igt@xe_gt_freq@throttle_basic_api.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-5/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-4/igt@xe_pm@s2idle-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@xe_pm@s2idle-vm-bind-prefetch.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2699">Intel XE#2699</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-3/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-5/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-lnl-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f/shard-adlp-9/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1638">Intel XE#1638</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139301v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8042 -&gt; IGT_8043</li>
<li>Linux: xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f -&gt; xe-pw-139301v1</li>
</ul>
<p>IGT_8042: b446e8e07135e2ae5c9e020242233e0662f47e75 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8043: 8043<br />
  xe-1991-8a36a5499f143dc694afe235c6a1773421d2bd4f: 8a36a5499f143dc694afe235c6a1773421d2bd4f<br />
  xe-pw-139301v1: 139301v1</p>

</body>
</html>

--===============2611482041286598642==--
