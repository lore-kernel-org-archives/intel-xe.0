Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07BC3ABD8
	for <intel-xe@archiver.kernel.org>; Wed, 14 May 2025 12:44:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44CC810E27E;
	Wed, 14 May 2025 12:44:13 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B189A10E27E;
 Wed, 14 May 2025 12:44:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6267565366890195186=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/display=3A_variou?=
 =?utf-8?q?s_small_cleanups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 May 2025 12:44:11 -0000
Message-ID: <174722665146.77995.15288802630253755896@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <cover.1747128495.git.jani.nikula@intel.com>
In-Reply-To: <cover.1747128495.git.jani.nikula@intel.com>
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

--===============6267565366890195186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: various small cleanups
URL   : https://patchwork.freedesktop.org/series/148951/
State : failure

== Summary ==

CI Bug Log - changes from xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089_FULL -> xe-pw-148951v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148951v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148951v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148951v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_sequence@get-busy:
    - shard-adlp:         [PASS][1] -> [SKIP][2] +5 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@kms_sequence@get-busy.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_sequence@get-busy.html

  * igt@xe_exec_reset@virtual-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_exec_reset@virtual-gt-reset.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-adlp:         [SKIP][4] ([Intel XE#656]) -> [SKIP][5] +1 other test skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-adlp:         [SKIP][6] ([Intel XE#651]) -> [SKIP][7] +1 other test skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-adlp:         [SKIP][8] ([Intel XE#1489]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         [SKIP][10] ([Intel XE#1122]) -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@psr2-sprite-render:
    - shard-adlp:         [SKIP][12] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_psr@psr2-sprite-render.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_psr@psr2-sprite-render.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         [SKIP][14] ([Intel XE#330]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_tv_load_detect@load-detect.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-adlp:         [SKIP][16] ([Intel XE#455]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_vrr@flip-basic.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_vrr@flip-basic.html

  
Known issues
------------

  Here are the changes found in xe-pw-148951v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@write:
    - shard-dg2-set2:     [PASS][18] -> [SKIP][19] ([Intel XE#2134]) +1 other test skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@fbdev@write.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@fbdev@write.html

  * igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#4208] / [Intel XE#4618])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off.html

  * igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#4208] / [Intel XE#4618])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries.html

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#3157])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#3157])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:
    - shard-lnl:          [PASS][25] -> [FAIL][26] ([Intel XE#911])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][27] -> [FAIL][28] ([Intel XE#3884]) +1 other test fail
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#3768])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#316]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1407]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2327]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][35] -> [SKIP][36] ([Intel XE#4996]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][37] ([Intel XE#4543]) +1 other test dmesg-fail
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#316]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#1124]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1477])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#1124]) +4 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][42] -> [DMESG-FAIL][43] ([Intel XE#4543]) +10 other tests dmesg-fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#1124]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1124]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-bmg:          [PASS][46] -> [SKIP][47] ([Intel XE#2314] / [Intel XE#2894])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#2191])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#367]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#2887]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2907]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#455] / [Intel XE#787]) +31 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2887])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#3432])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#3432])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#787]) +14 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#787]) +181 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#2907])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2669]) +3 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@mode-transition:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#4417] / [Intel XE#455])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_cdclk@mode-transition.html
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#2724])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][66] ([Intel XE#4417]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4417]) +3 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#306])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#373])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2252]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-resolution-list.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#373]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#373]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#455]) +9 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][74] ([Intel XE#1178])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_protection@srm@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][75] ([Intel XE#1188]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_content_protection@uevent.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][76] ([Intel XE#1188])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1424]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-movement-256x85.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#308])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#309])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#309]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][81] -> [SKIP][82] ([Intel XE#2291]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#4494] / [i915#3804])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_feature_discovery@chamelium:
    - shard-lnl:          NOTRUN -> [SKIP][84] ([Intel XE#701])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-4/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][85] ([Intel XE#3321]) +2 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][86] ([Intel XE#301]) +15 other tests fail
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][87] -> [FAIL][88] ([Intel XE#3321]) +1 other test fail
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1421]) +2 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][90] ([Intel XE#2049] / [Intel XE#2597])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#310]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2316])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [PASS][93] -> [SKIP][94] ([Intel XE#2316])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_flip@2x-wf_vblank-ts-check.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#4208] / [i915#2575]) +107 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_flip@busy-flip.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][97] ([Intel XE#301]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@c-dp4.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][99] -> [INCOMPLETE][100] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:
    - shard-bmg:          [PASS][101] -> [FAIL][102] ([Intel XE#2882]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#4208]) +220 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1401] / [Intel XE#1745])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1401])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][107] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#651]) +4 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][109] ([Intel XE#651]) +22 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][110] ([Intel XE#2311]) +5 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#4141]) +4 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#651]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#656]) +10 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][114] ([Intel XE#658])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#1469])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2352])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2313]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#653]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#653]) +12 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#656]) +12 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#4947])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdmi_inject@inject-4k:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1470])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][124] ([Intel XE#346])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#346])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2925])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#2927])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#2927])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#2927])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@invalid-create-leases:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#4208] / [i915#2575]) +28 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_lease@invalid-create-leases.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     NOTRUN -> [FAIL][131] ([Intel XE#616])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_lowres@tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#4950])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_plane_lowres@tiling-4.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#5020])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][134] ([Intel XE#2763]) +5 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2763] / [Intel XE#455]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#2763]) +7 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#2763]) +2 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2763]) +9 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#870])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#870])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_pm_backlight@fade-with-dpms.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#870])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][143] ([Intel XE#908])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html
    - shard-adlp:         [PASS][144] -> [FAIL][145] ([Intel XE#718])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][146] -> [FAIL][147] ([Intel XE#718]) +1 other test fail
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1129])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_prop_blob@basic:
    - shard-adlp:         [PASS][149] -> [SKIP][150] ([Intel XE#4950]) +2 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_prop_blob@basic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][151] ([Intel XE#1489]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][152] ([Intel XE#1489])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#1489])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#2893])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#2850] / [Intel XE#929]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4609]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-blt@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#1406]) +3 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2939])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#3414] / [Intel XE#3904])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#3414])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#3414] / [Intel XE#3904])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#3414]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#1127])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1127])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-bmg:          NOTRUN -> [SKIP][167] ([Intel XE#2330])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#2168])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_vrr@cmrr.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#455]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#1123])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_create@create-big-vram:
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#1062])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_create@create-big-vram.html

  * igt@xe_drm_fdinfo@utilization-single-full-load:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#4945]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_drm_fdinfo@utilization-single-full-load.html

  * igt@xe_eudebug@multiple-sessions:
    - shard-dg2-set2:     NOTRUN -> [SKIP][173] ([Intel XE#4837]) +6 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_eudebug@multiple-sessions.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-lnl:          NOTRUN -> [SKIP][174] ([Intel XE#4518])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-adlp:         NOTRUN -> [SKIP][175] ([Intel XE#4519])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][176] ([Intel XE#4518])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][177] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][178] ([Intel XE#688]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#1392]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][180] ([Intel XE#1392])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#1392]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][182] -> [SKIP][183] ([Intel XE#1392])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_exec_basic@multigpu-once-null.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#4208]) +153 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@once-userptr-free:
    - shard-adlp:         [PASS][185] -> [SKIP][186] ([Intel XE#4945]) +18 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@xe_exec_compute_mode@once-userptr-free.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec_compute_mode@once-userptr-free.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#288]) +10 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-basic-imm.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][188] ([Intel XE#288]) +4 other tests skip
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#4837]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free:
    - shard-adlp:         NOTRUN -> [SKIP][190] ([Intel XE#4915]) +42 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_exec_system_allocator@process-many-execqueues-free.html

  * igt@xe_exec_system_allocator@process-many-execqueues-free-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#4915]) +99 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_system_allocator@process-many-execqueues-free-race.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][192] ([Intel XE#4943]) +6 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][193] ([Intel XE#4943]) +1 other test skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early:
    - shard-adlp:         [PASS][194] -> [DMESG-WARN][195] ([Intel XE#4173]) +5 other tests dmesg-warn
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-adlp:         NOTRUN -> [SKIP][196] ([Intel XE#4045])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_mmap@pci-membarrier-parallel.html
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#4045])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-6/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@force-load:
    - shard-adlp:         NOTRUN -> [SKIP][198] ([Intel XE#378])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_module_load@force-load.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         NOTRUN -> [SKIP][199] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     NOTRUN -> [SKIP][200] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][201] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][202] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][203] ([Intel XE#1173])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         NOTRUN -> [SKIP][204] ([Intel XE#2284] / [Intel XE#366])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][205] -> [ABORT][206] ([Intel XE#1794])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-1/igt@xe_pm@s4-mocs.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#4733]) +2 other tests skip
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-post-suspend.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-lnl:          NOTRUN -> [SKIP][208] ([Intel XE#944])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@xe_query@multigpu-query-oa-units.html
    - shard-adlp:         NOTRUN -> [SKIP][209] ([Intel XE#944])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_query@multigpu-query-oa-units.html
    - shard-bmg:          NOTRUN -> [SKIP][210] ([Intel XE#944])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][211] ([Intel XE#944]) +2 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][212] ([Intel XE#3342])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#3342])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:
    - shard-adlp:         [PASS][214] -> [SKIP][215] ([Intel XE#4945] / [Intel XE#4996]) +3 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_vm@munmap-style-unbind-userptr-inval-many-all.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unplug-rescan:
    - shard-bmg:          [SKIP][216] ([Intel XE#4963]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@core_hotunplug@unplug-rescan.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@core_hotunplug@unplug-rescan.html
    - shard-adlp:         [SKIP][218] ([Intel XE#4963]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@core_hotunplug@unplug-rescan.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@core_hotunplug@unplug-rescan.html
    - shard-lnl:          [SKIP][220] ([Intel XE#4963]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@core_hotunplug@unplug-rescan.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-6/igt@core_hotunplug@unplug-rescan.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [FAIL][222] ([Intel XE#4208]) -> [PASS][223] +2 other tests pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@core_setmaster@master-drop-set-user.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#2134]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@fbdev@info.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@fbdev@info.html

  * igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][226] ([Intel XE#4543]) -> [PASS][227] +1 other test pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][228] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][229] +2 other tests pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#2351] / [Intel XE#4208]) -> [PASS][231] +12 other tests pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-bmg:          [INCOMPLETE][232] ([Intel XE#3226]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][234] ([Intel XE#2291]) -> [PASS][235] +2 other tests pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][236] ([Intel XE#4633]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][238] ([Intel XE#3009]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_aux_dev.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][240] ([Intel XE#2231] / [Intel XE#4996]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_link_training@non-uhbr-sst.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_feature_discovery@display:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#4208] / [i915#2575]) -> [PASS][243] +91 other tests pass
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@display.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_feature_discovery@display.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][244] ([Intel XE#3321]) -> [PASS][245]
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          [SKIP][246] ([Intel XE#2316]) -> [PASS][247] +10 other tests pass
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:
    - shard-adlp:         [FAIL][248] ([Intel XE#301]) -> [PASS][249] +1 other test pass
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@d-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][250] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][251] +2 other tests pass
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][252] ([Intel XE#4543]) -> [PASS][253] +6 other tests pass
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         [ABORT][254] -> [PASS][255]
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][256] ([Intel XE#3012]) -> [PASS][257]
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - shard-adlp:         [SKIP][258] ([Intel XE#4996]) -> [PASS][259] +3 other tests pass
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_pipe_crc_basic@hang-read-crc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_plane_multiple@2x-tiling-x:
    - shard-bmg:          [SKIP][260] ([Intel XE#4596]) -> [PASS][261]
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-x.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-x.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][262] ([Intel XE#2571]) -> [PASS][263]
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][264] ([Intel XE#718]) -> [PASS][265]
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr@psr2-sprite-plane-onoff:
    - shard-lnl:          [SKIP][266] ([Intel XE#2351] / [Intel XE#4996]) -> [PASS][267] +2 other tests pass
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-onoff.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-onoff.html

  * igt@kms_sequence@get-forked@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][268] ([Intel XE#4173]) -> [PASS][269] +1 other test pass
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_sequence@get-forked@pipe-a-hdmi-a-1.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@kms_sequence@get-forked@pipe-a-hdmi-a-1.html

  * igt@kms_sequence@get-idle:
    - shard-bmg:          [SKIP][270] ([Intel XE#4954] / [Intel XE#4996]) -> [PASS][271] +14 other tests pass
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_sequence@get-idle.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_sequence@get-idle.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][272] ([Intel XE#1435]) -> [PASS][273]
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@many-null-rebind:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#4208]) -> [PASS][275] +179 other tests pass
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_basic@many-null-rebind.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_exec_basic@many-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1392]) -> [PASS][277] +1 other test pass
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_system_allocator@many-free:
    - shard-bmg:          [SKIP][278] ([Intel XE#4996]) -> [PASS][279] +23 other tests pass
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_system_allocator@many-free.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_exec_system_allocator@many-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][280] ([Intel XE#5018]) -> [PASS][281]
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * {igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset}:
    - shard-lnl:          [SKIP][282] ([Intel XE#4996]) -> [PASS][283] +38 other tests pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-adlp:         [DMESG-WARN][284] ([Intel XE#4792]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-dg2-set2:     [DMESG-WARN][286] ([Intel XE#4792]) -> [PASS][287]
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_mmap@bad-object:
    - shard-adlp:         [SKIP][288] ([Intel XE#4945] / [Intel XE#4996]) -> [PASS][289] +7 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_mmap@bad-object.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@xe_mmap@bad-object.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][290], [PASS][291], [PASS][292], [PASS][293], [PASS][294], [PASS][295], [PASS][296], [PASS][297], [PASS][298], [PASS][299], [PASS][300], [PASS][301], [PASS][302], [PASS][303], [PASS][304], [PASS][305], [PASS][306], [SKIP][307], [PASS][308], [PASS][309], [PASS][310], [PASS][311], [PASS][312], [PASS][313], [PASS][314], [PASS][315]) ([Intel XE#2457]) -> ([PASS][316], [PASS][317], [PASS][318], [PASS][319], [PASS][320], [PASS][321], [PASS][322], [PASS][323], [PASS][324], [PASS][325], [PASS][326], [PASS][327], [PASS][328], [PASS][329], [PASS][330], [PASS][331], [PASS][332], [PASS][333], [PASS][334], [PASS][335], [PASS][336], [PASS][337], [PASS][338], [PASS][339], [PASS][340])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_load@load.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_module_load@load.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@xe_module_load@load.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_module_load@load.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@xe_module_load@load.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@xe_module_load@load.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@xe_module_load@load.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-1/igt@xe_module_load@load.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-1/igt@xe_module_load@load.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-1/igt@xe_module_load@load.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_load@load.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_load@load.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_load@load.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@xe_module_load@load.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@xe_module_load@load.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@xe_module_load@load.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_load@load.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@xe_module_load@load.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@xe_module_load@load.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_module_load@load.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_module_load@load.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_module_load@load.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@xe_module_load@load.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_module_load@load.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_module_load@load.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_module_load@load.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@xe_module_load@load.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@xe_module_load@load.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@xe_module_load@load.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@xe_module_load@load.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_module_load@load.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_module_load@load.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_module_load@load.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_module_load@load.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_module_load@load.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_module_load@load.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_module_load@load.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@xe_module_load@load.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_module_load@load.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@xe_module_load@load.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [ABORT][341] ([Intel XE#1794]) -> [PASS][342]
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@xe_pm@s4-exec-after.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][343] ([Intel XE#1794]) -> [PASS][344]
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#623]) -> [SKIP][346] ([Intel XE#4208] / [i915#2575])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         [SKIP][347] ([Intel XE#4996]) -> [SKIP][348] ([Intel XE#316]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-bmg:          [SKIP][349] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][350] ([Intel XE#2327]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-lnl:          [SKIP][351] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][352] ([Intel XE#1407]) +1 other test skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-90:
    - shard-adlp:         [SKIP][353] ([Intel XE#316]) -> [SKIP][354] ([Intel XE#4947] / [Intel XE#4996])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_big_fb@linear-32bpp-rotate-90.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_big_fb@linear-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#4208]) -> [SKIP][356] ([Intel XE#316]) +2 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#316]) -> [SKIP][358] ([Intel XE#4208])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_big_fb@x-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-lnl:          [SKIP][359] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][360] ([Intel XE#1124]) +1 other test skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
    - shard-adlp:         [SKIP][361] ([Intel XE#2351] / [Intel XE#4996]) -> [DMESG-FAIL][362] ([Intel XE#4543])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][363] ([Intel XE#316]) -> [SKIP][364] ([Intel XE#4996])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1124]) -> [SKIP][366] ([Intel XE#2351] / [Intel XE#4208])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#4208]) -> [SKIP][368] ([Intel XE#610])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-adlp:         [SKIP][369] ([Intel XE#1124]) -> [SKIP][370] ([Intel XE#4996])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][372] ([Intel XE#619])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#610]) -> [SKIP][374] ([Intel XE#4208])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][376] ([Intel XE#1124]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#4208]) -> [SKIP][378] ([Intel XE#1124]) +4 other tests skip
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [SKIP][379] ([Intel XE#4996]) -> [SKIP][380] ([Intel XE#1124])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
    - shard-bmg:          [SKIP][381] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][382] ([Intel XE#1124]) +1 other test skip
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1124]) -> [SKIP][384] ([Intel XE#4208]) +10 other tests skip
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][385] ([Intel XE#2191]) -> [SKIP][386] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#4208] / [i915#2575]) -> [SKIP][388] ([Intel XE#2191])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][389] ([Intel XE#367]) -> [SKIP][390] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#4208] / [i915#2575]) -> [SKIP][392] ([Intel XE#367])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [SKIP][393] ([Intel XE#367]) -> [SKIP][394] ([Intel XE#4996])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-adlp:         [SKIP][395] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][396] ([Intel XE#4996])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][398] ([Intel XE#4208]) +12 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2907]) -> [SKIP][400] ([Intel XE#4208])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#4208]) -> [SKIP][402] ([Intel XE#2907])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][403] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][404] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][405] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][406] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][407] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [INCOMPLETE][408] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-adlp:         [SKIP][409] ([Intel XE#4996]) -> [SKIP][410] ([Intel XE#455] / [Intel XE#787])
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
    - shard-bmg:          [SKIP][411] ([Intel XE#2231] / [Intel XE#4996]) -> [SKIP][412] ([Intel XE#2887])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
    - shard-lnl:          [SKIP][413] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][414] ([Intel XE#2887])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#4208]) -> [SKIP][416] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     [SKIP][417] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][418] ([Intel XE#4418])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#4208] / [i915#2575]) -> [SKIP][420] ([Intel XE#306])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#306]) -> [SKIP][422] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_chamelium_color@gamma.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-adlp:         [SKIP][423] ([Intel XE#373]) -> [SKIP][424] ([Intel XE#4996])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#4208] / [i915#2575]) -> [SKIP][426] ([Intel XE#373]) +9 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_chamelium_edid@hdmi-mode-timings.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][427] ([Intel XE#373]) -> [SKIP][428] ([Intel XE#4208] / [i915#2575]) +11 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     [SKIP][429] ([Intel XE#4208] / [i915#2575]) -> [SKIP][430] ([Intel XE#307]) +1 other test skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_content_protection@dp-mst-type-0.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [FAIL][431] ([Intel XE#1178]) -> [SKIP][432] ([Intel XE#4208] / [i915#2575])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_content_protection@legacy.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [SKIP][433] ([Intel XE#2341]) -> [FAIL][434] ([Intel XE#1178])
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_content_protection@srm.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][435] ([Intel XE#4996]) -> [SKIP][436] ([Intel XE#3278])
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_content_protection@uevent.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][437] ([Intel XE#4996]) -> [FAIL][438] ([Intel XE#1188])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_content_protection@uevent.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][439] ([Intel XE#308]) -> [SKIP][440] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#4208] / [i915#2575]) -> [SKIP][442] ([Intel XE#308]) +1 other test skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-adlp:         [SKIP][443] ([Intel XE#309]) -> [SKIP][444] ([Intel XE#4996])
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-dg2-set2:     [SKIP][445] ([Intel XE#323]) -> [SKIP][446] ([Intel XE#4208] / [i915#2575])
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-adlp:         [SKIP][447] ([Intel XE#4996]) -> [SKIP][448] ([Intel XE#4354])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_dp_link_training@non-uhbr-sst.html
    - shard-lnl:          [SKIP][449] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][450] ([Intel XE#4354])
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_dp_link_training@non-uhbr-sst.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dsc-fallback:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#4331]) -> [SKIP][452] ([Intel XE#4208])
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_dp_linktrain_fallback@dsc-fallback.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_dp_linktrain_fallback@dsc-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-adlp:         [SKIP][453] ([Intel XE#455]) -> [SKIP][454] ([Intel XE#2351] / [Intel XE#4996])
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_dsc@dsc-with-formats.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:
    - shard-dg2-set2:     [SKIP][455] ([Intel XE#4208]) -> [SKIP][456] ([Intel XE#4422])
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area.html

  * igt@kms_fbcon_fbt@psr:
    - shard-dg2-set2:     [SKIP][457] ([Intel XE#776]) -> [SKIP][458] ([Intel XE#4208])
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_fbcon_fbt@psr.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][459] ([Intel XE#4208] / [i915#2575]) -> [SKIP][460] ([Intel XE#1138])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@display-4x.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-dg2-set2:     [SKIP][461] ([Intel XE#4208] / [i915#2575]) -> [SKIP][462] ([Intel XE#1135])
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_feature_discovery@psr1.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-adlp:         [SKIP][463] ([Intel XE#310]) -> [SKIP][464] ([Intel XE#4996]) +2 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][465] ([Intel XE#2316]) -> [FAIL][466] ([Intel XE#3321])
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [SKIP][467] ([Intel XE#2316]) -> [INCOMPLETE][468] ([Intel XE#2049] / [Intel XE#2597])
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_flip@2x-flip-vs-suspend.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         [FAIL][469] ([Intel XE#2882]) -> [SKIP][470] ([Intel XE#4996])
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][471] ([Intel XE#455]) -> [SKIP][472] ([Intel XE#2351])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][473] ([Intel XE#455]) -> [SKIP][474] ([Intel XE#4208]) +4 other tests skip
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][475] ([Intel XE#455]) -> [SKIP][476] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][477] ([Intel XE#4208]) -> [SKIP][478] ([Intel XE#455]) +7 other tests skip
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:
    - shard-adlp:         [SKIP][479] ([Intel XE#651]) -> [SKIP][480] ([Intel XE#4996])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][481] ([Intel XE#4996]) -> [SKIP][482] ([Intel XE#651])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
    - shard-bmg:          [SKIP][483] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][484] ([Intel XE#2311])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][485] ([Intel XE#2311]) -> [SKIP][486] ([Intel XE#2312]) +10 other tests skip
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][487] ([Intel XE#651]) -> [SKIP][488] ([Intel XE#4208]) +19 other tests skip
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][489] ([Intel XE#651]) -> [SKIP][490] ([Intel XE#2351] / [Intel XE#4208]) +12 other tests skip
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#4208]) -> [SKIP][492] ([Intel XE#651]) +16 other tests skip
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-dg2-set2:     [SKIP][493] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][494] ([Intel XE#651]) +8 other tests skip
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-slowdraw.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][495] ([Intel XE#656]) -> [SKIP][496] ([Intel XE#4947])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][497] ([Intel XE#4141]) -> [SKIP][498] ([Intel XE#2312]) +5 other tests skip
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:
    - shard-adlp:         [SKIP][499] ([Intel XE#2351]) -> [SKIP][500] ([Intel XE#656])
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
    - shard-bmg:          [SKIP][501] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][502] ([Intel XE#4141])
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
    - shard-lnl:          [SKIP][503] ([Intel XE#2351]) -> [SKIP][504] ([Intel XE#656])
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][505] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][506] ([Intel XE#4141]) +1 other test skip
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][507] ([Intel XE#2312]) -> [SKIP][508] ([Intel XE#4141]) +10 other tests skip
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:
    - shard-bmg:          [SKIP][509] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][510] ([Intel XE#2311])
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
    - shard-adlp:         [SKIP][511] ([Intel XE#2351]) -> [SKIP][512] ([Intel XE#651])
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
    - shard-lnl:          [SKIP][513] ([Intel XE#2351]) -> [SKIP][514] ([Intel XE#651])
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][515] ([Intel XE#2312]) -> [SKIP][516] ([Intel XE#2311]) +27 other tests skip
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][517] ([Intel XE#4996]) -> [SKIP][518] ([Intel XE#656]) +1 other test skip
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
    - shard-bmg:          [SKIP][519] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][520] ([Intel XE#2313]) +1 other test skip
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
    - shard-lnl:          [SKIP][521] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][522] ([Intel XE#656]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:
    - shard-bmg:          [SKIP][523] ([Intel XE#2312]) -> [SKIP][524] ([Intel XE#2313]) +27 other tests skip
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][525] ([Intel XE#653]) -> [SKIP][526] ([Intel XE#2351] / [Intel XE#4208]) +7 other tests skip
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][527] ([Intel XE#2313]) -> [SKIP][528] ([Intel XE#2312]) +14 other tests skip
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-adlp:         [SKIP][529] ([Intel XE#4996]) -> [SKIP][530] ([Intel XE#653])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-dg2-set2:     [SKIP][531] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][532] ([Intel XE#653]) +8 other tests skip
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][533] ([Intel XE#653]) -> [SKIP][534] ([Intel XE#4208]) +24 other tests skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][535] ([Intel XE#4208]) -> [SKIP][536] ([Intel XE#653]) +18 other tests skip
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:
    - shard-adlp:         [SKIP][537] ([Intel XE#653]) -> [SKIP][538] ([Intel XE#4947])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@static-toggle:
    - shard-adlp:         [SKIP][539] ([Intel XE#455]) -> [SKIP][540] ([Intel XE#4950])
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_hdr@static-toggle.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#4298]) -> [SKIP][542] ([Intel XE#4208])
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_joiner@basic-max-non-joiner.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#2927]) -> [SKIP][544] ([Intel XE#4208])
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][545] ([Intel XE#356]) -> [SKIP][546] ([Intel XE#4208] / [i915#2575])
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_panel_fitting@legacy:
    - shard-adlp:         [SKIP][547] ([Intel XE#4950] / [Intel XE#4996]) -> [SKIP][548] ([Intel XE#455])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_panel_fitting@legacy.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@kms_panel_fitting@legacy.html
    - shard-bmg:          [SKIP][549] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][550] ([Intel XE#2486])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_panel_fitting@legacy.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-dg2-set2:     [SKIP][551] ([Intel XE#4208]) -> [SKIP][552] ([Intel XE#4359])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane_cursor@overlay:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#4208] / [i915#2575]) -> [FAIL][554] ([Intel XE#616])
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_cursor@overlay.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_multiple@2x-tiling-yf:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#4208] / [i915#2575]) -> [SKIP][556] ([Intel XE#5021])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-yf.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-dg2-set2:     [ABORT][557] ([Intel XE#4760]) -> [SKIP][558] ([Intel XE#4208] / [i915#2575])
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#4208] / [i915#2575]) -> [SKIP][560] ([Intel XE#2763] / [Intel XE#455])
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][561] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][562] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#4208]) -> [SKIP][564] ([Intel XE#870]) +1 other test skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][565] ([Intel XE#736]) -> [SKIP][566] ([Intel XE#1909])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][567] ([Intel XE#4208]) -> [SKIP][568] ([Intel XE#1489]) +9 other tests skip
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][569] ([Intel XE#1489]) -> [SKIP][570] ([Intel XE#4208]) +7 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][571] ([Intel XE#1122]) -> [SKIP][572] ([Intel XE#4208]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_psr2_su@page_flip-nv12.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-adlp:         [SKIP][573] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][574] ([Intel XE#4996])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_psr@fbc-pr-primary-page-flip.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-bmg:          [SKIP][575] ([Intel XE#2231] / [Intel XE#4954] / [Intel XE#4996]) -> [SKIP][576] ([Intel XE#2234] / [Intel XE#2850])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_psr@fbc-pr-sprite-blt.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_psr@fbc-pr-sprite-blt.html
    - shard-adlp:         [SKIP][577] ([Intel XE#4996]) -> [SKIP][578] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_psr@fbc-pr-sprite-blt.html
    - shard-lnl:          [SKIP][579] ([Intel XE#2351] / [Intel XE#4996]) -> [SKIP][580] ([Intel XE#1406])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@fbc-pr-sprite-blt.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][581] ([Intel XE#4208]) -> [SKIP][582] ([Intel XE#2850] / [Intel XE#929]) +12 other tests skip
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][583] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][584] ([Intel XE#4208]) +14 other tests skip
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_psr@fbc-psr2-sprite-plane-move.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html

  * igt@kms_psr@pr-dpms:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][586] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_psr@pr-dpms.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][587] ([Intel XE#2351] / [Intel XE#4208]) -> [SKIP][588] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_psr@psr-dpms.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_psr@psr-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][589] ([Intel XE#1127]) -> [SKIP][590] ([Intel XE#4208] / [i915#2575])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][591] ([Intel XE#4208] / [i915#2575]) -> [SKIP][592] ([Intel XE#1127])
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][593] ([Intel XE#3414]) -> [SKIP][594] ([Intel XE#4208] / [i915#2575])
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     [SKIP][595] ([Intel XE#4208] / [i915#2575]) -> [SKIP][596] ([Intel XE#3414]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_rotation_crc@sprite-rotation-270.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-adlp:         [SKIP][597] ([Intel XE#455]) -> [SKIP][598] ([Intel XE#4996]) +2 other tests skip
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_setmode@clone-exclusive-crtc.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][599] ([Intel XE#2426]) -> [FAIL][600] ([Intel XE#1729])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#1500]) -> [SKIP][602] ([Intel XE#4208] / [i915#2575])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][603] ([Intel XE#455]) -> [SKIP][604] ([Intel XE#4208] / [i915#2575]) +10 other tests skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_vrr@flip-dpms.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#4208] / [i915#2575]) -> [SKIP][606] ([Intel XE#455]) +8 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_vrr@flipline.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          [SKIP][607] ([Intel XE#4996]) -> [SKIP][608] ([Intel XE#1499])
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_vrr@negative-basic.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_vrr@negative-basic.html
    - shard-adlp:         [SKIP][609] ([Intel XE#4996]) -> [SKIP][610] ([Intel XE#455]) +1 other test skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_vrr@negative-basic.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_vrr@negative-basic.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#4208] / [i915#2575]) -> [SKIP][612] ([Intel XE#756])
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     [SKIP][613] ([Intel XE#756]) -> [SKIP][614] ([Intel XE#4208] / [i915#2575])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_writeback@writeback-fb-id.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html

  * igt@testdisplay:
    - shard-dg2-set2:     [ABORT][615] -> [ABORT][616] ([Intel XE#2705])
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@testdisplay.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-463/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][617] ([Intel XE#4208]) -> [SKIP][618] ([Intel XE#1123]) +1 other test skip
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         [SKIP][619] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][620] ([Intel XE#1123])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#1126]) -> [SKIP][622] ([Intel XE#4208])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#4497]) -> [SKIP][624] ([Intel XE#4208]) +3 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_eu_stall@invalid-gt-id.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eu_stall@invalid-sampling-rate:
    - shard-dg2-set2:     [SKIP][625] ([Intel XE#4208]) -> [SKIP][626] ([Intel XE#4497])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eu_stall@invalid-sampling-rate.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_eu_stall@invalid-sampling-rate.html

  * igt@xe_eudebug@basic-client:
    - shard-adlp:         [SKIP][627] ([Intel XE#4837]) -> [SKIP][628] ([Intel XE#4945])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@xe_eudebug@basic-client.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_eudebug@basic-client.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#4837]) -> [SKIP][630] ([Intel XE#4208]) +16 other tests skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eudebug@basic-close.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-access-userptr-faultable:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#4208]) -> [SKIP][632] ([Intel XE#4837]) +17 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eudebug@basic-vm-access-userptr-faultable.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_eudebug@basic-vm-access-userptr-faultable.html

  * igt@xe_eudebug_online@basic-breakpoint:
    - shard-bmg:          [SKIP][633] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][634] ([Intel XE#4837])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_eudebug_online@basic-breakpoint.html
    - shard-adlp:         [SKIP][635] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][636] ([Intel XE#4837])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_eudebug_online@basic-breakpoint.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_eudebug_online@basic-breakpoint.html
    - shard-lnl:          [SKIP][637] ([Intel XE#4996]) -> [SKIP][638] ([Intel XE#4837])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_eudebug_online@basic-breakpoint.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@xe_eudebug_online@basic-breakpoint.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#4518]) -> [SKIP][640] ([Intel XE#4208])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     [SKIP][641] ([Intel XE#4208]) -> [SKIP][642] ([Intel XE#1392]) +3 other tests skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][643] ([Intel XE#1392]) -> [SKIP][644] ([Intel XE#4208]) +1 other test skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][645] ([Intel XE#1392]) -> [SKIP][646] ([Intel XE#4945]) +1 other test skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-lnl:          [SKIP][647] ([Intel XE#4996]) -> [SKIP][648] ([Intel XE#1392])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
    - shard-adlp:         [SKIP][649] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][650] ([Intel XE#1392])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
    - shard-bmg:          [SKIP][651] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][652] ([Intel XE#2322])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:
    - shard-adlp:         [SKIP][653] ([Intel XE#288]) -> [SKIP][654] ([Intel XE#4945]) +4 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][655] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][656] ([Intel XE#288])
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#4208]) -> [SKIP][658] ([Intel XE#288]) +28 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#288]) -> [SKIP][660] ([Intel XE#4208]) +35 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#2360]) -> [SKIP][662] ([Intel XE#4208])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         [SKIP][663] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][664] ([Intel XE#2360])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     [SKIP][665] ([Intel XE#4208]) -> [SKIP][666] ([Intel XE#2360])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_reset@cat-error:
    - shard-adlp:         [DMESG-WARN][667] ([Intel XE#3868]) -> [SKIP][668] ([Intel XE#4945])
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@xe_exec_reset@cat-error.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec_reset@cat-error.html

  * igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:
    - shard-adlp:         [SKIP][669] ([Intel XE#4915]) -> [SKIP][670] ([Intel XE#4945] / [Intel XE#4996]) +35 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap.html

  * igt@xe_exec_system_allocator@many-mmap-shared:
    - shard-adlp:         [SKIP][671] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][672] ([Intel XE#4915]) +13 other tests skip
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec_system_allocator@many-mmap-shared.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@xe_exec_system_allocator@many-mmap-shared.html

  * igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#4915]) -> [SKIP][674] ([Intel XE#4208]) +185 other tests skip
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#4208]) -> [SKIP][676] ([Intel XE#4915]) +166 other tests skip
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-bmg:          [ABORT][677] -> [ABORT][678] ([Intel XE#4917])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-lnl:          [FAIL][679] ([Intel XE#5012]) -> [ABORT][680] ([Intel XE#4911])
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-adlp:         [FAIL][681] ([Intel XE#5012]) -> [TIMEOUT][682] ([Intel XE#4911])
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
    - shard-bmg:          [FAIL][683] ([Intel XE#5012]) -> [ABORT][684] ([Intel XE#4911])
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][685] ([Intel XE#255]) -> [SKIP][686] ([Intel XE#4208])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_huc_copy@huc_copy.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_oa@buffer-size:
    - shard-dg2-set2:     [SKIP][687] ([Intel XE#4501]) -> [SKIP][688] ([Intel XE#4208])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@buffer-size.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_oa@buffer-size.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][689] ([Intel XE#4208]) -> [SKIP][690] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@missing-sample-flags.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@polling-small-buf:
    - shard-dg2-set2:     [SKIP][691] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][692] ([Intel XE#4208]) +5 other tests skip
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@polling-small-buf.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_oa@polling-small-buf.html

  * igt@xe_oa@syncs-syncobj-wait-cfg:
    - shard-adlp:         [SKIP][693] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][694] ([Intel XE#4945])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][696] ([Intel XE#4208])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_oa@syncs-syncobj-wait-cfg.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#4208]) -> [SKIP][698] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@syncs-ufence-wait.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-adlp:         [SKIP][699] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][700] ([Intel XE#2541] / [Intel XE#3573])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_oa@unprivileged-single-ctx-counters.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-dg2-set2:     [SKIP][701] ([Intel XE#1337]) -> [SKIP][702] ([Intel XE#4208])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_pat@display-vs-wb-transient.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][703] ([Intel XE#977]) -> [SKIP][704] ([Intel XE#4208])
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][705] ([Intel XE#4208]) -> [SKIP][706] ([Intel XE#979])
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][707] ([Intel XE#1061] / [Intel XE#4208]) -> [FAIL][708] ([Intel XE#1173])
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_peer2peer@write.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][710] ([Intel XE#4208]) +1 other test skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_pm@d3cold-mmap-vram.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][711] ([Intel XE#4208]) -> [SKIP][712] ([Intel XE#2284])
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@d3cold-mocs.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][713] ([Intel XE#4208]) -> [SKIP][714] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][715] ([Intel XE#4208]) -> [SKIP][716] ([Intel XE#579])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-dg2-set2:     [SKIP][717] ([Intel XE#4650]) -> [SKIP][718] ([Intel XE#4208])
   [717]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [718]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-dg2-set2:     [SKIP][719] ([Intel XE#4208]) -> [SKIP][720] ([Intel XE#4733]) +1 other test skip
   [719]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [720]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:
    - shard-dg2-set2:     [SKIP][721] ([Intel XE#4733]) -> [SKIP][722] ([Intel XE#4208]) +1 other test skip
   [721]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html
   [722]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         [SKIP][723] ([Intel XE#4945] / [Intel XE#4996]) -> [SKIP][724] ([Intel XE#944])
   [723]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_query@multigpu-query-config.html
   [724]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_query@multigpu-query-config.html
    - shard-bmg:          [SKIP][725] ([Intel XE#4954] / [Intel XE#4996]) -> [SKIP][726] ([Intel XE#944])
   [725]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_query@multigpu-query-config.html
   [726]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_query@multigpu-query-config.html
    - shard-lnl:          [SKIP][727] ([Intel XE#4996]) -> [SKIP][728] ([Intel XE#944])
   [727]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_query@multigpu-query-config.html
   [728]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][729] ([Intel XE#944]) -> [SKIP][730] ([Intel XE#4208]) +2 other tests skip
   [729]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
   [730]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][731] ([Intel XE#4208]) -> [SKIP][732] ([Intel XE#944]) +1 other test skip
   [731]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_query@multigpu-query-invalid-extension.html
   [732]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-adlp:         [SKIP][733] ([Intel XE#944]) -> [SKIP][734] ([Intel XE#4945])
   [733]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_query@multigpu-query-mem-usage.html
   [734]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_render_copy@render-stress-0-copies:
    - shard-dg2-set2:     [SKIP][735] ([Intel XE#4208]) -> [SKIP][736] ([Intel XE#4814])
   [735]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_render_copy@render-stress-0-copies.html
   [736]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_render_copy@render-stress-0-copies.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     [SKIP][737] ([Intel XE#4814]) -> [SKIP][738] ([Intel XE#4208])
   [737]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_render_copy@render-stress-1-copies.html
   [738]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     [SKIP][739] ([Intel XE#4821]) -> [SKIP][740] ([Intel XE#4208])
   [739]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html
   [740]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][741] ([Intel XE#4208]) -> [SKIP][742] ([Intel XE#4130]) +1 other test skip
   [741]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [742]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-dg2-set2:     [SKIP][743] ([Intel XE#4130]) -> [SKIP][744] ([Intel XE#4208])
   [743]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
   [744]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets:
    - shard-dg2-set2:     [SKIP][745] ([Intel XE#4208]) -> [SKIP][746] ([Intel XE#4351])
   [745]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html
   [746]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1469]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1469
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4618]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8362 -> IGT_8363
  * Linux: xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089 -> xe-pw-148951v1

  IGT_8362: 8362
  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089: 4fd790cf2b20fd2ab205aa2a074cecd214562089
  xe-pw-148951v1: 148951v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/index.html

--===============6267565366890195186==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: various small cleanups</td=
></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148951/">https://patchwork.freedesktop.org/series/148951/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148951v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3084-4fd790cf2b20fd2ab205aa2a074cecd21=
4562089_FULL -&gt; xe-pw-148951v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148951v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148951v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1489=
51v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_sequence@get-busy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@kms_seq=
uence@get-busy.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_sequence@get-busy.html">S=
KIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_exec_reset@virtual-gt-re=
set.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel =
XE#656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-sp=
r-indfb-draw-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sha=
rd-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SK=
IP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_psr=
2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2=
/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_psr=
2_su@page_flip-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_ps=
r2_su@page_flip-xrgb8888.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_psr=
@psr2-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/i=
gt@kms_psr@psr2-sprite-render.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_tv_=
load_detect@load-detect.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/330">Intel XE#330</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_tv_l=
oad_detect@load-detect.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_vrr=
@flip-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_vrr@flip-basic.h=
tml">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148951v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@fbdev@=
write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148951v1/shard-dg2-464/igt@fbdev@write.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-debugfs-read-all-entries-display-off:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@intel_sysfs_debugfs@xe-debu=
gfs-read-all-entries-display-off.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE#4618</a>)=
</li>
</ul>
</li>
<li>
<p>igt@intel_sysfs_debugfs@xe-sysfs-read-all-entries:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@intel_=
sysfs_debugfs@xe-sysfs-read-all-entries.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@int=
el_sysfs_debugfs@xe-sysfs-read-all-entries.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4618">Intel XE=
#4618</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_addfb_basic@invalid-smem=
-bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_addfb_basic@invalid-smem-=
bo-on-discrete.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
lnl-5/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/911">Intel XE#911</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_asyn=
c_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other te=
st fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_bi=
g_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@k=
ms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rot=
ate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_big=
_fb@linear-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_=
big_fb@linear-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +11=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rot=
ate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-2/igt@kms_big_fb@y-tiled-max-hw-str=
ide-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-a=
dlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html=
">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4543">Intel XE#4543</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-32bpp-ro=
tate-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-=
stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/ig=
t@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_bw@linear-tiling-2-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_ccs@bad-pixel-format-yf-t=
iled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_ccs@bad-rotation-90-4-t=
iled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +=
31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@kms_ccs@crc-primary-basic-4-t=
iled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-lnl-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-t=
iled-lnl-ccs@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
yf-tiled-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +14 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_ccs@crc-primary-suspend-=
yf-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-mc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_ccs@random-ccs-data-4-ti=
led-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_ccs@random-ccs-data-4-til=
ed-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-46=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_cdclk@mode-transition.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4417">Intel XE#4417</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_cdclk@mode-transition.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-9/igt@kms_cdclk@mode-transition@pi=
pe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4417">Intel XE#4417</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_chamelium_color@ctm-red=
-to-blue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-r=
esolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_chamelium_edid@dp-edid-re=
solution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_chamelium_edid@dp-edid-=
resolution-list.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_chamelium_frames@hdmi-crc=
-nonplanar-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_content_protection@lic-=
type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_protection@srm@pi=
pe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_protection@uevent=
@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_cursor_crc@cursor-rapid-m=
ovement-256x85.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_cursor_crc@cursor-slidi=
ng-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_cursor_legacy@cursora-vs=
-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_cursor_legacy@cursora-vs-=
flipb-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sh=
ard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying=
-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-4/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired=
-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +15 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms=
_flip@2x-flip-vs-expired-vblank@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)=
 +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-suspend-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@b=
c-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_flip@2x-single-buffer-fl=
ip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other=
 test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_flip@2x-single-buffer-fli=
p-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_flip=
@2x-wf_vblank-ts-check.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@kms_flip@2x-wf_vblank-=
ts-check.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vbla=
nk-interruptible@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vb=
lank@c-dp4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/301">Intel XE#301</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_flip@flip-vs-suspend.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8/igt@kms_flip=
@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/i=
gt@kms_flip@plain-flip-fb-recreate-interruptible@a-hdmi-a3.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel =
XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sha=
rd-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscal=
ing.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1=
745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Inte=
l XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#=
4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +22 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_frontbuffer_tracking@fb=
cdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1469">Intel XE#1469</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-=
1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests =
skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_frontbuffer_tracking@psr=
-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@psr=
-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@ps=
r-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-4k:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_hdmi_inject@inject-4k.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1470">Intel XE#1470</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@invalid-create-leases:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_lease@invalid-create-le=
ases.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/i915/kernel/-/issues/2575">i915#2575</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_plane_cursor@overlay@pi=
pe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_plane_lowres@tiling-4.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_multiple@tiling-y=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5020">Intel XE#5020</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-d.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_plane_scaling@plane-downs=
cale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other=
 tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_plane_scaling@plane-down=
scale-factor-0-25-with-rotation@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_plane_scaling@planes-upsc=
ale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +9 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_pm_backlight@fade-with-dp=
ms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/870">Intel XE#870</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_pm_backlight@fade-with-d=
pms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/870">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-=
dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_pm_=
dc@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Inte=
l XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-8/igt@kms_pm_d=
c@dc6-psr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148951v1/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE=
#718</a>) +1 other test fail</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_pro=
p_blob@basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_prop_blob@basic.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">I=
ntel XE#4950</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_psr2_sf@pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/igt@kms_psr@fbc-psr-primary-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-rend=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_psr@fbc-psr2-primary-blt.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@kms_psr@fbc-psr2-primary-blt@=
edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4609">Intel XE#4609</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_psr_stress_test@flip-pr=
imary-invalidate-overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-=
tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@kms_vrr@cmrr.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_compute_preempt@compute-p=
reempt-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_create@create-big-vram.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/1062">Intel XE#1062</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-single-full-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_drm_fdinfo@utilization-si=
ngle-full-load.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4945">Intel XE#4945</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multiple-sessions:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_eudebug@multiple-session=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-2/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebu=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4519">Intel XE#4519</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-eudebug=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_evict@evict-beng-small-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many=
-execqueues-many-vm-userptr-invalidate-race.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1=
 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@xe_exec_basic@multigpu-no-exe=
c-bindexecqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_exe=
c_basic@multigpu-once-null.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_basic@mu=
ltigpu-once-null.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_basic@once-userptr-=
invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +153 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-userptr-free:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@xe_exec=
_compute_mode@once-userptr-free.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec_comp=
ute_mode@once-userptr-free.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +18 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_exec_fault_mode@many-exe=
cqueues-basic-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_exec_fault_mode@once-user=
ptr-invalidate-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@xe_exec_sip_eudebug@breakpoin=
t-waitsip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4837">Intel XE#4837</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_exec_system_allocator@pro=
cess-many-execqueues-free.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +42 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-free-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_system_allocator@pr=
ocess-many-execqueues-free-race.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +99 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_exec_system_allocator@proc=
ess-many-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-execqueues-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_exec_system_allocator@thre=
ads-many-execqueues-mmap-free-huge.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_device_probe_early=
:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_device_probe_early.html">PASS</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1=
/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_device_=
probe_early.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +5 other tests dmesg-warn</l=
i>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_mmap@pci-membarrier-paral=
lel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4045">Intel XE#4045</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-6/igt@xe_mmap@pci-membarrier-parall=
el.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_module_load@force-load.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_oa@invalid-oa-format-id.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_oa@non-system-wide-paran=
oid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_oa@syncs-userptr-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_pm@d3cold-multiple-execs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-1/igt@xe_pm@s4=
-mocs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148951v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_pxp@pxp-stale-bo-bind-po=
st-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-adlp-6/igt@xe_query@multigpu-query-oa-u=
nits.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_query@multigpu-query-oa-un=
its.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_query@multigpu-query-uc-=
fw-version-huc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/igt@xe_sriov_flr@flr-each-isola=
tion.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3342">Intel XE#3342</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_sriov_flr@flr-each-isolati=
on.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-userptr-inval-many-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_vm@m=
unmap-style-unbind-userptr-inval-many-all.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe=
_vm@munmap-style-unbind-userptr-inval-many-all.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@core_hot=
unplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@core_hotun=
plug@unplug-rescan.html">PASS</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@core_ho=
tunplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@core_hot=
unplug@unplug-rescan.html">PASS</a></li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@core_hot=
unplug@unplug-rescan.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-6/igt@core_hotun=
plug@unplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@core_s=
etmaster@master-drop-set-user.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt=
@core_setmaster@master-drop-set-user.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@fbdev@=
info.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2134">Intel XE#2134</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@fbdev@info.html">PASS</a=
></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_asy=
nc_flips@invalid-async-flip@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-adlp-9/igt@kms_async_flips@invalid-async-flip@pipe-c-hdmi-a-1.ht=
ml">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148951v1/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x=
1080p.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PAS=
S</a> +12 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_curs=
or_legacy@cursor-vs-flip-atomic-transitions.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3226">Intel XE#3226=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.ht=
ml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148951v1/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-trans=
itions-varying-size.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_a=
ux_dev.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3009">Intel XE#3009</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_dp_aux_dev.html">PAS=
S</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-b=
mg-1/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fe=
ature_discovery@display.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2=
-434/igt@kms_feature_discovery@display.html">PASS</a> +91 other tests pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard=
-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a>=
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
bmg-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">PASS</a> +=
10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_fli=
p@flip-vs-expired-vblank@a-hdmi-a1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-8/i=
gt@kms_flip@flip-vs-expired-vblank@a-hdmi-a1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fli=
p@flip-vs-suspend@d-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1=
/shard-adlp-4/igt@kms_flip@flip-vs-suspend@d-hdmi-a1.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel =
XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148951v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-s=
hrfb-draw-blt.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_hdm=
i_inject@inject-audio.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@kms_hdmi_inject@injec=
t-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_pip=
e_crc_basic@hang-read-crc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_=
pipe_crc_basic@hang-read-crc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-x.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/ig=
t@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-4/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.htm=
l">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@=
psr2-sprite-plane-onoff.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl=
-1/igt@kms_psr@psr2-sprite-plane-onoff.html">PASS</a> +2 other tests pass</=
li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_seq=
uence@get-forked@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-ad=
lp-3/igt@kms_sequence@get-forked@pipe-a-hdmi-a-1.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_sequ=
ence@get-idle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms=
_sequence@get-idle.html">PASS</a> +14 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bm=
g-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-null-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exe=
c_basic@many-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_e=
xec_basic@many-null-rebind.html">PASS</a> +179 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg=
2-433/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> +1 ot=
her test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-free:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_=
system_allocator@many-free.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_e=
xec_system_allocator@many-free.html">PASS</a> +23 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-1/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap-nomemset}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_=
system_allocator@twice-large-malloc-bo-unmap-nomemset.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#49=
96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8951v1/shard-lnl-2/igt@xe_exec_system_allocator@twice-large-malloc-bo-unmap=
-nomemset.html">PASS</a> +38 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Intel=
 XE#4792</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148951v1/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-functio=
n-xe_wopcm_init.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_fau=
lt_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792">Inte=
l XE#4792</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148951v1/shard-dg2-432/igt@xe_fault_injection@inject-fault-probe-funct=
ion-xe_wopcm_init.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@bad-object:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_mmap=
@bad-object.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@xe_m=
map@bad-object.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-8=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-b=
mg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/sha=
rd-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089=
/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd21456=
2089/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd2=
14562089/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074c=
ecd214562089/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a=
074cecd214562089/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205=
aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2a=
b205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20=
fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf=
2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-4fd7=
90cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3084-=
4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3=
084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_load=
@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/sh=
ard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd21456208=
9/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a>) -&gt; (=
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-4/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-b=
mg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-b=
mg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@xe_pm@s=
4-exec-after.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/igt@xe_pm@s4-exec-af=
ter.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-2/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-5/igt@xe_pm@s4-v=
m-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_ad=
dfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-=
464/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big=
_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@km=
s_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test s=
kip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
bmg-6/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +=
1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_=
fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
lnl-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +=
1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_big=
_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_b=
ig_fb@linear-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt=
@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_bi=
g_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@k=
ms_big_fb@x-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_big_=
fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard=
-lnl-4/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)=
 +1 other test skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big=
_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shar=
d-adlp-8/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@kms_big=
_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms=
_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt=
@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bi=
g_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/=
igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@kms_big=
_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@km=
s_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433=
/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_bi=
g_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/=
igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">In=
tel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148951v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-r=
otate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148951v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-1=
80-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard=
-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Inte=
l XE#1124</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_big_=
fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4=
996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148951v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_bw=
@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/=
shard-dg2-464/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i91=
5/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-148951v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1=
920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_bw=
@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-46=
4/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_bw=
@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-435/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">=
Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-1/igt@kms_bw@=
linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/=
igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_ccs=
@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14895=
1v1/shard-adlp-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#78=
7</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
951v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4208">Intel XE#4208</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard=
-dg2-464/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cc=
s@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard=
-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Inte=
l XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#=
4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148951v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-mc-ccs.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_cc=
s@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sha=
rd-dg2-464/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2=
351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148951v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel X=
E#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-=
2/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel=
 XE#787</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-bmg-8/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Inte=
l XE#2887</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_ccs@=
random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-lnl-1/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Inte=
l XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg=
2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787"=
>Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/s=
hard-dg2-436/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418">Intel XE#4=
418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ch=
amelium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-=
435/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_ch=
amelium_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_chameli=
um_color@gamma.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_cha=
melium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-a=
dlp-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel =
XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ch=
amelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sh=
ard-dg2-435/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373<=
/a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_ch=
amelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-=
464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/=
2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_co=
ntent_protection@dp-mst-type-0.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sh=
ard-dg2-433/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_c=
ontent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cont=
ent_protection@srm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_content_=
protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-8/igt@kms_conte=
nt_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_cont=
ent_protection@uevent.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@kms_conte=
nt_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_cu=
rsor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/=
igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i91=
5#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_cu=
rsor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/=
shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#=
308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_cur=
sor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_cu=
rsor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel=
 XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148951v1/shard-dg2-464/igt@kms_cursor_legacy@short-busy-flip-before-curs=
or-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_dp_=
link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-1/igt@kms=
_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-l=
nl-8/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dsc-fallback:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_dp=
_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4331">Intel XE#4331</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/=
igt@kms_dp_linktrain_fallback@dsc-fallback.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_dsc=
@dsc-with-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_dsc@dsc-wi=
th-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fb=
c_dirty_rect@fbc-dirty-rectangle-out-visible-area.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-432/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-out-visible-a=
rea.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_fb=
con_fbt@psr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/776">Intel XE#776</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_fbcon_fbt@psr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fe=
ature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-43=
3/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_fli=
p@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp=
-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-6/igt@kms_flip@2x=
-flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fli=
p@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shar=
d-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">In=
tel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#=
455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yft=
ile-upscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148951v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64=
bpp-ytile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148951v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208"=
>Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148951v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-ytile-t=
o-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951=
v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954"=
>Intel XE#4954</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@d=
rrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#231=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-ind=
fb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sha=
rd-dg2-436/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">I=
ntel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/=
shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-slowdraw.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#=
651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14895=
1v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-dra=
w-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4=
141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/656">Intel XE#656</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Int=
el XE#4954</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148951v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur=
-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1=
/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954"=
>Intel XE#4954</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148951v1/shard-bmg-8/igt@kms_frontbuffer_tracking@f=
bc-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +1 other test =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954"=
>Intel XE#4954</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148951v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-prim=
scrn-spr-indfb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#235=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
951v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-ind=
fb-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/651">Intel XE#651</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel=
 XE#2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel =
XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148951v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pr=
i-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel X=
E#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4954">Intel XE#4954</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-7/igt@kms_frontbuffer_trac=
king@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) =
+1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148951v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsr-2p=
-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-spr-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +7 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
951v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sha=
rd-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">I=
ntel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel=
 XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plfli=
p-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shar=
d-adlp-2/igt@kms_frontbuffer_tracking@psr-rgb101010-draw-mmap-wc.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">=
Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-3/igt@kms_hdr=
@static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_hdr@static-to=
ggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_jo=
iner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms=
_joiner@basic-max-non-joiner.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_jo=
iner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464=
/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg=
2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_pan=
el_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-3/i=
gt@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_pane=
l_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-2/ig=
t@kms_panel_fitting@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pi=
pe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/=
igt@kms_pipe_stress@stress-xrgb8888-ytiled.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4359">Intel XE#4359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pl=
ane_cursor@overlay.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/=
igt@kms_plane_cursor@overlay.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-yf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pl=
ane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-d=
g2-435/igt@kms_plane_multiple@2x-tiling-yf.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_pl=
ane_scaling@intel-max-src-size.html">ABORT</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/=
igt@kms_plane_scaling@intel-max-src-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pl=
ane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel X=
E#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/is=
sues/2575">i915#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscal=
e-factor-0-25-with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</l=
i>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@=
kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_pm_d=
c@dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_pm_dc@=
dc3co-vpb-simulation.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ps=
r2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/s=
hard-dg2-432/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/14=
89">Intel XE#1489</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_ps=
r2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-4=
64/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@kms_ps=
r2_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_psr2=
_su@page_flip-nv12.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@kms_psr=
@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adl=
p-2/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_psr@=
fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/s=
hard-bmg-8/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2=
850</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_psr=
@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_psr@fbc=
-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip<=
/li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_psr@=
fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-1/ig=
t@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms=
_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_ps=
r@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
dg2-464/igt@kms_psr@fbc-psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_ps=
r@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_psr=
@pr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ps=
r@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@kms_=
psr@psr-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg=
2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@kms_ro=
tation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
dg2-464/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel =
XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/i=
ssues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_ro=
tation_crc@sprite-rotation-270.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sh=
ard-dg2-432/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#341=
4</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@kms_set=
mode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@kms_se=
tmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-1/igt@km=
s_tiled_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@kms_ti=
led_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/s=
hard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/=
kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@kms_vr=
r@flip-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_vrr@flip-dpms.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
i915/kernel/-/issues/2575">i915#2575</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_vr=
r@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@kms_=
vrr@flipline.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@kms_vrr@=
negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@kms_vrr@negative=
-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1499">Intel XE#1499</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@kms_vrr=
@negative-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@kms_vrr@negati=
ve-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@kms_wr=
iteback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148951v1/shard-dg2-436/igt@kms_writeback@writeback-check-output-xrgb210101=
0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@kms_wr=
iteback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@kms_wri=
teback@writeback-fb-id.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@testdi=
splay.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148951v1/shard-dg2-463/igt@testdisplay.html">ABORT</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_cop=
y_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-434/=
igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_copy=
_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/sha=
rd-adlp-8/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_cop=
y_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt=
@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_eu_=
stall@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4497">Intel XE#4497</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_eu_sta=
ll@invalid-gt-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-sampling-rate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eu_=
stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@x=
e_eu_stall@invalid-sampling-rate.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-client:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@xe_eude=
bug@basic-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_eudebug@ba=
sic-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eud=
ebug@basic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_eudebug@b=
asic-close.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-userptr-faultable:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_eud=
ebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg=
2-433/igt@xe_eudebug@basic-vm-access-userptr-faultable.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4=
837</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@basic-breakpoint:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_eudeb=
ug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-=
bmg-5/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</=
li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_eude=
bug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard=
-adlp-2/igt@xe_eudebug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)=
</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_eudeb=
ug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-7/igt@xe_e=
udebug_online@basic-breakpoint.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_eud=
ebug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_eude=
bug_sriov@deny-sriov.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqu=
eues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-dg2-464/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_exec=
_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8951v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-i=
nvalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_exec_=
basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-ln=
l-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1=
392</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec=
_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#49=
96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8951v1/shard-adlp-3/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1392">Intel XE#1392</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_exec_=
basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148=
951v1/shard-bmg-4/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
22">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@xe_exec=
_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-a=
dlp-2/igt@xe_exec_fault_mode@many-bindexecqueue-rebind-imm.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel =
XE#4945</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec=
_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4=
945">Intel XE#4945</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-4/igt@xe_exec_fault_mode@ma=
ny-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#2=
88</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exe=
c_fault_mode@many-execqueues-userptr-invalidate-imm.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-433/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidat=
e-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_exe=
c_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2=
-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/s=
hard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec=
_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel=
 XE#4996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148951v1/shard-adlp-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dm=
a-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exe=
c_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-d=
g2-436/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE=
#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cat-error:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-8/igt@xe_exec=
_reset@cat-error.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_exec=
_reset@cat-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-malloc-bo-unmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-9/igt@xe_exec=
_system_allocator@many-large-execqueues-malloc-bo-unmap.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#=
4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148951v1/shard-adlp-2/igt@xe_exec_system_allocator@many-large-execqueues-ma=
lloc-bo-unmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +35 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-shared:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_exec=
_system_allocator@many-mmap-shared.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-adlp-1/igt@xe_exec_system_allocator@many-mmap-shared.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Inte=
l XE#4915</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-execqueues-malloc-mlock-=
nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@xe_exe=
c_system_allocator@threads-many-large-execqueues-malloc-mlock-nomemset.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-=
many-large-execqueues-malloc-mlock-nomemset.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1=
85 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48951v1/shard-dg2-432/igt@xe_exec_system_allocator@threads-shared-vm-many-l=
arge-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a>) +166 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-6/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-5/ig=
t@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE=
#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1=
/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4911">Intel XE#4911</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_faul=
t_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v=
1/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.=
html">TIMEOUT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4911">Intel XE#4911</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1=
/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_huc=
_copy@huc_copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_huc_copy@huc_=
copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@=
buffer-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4501">Intel XE#4501</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_oa@buffer-size=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@=
missing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe_oa@mi=
ssing-sample-flags.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@polling-small-buf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_oa@=
polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/=
igt@xe_oa@polling-small-buf.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-wait-cfg:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-2/igt@xe_oa@s=
yncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-adlp-2/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-433/igt@xe_oa@=
syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1489=
51v1/shard-dg2-464/igt@xe_oa@syncs-syncobj-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_oa@=
syncs-ufence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@xe_oa@syncs=
-ufence-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_oa@u=
nprivileged-single-ctx-counters.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/s=
hard-adlp-3/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2=
541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/35=
73">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_pat=
@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_p=
at@display-vs-wb-transient.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_pat=
@pat-index-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_pat@pat-index=
-xe2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-432/igt@xe_pat@pat-i=
ndex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-433/igt@xe=
_peer2peer@write.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-463/igt@xe_pm@=
d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@=
xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@=
s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-436/igt@xe_p=
m@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pm@=
vram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/igt@xe_pm@v=
ram-d3cold-threshold.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_pmu=
@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464=
/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_pxp=
@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/=
igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +1 o=
ther test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-436/igt@xe_pxp=
@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-d=
g2-464/igt@xe_pxp@pxp-stale-bo-exec-post-termination-irq.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-4/igt@xe_quer=
y@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adl=
p-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-bmg-5/igt@xe_query=
@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-bmg-=
4/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-lnl-3/igt@xe_query=
@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-lnl-3/igt@xe_query=
@multigpu-query-config.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-434/igt@xe_que=
ry@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_qu=
ery@multigpu-query-engines.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_que=
ry@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-4=
32/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)=
 +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-adlp-6/igt@xe_quer=
y@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-adlp-2/igt@xe_qu=
ery@multigpu-query-mem-usage.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-0-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_ren=
der_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-435/=
igt@xe_render_copy@render-stress-0-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-466/igt@xe_ren=
der_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/=
igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-435/igt@xe_spi=
n_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4821">Intel XE#4821</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg2-464/igt@xe_spin=
_batch@spin-mem-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148951v1/shard-dg2-433/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-432/igt@xe_sri=
ov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel X=
E#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148951v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@selfconfig-reprovis=
ion-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089/shard-dg2-464/igt@xe_sri=
ov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148951v1/shard-dg=
2-436/igt@xe_sriov_scheduling@nonpreempt-engine-resets.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351">Intel XE#4=
351</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8362 -&gt; IGT_8363</li>
<li>Linux: xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089 -&gt; xe-pw-148=
951v1</li>
</ul>
<p>IGT_8362: 8362<br />
  IGT_8363: 58f45de87b977a0134e8deae8d2103c7a8ccd3fc @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3084-4fd790cf2b20fd2ab205aa2a074cecd214562089: 4fd790cf2b20fd2ab205aa2=
a074cecd214562089<br />
  xe-pw-148951v1: 148951v1</p>

</body>
</html>

--===============6267565366890195186==--
