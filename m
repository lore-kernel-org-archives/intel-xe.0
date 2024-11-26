Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E66D65552
	for <intel-xe@archiver.kernel.org>; Tue, 26 Nov 2024 19:45:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C7DB10E036;
	Tue, 26 Nov 2024 19:45:59 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CEFA10E083;
 Tue, 26 Nov 2024 19:45:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0153457874220442357=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Make_OA_buffer_size_config?=
 =?utf-8?q?urable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sai Teja Pottumuttu" <sai.teja.pottumuttu@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 26 Nov 2024 19:45:58 -0000
Message-ID: <173265035835.3458792.10562123717851952075@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
In-Reply-To: <20241126163553.449850-1-sai.teja.pottumuttu@intel.com>
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

--===============0153457874220442357==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Make OA buffer size configurable (rev2)
URL   : https://patchwork.freedesktop.org/series/141795/
State : failure

== Summary ==

CI Bug Log - changes from xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198_full -> xe-pw-141795v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141795v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141795v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141795v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_getversion@basic:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@core_getversion@basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_getversion@basic.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01.html

  * igt@xe_drm_fdinfo@utilization-others-idle:
    - shard-lnl:          [PASS][5] -> [FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-idle.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-idle.html

  
#### Warnings ####

  * igt@xe_module_load@reload:
    - shard-bmg:          [DMESG-WARN][7] ([Intel XE#3467]) -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_module_load@reload.html

  * igt@xe_pm@s3-mocs:
    - shard-bmg:          [SKIP][9] ([Intel XE#1130]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s3-mocs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_pm@s3-mocs.html

  
Known issues
------------

  Here are the changes found in xe-pw-141795v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getclient:
    - shard-dg2-set2:     [PASS][11] -> [SKIP][12] ([Intel XE#2423]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_getclient.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_getclient.html

  * igt@core_getversion@all-cards:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3249])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@core_getversion@all-cards.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-dg2-set2:     [PASS][15] -> [SKIP][16] ([Intel XE#1885])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_hotunplug@hotreplug.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotreplug-lateclose:
    - shard-bmg:          [PASS][17] -> [SKIP][18] ([Intel XE#1885])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-dg2-set2:     [PASS][19] -> [FAIL][20] ([Intel XE#3249])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] ([Intel XE#3453])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#3453])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@core_setmaster@master-drop-set-user:
    - shard-dg2-set2:     [PASS][25] -> [FAIL][26] ([Intel XE#3339])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html

  * igt@fbdev@eof:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2134])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@fbdev@eof.html

  * igt@fbdev@read:
    - shard-dg2-set2:     [PASS][28] -> [SKIP][29] ([Intel XE#2134]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@fbdev@read.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@fbdev@read.html

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][30] -> [SKIP][31] ([Intel XE#2134]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@fbdev@unaligned-write.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@fbdev@unaligned-write.html

  * igt@kms_addfb_basic@bad-pitch-999:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2423]) +81 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_addfb_basic@bad-pitch-999.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-999.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][34] -> [DMESG-FAIL][35] ([Intel XE#1033] / [Intel XE#1727]) +1 other test dmesg-fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][36] -> [DMESG-FAIL][37] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#324]) +1 other test dmesg-fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][38] -> [DMESG-WARN][39] ([Intel XE#324]) +1 other test dmesg-warn
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][40] -> [FAIL][41] ([Intel XE#1426]) +1 other test fail
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][42] -> [FAIL][43] ([Intel XE#1426]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [PASS][44] -> [SKIP][45] ([Intel XE#2136]) +19 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#2327])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][47] -> [SKIP][48] ([Intel XE#2136]) +15 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][49] -> [FAIL][50] ([Intel XE#1231])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][52] -> [SKIP][53] ([Intel XE#2314] / [Intel XE#2894])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2314] / [Intel XE#2894])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][55] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#787]) +76 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#2887]) +4 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1152]) +3 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2252])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#2423] / [i915#2575]) +23 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_color@ctm-0-75.html

  * igt@kms_color@invalid-gamma-lut-sizes@pipe-a:
    - shard-adlp:         [PASS][62] -> [DMESG-WARN][63] ([Intel XE#1033] / [Intel XE#1727]) +3 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-1/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html

  * igt@kms_content_protection@atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][64] ([Intel XE#2715] / [Intel XE#3468])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][65] ([Intel XE#1178]) +1 other test fail
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][66] -> [DMESG-WARN][67] ([Intel XE#877]) +1 other test dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-3.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-3.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2321])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x64:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2423]) +29 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html

  * igt@kms_cursor_edge_walk@128x128-top-bottom:
    - shard-lnl:          [PASS][70] -> [FAIL][71] ([Intel XE#2577]) +1 other test fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-1/igt@kms_cursor_edge_walk@128x128-top-bottom.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [PASS][72] -> [SKIP][73] ([Intel XE#2423] / [i915#2575]) +65 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][74] ([Intel XE#2705])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][75] ([Intel XE#3321] / [Intel XE#3487])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2316]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][78] ([Intel XE#301] / [Intel XE#3486])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][79] ([Intel XE#301]) +9 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][80] ([Intel XE#3468]) +1 other test dmesg-fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][81] ([Intel XE#3468]) +6 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][82] -> [FAIL][83] ([Intel XE#886]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][84] ([Intel XE#2882]) +2 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#455]) +4 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#2136]) +27 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#2380])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2293] / [Intel XE#2380]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2293]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][90] -> [SKIP][91] ([Intel XE#2351])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2136]) +29 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][93] -> [SKIP][94] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2311]) +4 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2313]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [FAIL][97] ([Intel XE#2333]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2350])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2312]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#346])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_lease@atomic-implicit-crtc:
    - shard-adlp:         [PASS][101] -> [TIMEOUT][102] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-4/igt@kms_lease@atomic-implicit-crtc.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_lease@atomic-implicit-crtc.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][103] ([Intel XE#1727])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2763]) +11 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#2446])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-dg2-set2:     [PASS][106] -> [SKIP][107] ([Intel XE#2446]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2446])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#2446]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_pm_rpm@system-suspend-modeset.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#1489]) +2 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr@fbc-psr-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#3414])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sysfs_edid_timing:
    - shard-bmg:          [PASS][114] -> [DMESG-WARN][115] ([Intel XE#3468])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_sysfs_edid_timing.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_sysfs_edid_timing.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#899]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#1499])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][119] ([Intel XE#1727] / [Intel XE#3468])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html

  * igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][120] ([Intel XE#1727] / [Intel XE#3468]) +4 other tests dmesg-fail
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_create@create-invalid-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1130]) +44 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_create@create-invalid-size.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-bmg:          NOTRUN -> [SKIP][122] ([Intel XE#2905]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][123] ([Intel XE#1473] / [Intel XE#2472])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][124] ([Intel XE#2322]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html

  * igt@xe_exec_threads@threads-bal-shared-vm-basic:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1130]) +43 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-basic.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-bmg:          [PASS][126] -> [SKIP][127] ([Intel XE#1130]) +214 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:
    - shard-adlp:         [PASS][128] -> [DMESG-WARN][129] ([Intel XE#3086] / [Intel XE#3343])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-adlp:         [PASS][130] -> [DMESG-WARN][131] ([Intel XE#3086]) +4 other tests dmesg-warn
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-dg2-set2:     [PASS][132] -> [SKIP][133] ([Intel XE#1192])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-bmg:          [PASS][134] -> [SKIP][135] ([Intel XE#2229])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][136] ([Intel XE#2249])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  * igt@xe_oa@mmio-triggered-reports@rcs-0:
    - shard-bmg:          NOTRUN -> [FAIL][137] ([Intel XE#2249])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_oa@mmio-triggered-reports@rcs-0.html

  * igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][138] ([Intel XE#1173])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][139] -> [ABORT][140] ([Intel XE#1607] / [Intel XE#1794])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [PASS][141] -> [ABORT][142] ([Intel XE#1794])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-split-binds-536870912:
    - shard-dg2-set2:     [PASS][143] -> [SKIP][144] ([Intel XE#1130]) +142 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-bmg:          [SKIP][145] ([Intel XE#1885]) -> [PASS][146] +1 other test pass
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#1885]) -> [PASS][148]
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-adlp:         [DMESG-WARN][149] ([Intel XE#3086]) -> [PASS][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html

  * igt@core_setmaster@master-drop-set-root:
    - shard-bmg:          [FAIL][151] -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [SKIP][153] ([Intel XE#2134]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@fbdev@info.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@fbdev@info.html

  * igt@fbdev@nullptr:
    - shard-bmg:          [SKIP][155] ([Intel XE#2134]) -> [PASS][156]
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@fbdev@nullptr.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@fbdev@nullptr.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][157] ([Intel XE#2136]) -> [PASS][158] +30 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [SKIP][159] ([Intel XE#2136]) -> [PASS][160] +10 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][162] +10 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - shard-bmg:          [DMESG-FAIL][163] ([Intel XE#3468]) -> [PASS][164] +4 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_cursor_edge_walk@64x64-top-bottom.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-top-bottom.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [SKIP][165] ([Intel XE#2425]) -> [PASS][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_draw_crc@draw-method-render:
    - shard-bmg:          [INCOMPLETE][167] ([Intel XE#1727] / [Intel XE#3468]) -> [PASS][168] +1 other test pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_draw_crc@draw-method-render.html

  * igt@kms_draw_crc@draw-method-render@rgb565-xtiled:
    - shard-bmg:          [DMESG-FAIL][169] -> [PASS][170] +1 other test pass
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][171] ([Intel XE#2423]) -> [PASS][172] +79 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][173] ([Intel XE#2316]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#2423] / [i915#2575]) -> [PASS][176] +78 other tests pass
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@plain-flip-ts-check@a-edp1:
    - shard-lnl:          [FAIL][177] ([Intel XE#886]) -> [PASS][178] +1 other test pass
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-suspend:
    - shard-adlp:         [DMESG-WARN][179] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][181] ([Intel XE#3012]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-bmg:          [DMESG-WARN][183] ([Intel XE#3468]) -> [PASS][184] +9 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2446]) -> [PASS][186] +2 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [SKIP][187] ([Intel XE#2446]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_sysfs_edid_timing:
    - shard-dg2-set2:     [DMESG-WARN][189] ([Intel XE#1727]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_sysfs_edid_timing.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_sysfs_edid_timing.html

  * igt@xe_exec_basic@many-bindexecqueue-rebind:
    - shard-bmg:          [SKIP][191] ([Intel XE#1130]) -> [PASS][192] +170 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html

  * igt@xe_exec_basic@once-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#1130]) -> [PASS][194] +143 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_basic@once-userptr-invalidate-race.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_exec_basic@once-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-lnl:          [FAIL][195] -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][197] ([Intel XE#958]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@core_hotunplug@hotrebind:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1885]) -> [DMESG-WARN][200] ([Intel XE#3468])
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@core_hotunplug@hotrebind.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@core_hotunplug@hotrebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-bmg:          [SKIP][201] ([Intel XE#2423]) -> [SKIP][202] ([Intel XE#2233])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@bo-too-small:
    - shard-bmg:          [SKIP][203] ([Intel XE#2423]) -> [DMESG-WARN][204] ([Intel XE#1727]) +1 other test dmesg-warn
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_addfb_basic@bo-too-small.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_addfb_basic@bo-too-small.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][205] ([Intel XE#873]) -> [SKIP][206] ([Intel XE#2423])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          [SKIP][207] ([Intel XE#2370]) -> [SKIP][208] ([Intel XE#2423])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][209] ([Intel XE#3468]) -> [DMESG-FAIL][210] ([Intel XE#3468])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][211] ([Intel XE#2327]) -> [SKIP][212] ([Intel XE#2136]) +4 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [DMESG-FAIL][213] ([Intel XE#3468]) -> [SKIP][214] ([Intel XE#2136]) +2 other tests skip
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][216] ([Intel XE#316])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-bmg:          [SKIP][217] ([Intel XE#2136]) -> [SKIP][218] ([Intel XE#2327]) +5 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#316]) -> [SKIP][220] ([Intel XE#2136]) +1 other test skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2136]) -> [SKIP][222] ([Intel XE#316]) +1 other test skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-0:
    - shard-bmg:          [DMESG-WARN][223] ([Intel XE#3468]) -> [SKIP][224] ([Intel XE#2136]) +1 other test skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [INCOMPLETE][225] ([Intel XE#1727] / [Intel XE#3225] / [Intel XE#402]) -> [SKIP][226] ([Intel XE#2136])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#829]) -> [SKIP][228] ([Intel XE#2136] / [Intel XE#2351])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][229] ([Intel XE#1874]) -> [TIMEOUT][230] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-bmg:          [SKIP][231] ([Intel XE#1124]) -> [SKIP][232] ([Intel XE#2136]) +13 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][234] ([Intel XE#619])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#610]) -> [SKIP][236] ([Intel XE#2136])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
    - shard-bmg:          [SKIP][237] ([Intel XE#2136]) -> [SKIP][238] ([Intel XE#610])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][239] ([Intel XE#1231] / [Intel XE#3052]) -> [DMESG-FAIL][240] ([Intel XE#324])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1124]) -> [SKIP][242] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1124]) -> [SKIP][244] ([Intel XE#2136]) +5 other tests skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2136]) -> [SKIP][246] ([Intel XE#1124]) +6 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#607]) -> [SKIP][248] ([Intel XE#2136])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][250] ([Intel XE#1124]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-bmg:          [SKIP][251] ([Intel XE#2136]) -> [SKIP][252] ([Intel XE#1124]) +11 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:
    - shard-bmg:          [SKIP][253] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][254] ([Intel XE#2423]) +1 other test skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          [SKIP][255] ([Intel XE#2423]) -> [SKIP][256] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#2191]) -> [SKIP][258] ([Intel XE#2423] / [i915#2575])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2423] / [i915#2575]) -> [SKIP][260] ([Intel XE#2191])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#367]) -> [SKIP][262] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
    - shard-bmg:          [SKIP][263] ([Intel XE#367]) -> [SKIP][264] ([Intel XE#2423]) +2 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#2423] / [i915#2575]) -> [SKIP][266] ([Intel XE#367]) +5 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-bmg:          [SKIP][267] ([Intel XE#2423]) -> [SKIP][268] ([Intel XE#367]) +1 other test skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][269] ([Intel XE#2887]) -> [SKIP][270] ([Intel XE#2136]) +18 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#2136]) -> [SKIP][272] ([Intel XE#2907]) +2 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs:
    - shard-bmg:          [SKIP][273] ([Intel XE#2136]) -> [SKIP][274] ([Intel XE#2887]) +13 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#2907]) -> [SKIP][278] ([Intel XE#2136]) +1 other test skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-bmg:          [SKIP][279] ([Intel XE#2136]) -> [SKIP][280] ([Intel XE#2652] / [Intel XE#787])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#829]) -> [SKIP][282] ([Intel XE#2136]) +6 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][284] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [INCOMPLETE][285] -> [SKIP][286] ([Intel XE#2136])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          [SKIP][287] ([Intel XE#2136]) -> [SKIP][288] ([Intel XE#3432]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [INCOMPLETE][289] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][290] ([Intel XE#2136])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          [SKIP][291] ([Intel XE#3432]) -> [SKIP][292] ([Intel XE#2136]) +2 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][294] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][296] ([Intel XE#2136]) +8 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-bmg:          [SKIP][297] ([Intel XE#2136]) -> [SKIP][298] ([Intel XE#2724])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          [SKIP][299] ([Intel XE#2325]) -> [SKIP][300] ([Intel XE#2423]) +4 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#306]) -> [SKIP][302] ([Intel XE#2423] / [i915#2575])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2423] / [i915#2575]) -> [SKIP][304] ([Intel XE#306])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html
    - shard-bmg:          [SKIP][305] ([Intel XE#2423]) -> [SKIP][306] ([Intel XE#2325]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#373]) -> [SKIP][308] ([Intel XE#2423] / [i915#2575]) +8 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-read.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-bmg:          [SKIP][309] ([Intel XE#2423]) -> [SKIP][310] ([Intel XE#2252]) +9 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#2423] / [i915#2575]) -> [SKIP][312] ([Intel XE#373]) +10 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-bmg:          [SKIP][313] ([Intel XE#2252]) -> [SKIP][314] ([Intel XE#2423]) +9 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [SKIP][315] ([Intel XE#2423]) -> [INCOMPLETE][316] ([Intel XE#2715] / [Intel XE#3468])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_content_protection@atomic.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][317] ([Intel XE#1178]) -> [SKIP][318] ([Intel XE#2423] / [i915#2575])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          [SKIP][319] ([Intel XE#2390]) -> [SKIP][320] ([Intel XE#2423]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [INCOMPLETE][321] ([Intel XE#2715] / [Intel XE#3468]) -> [SKIP][322] ([Intel XE#2423])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_content_protection@legacy.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-bmg:          [SKIP][323] ([Intel XE#2423]) -> [SKIP][324] ([Intel XE#2341])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_content_protection@lic-type-1.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][325] ([Intel XE#2341]) -> [SKIP][326] ([Intel XE#2423])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_content_protection@mei-interface.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#2423] / [i915#2575]) -> [FAIL][328] ([Intel XE#1178]) +1 other test fail
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_content_protection@srm.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][329] ([Intel XE#1188]) -> [SKIP][330] ([Intel XE#2423] / [i915#2575])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_content_protection@uevent.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_content_protection@uevent.html
    - shard-bmg:          [FAIL][331] ([Intel XE#1188]) -> [SKIP][332] ([Intel XE#2423])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_content_protection@uevent.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          [SKIP][333] ([Intel XE#2320]) -> [SKIP][334] ([Intel XE#2423]) +6 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#2423] / [i915#2575]) -> [SKIP][336] ([Intel XE#308]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#308]) -> [SKIP][338] ([Intel XE#2423] / [i915#2575])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-bmg:          [SKIP][339] ([Intel XE#2423]) -> [SKIP][340] ([Intel XE#2321]) +1 other test skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-32x10:
    - shard-bmg:          [SKIP][341] ([Intel XE#2423]) -> [SKIP][342] ([Intel XE#2320]) +5 other tests skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#455]) -> [SKIP][344] ([Intel XE#2423] / [i915#2575]) +5 other tests skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-bmg:          [SKIP][345] ([Intel XE#2321]) -> [SKIP][346] ([Intel XE#2423])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-bmg:          [SKIP][347] ([Intel XE#2286]) -> [SKIP][348] ([Intel XE#2423])
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-bmg:          [SKIP][349] ([Intel XE#2423]) -> [SKIP][350] ([Intel XE#2286]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#323]) -> [SKIP][352] ([Intel XE#2423] / [i915#2575])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-bmg:          [SKIP][353] ([Intel XE#2423]) -> [DMESG-WARN][354] ([Intel XE#3468])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [INCOMPLETE][355] -> [SKIP][356] ([Intel XE#2291])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][357] ([Intel XE#2291]) -> [SKIP][358] ([Intel XE#2423])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [SKIP][359] ([Intel XE#2423]) -> [SKIP][360] ([Intel XE#2291])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-bmg:          [SKIP][361] ([Intel XE#2423]) -> [DMESG-FAIL][362] ([Intel XE#3468]) +2 other tests dmesg-fail
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-bmg:          [SKIP][363] ([Intel XE#1508]) -> [SKIP][364] ([Intel XE#2136])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [SKIP][365] ([Intel XE#2136]) -> [DMESG-FAIL][366] ([Intel XE#3468]) +9 other tests dmesg-fail
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-bmg:          [SKIP][367] ([Intel XE#2244]) -> [SKIP][368] ([Intel XE#2136]) +3 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-bmg:          [FAIL][369] ([Intel XE#1695]) -> [SKIP][370] ([Intel XE#2136])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-bmg:          [SKIP][371] ([Intel XE#776]) -> [SKIP][372] ([Intel XE#2136])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@chamelium:
    - shard-bmg:          [SKIP][373] ([Intel XE#2423]) -> [SKIP][374] ([Intel XE#2372])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_feature_discovery@chamelium.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][375] ([Intel XE#2373]) -> [SKIP][376] ([Intel XE#2423])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_feature_discovery@display-3x.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#703]) -> [SKIP][378] ([Intel XE#2423] / [i915#2575])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_feature_discovery@display-3x.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#1138]) -> [SKIP][380] ([Intel XE#2423] / [i915#2575])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@display-4x.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@psr1:
    - shard-bmg:          [SKIP][381] ([Intel XE#2423]) -> [SKIP][382] ([Intel XE#2374])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_feature_discovery@psr1.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1135]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@psr1.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [SKIP][385] ([Intel XE#2316]) -> [FAIL][386] ([Intel XE#2882])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [ABORT][387] ([Intel XE#3468]) -> [SKIP][388] ([Intel XE#2423])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][389] ([Intel XE#2316]) -> [SKIP][390] ([Intel XE#2423])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          [DMESG-WARN][391] ([Intel XE#3468]) -> [SKIP][392] ([Intel XE#2423])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [SKIP][393] ([Intel XE#2423] / [i915#2575]) -> [FAIL][394] ([Intel XE#301]) +1 other test fail
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][395] ([Intel XE#2423]) -> [FAIL][396] ([Intel XE#2882])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][397] ([Intel XE#2293] / [Intel XE#2380]) -> [SKIP][398] ([Intel XE#2136]) +5 other tests skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][399] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][400] ([Intel XE#455])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#455]) -> [SKIP][402] ([Intel XE#2136])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][403] ([Intel XE#2136]) -> [SKIP][404] ([Intel XE#2380])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:
    - shard-bmg:          [SKIP][405] ([Intel XE#2136]) -> [SKIP][406] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][407] ([Intel XE#455]) -> [SKIP][408] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#2136]) -> [SKIP][410] ([Intel XE#455]) +3 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_force_connector_basic@force-connector-state:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#540]) -> [SKIP][412] ([Intel XE#2423] / [i915#2575])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@force-connector-state.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][413] ([i915#5274]) -> [SKIP][414] ([Intel XE#2423] / [i915#2575])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][415] ([Intel XE#2136]) -> [SKIP][416] ([Intel XE#2311]) +30 other tests skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][417] ([Intel XE#2136]) -> [SKIP][418] ([Intel XE#2312]) +10 other tests skip
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][419] ([Intel XE#2136]) -> [SKIP][420] ([Intel XE#651]) +19 other tests skip
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][421] ([Intel XE#2311]) -> [SKIP][422] ([Intel XE#2312]) +2 other tests skip
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][423] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][424] ([Intel XE#651]) +9 other tests skip
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:
    - shard-bmg:          [SKIP][425] ([Intel XE#2311]) -> [SKIP][426] ([Intel XE#2136]) +38 other tests skip
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:
    - shard-bmg:          [SKIP][427] ([Intel XE#2136]) -> [FAIL][428] ([Intel XE#2333]) +4 other tests fail
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
    - shard-adlp:         [FAIL][429] ([Intel XE#1861]) -> [TIMEOUT][430] ([Intel XE#1033] / [Intel XE#1727])
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [FAIL][431] ([Intel XE#2333]) -> [SKIP][432] ([Intel XE#2312])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][433] ([Intel XE#2312]) -> [FAIL][434] ([Intel XE#2333]) +1 other test fail
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [FAIL][435] ([Intel XE#2333]) -> [SKIP][436] ([Intel XE#2136]) +14 other tests skip
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][437] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][438] ([Intel XE#658])
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
    - shard-bmg:          [SKIP][439] ([Intel XE#2136]) -> [SKIP][440] ([Intel XE#2352])
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][441] ([Intel XE#651]) -> [SKIP][442] ([Intel XE#2136]) +20 other tests skip
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][443] ([Intel XE#651]) -> [SKIP][444] ([Intel XE#2136] / [Intel XE#2351]) +6 other tests skip
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][445] ([Intel XE#2312]) -> [SKIP][446] ([Intel XE#2311]) +4 other tests skip
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-bmg:          [SKIP][447] ([Intel XE#2352]) -> [SKIP][448] ([Intel XE#2136])
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][449] ([Intel XE#2312]) -> [SKIP][450] ([Intel XE#2313]) +4 other tests skip
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][451] ([Intel XE#653]) -> [SKIP][452] ([Intel XE#2136]) +18 other tests skip
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][453] -> [SKIP][454] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][455] ([Intel XE#2313]) -> [SKIP][456] ([Intel XE#2312]) +1 other test skip
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-bmg:          [SKIP][457] ([Intel XE#2312]) -> [SKIP][458] ([Intel XE#2136]) +3 other tests skip
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-adlp:         [SKIP][459] ([Intel XE#656]) -> [TIMEOUT][460] ([Intel XE#1033] / [Intel XE#1727])
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:
    - shard-bmg:          [SKIP][461] ([Intel XE#2136]) -> [SKIP][462] ([Intel XE#2313]) +22 other tests skip
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][463] ([Intel XE#2136]) -> [SKIP][464] ([Intel XE#653]) +22 other tests skip
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][465] ([Intel XE#653]) -> [SKIP][466] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][467] ([Intel XE#2313]) -> [SKIP][468] ([Intel XE#2136]) +35 other tests skip
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][469] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][470] ([Intel XE#653]) +8 other tests skip
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-repeated-different-handles:
    - shard-dg2-set2:     [SKIP][471] ([Intel XE#687]) -> [SKIP][472] ([Intel XE#2423] / [i915#2575])
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_getfb@getfb-repeated-different-handles.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_getfb@getfb-repeated-different-handles.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-bmg:          [SKIP][473] ([Intel XE#2340]) -> [SKIP][474] ([Intel XE#2423])
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [FAIL][475] -> [SKIP][476] ([Intel XE#2423] / [i915#2575])
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][477] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][478] ([Intel XE#2423])
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_invalid_mode@bad-vsync-start:
    - shard-dg2-set2:     [DMESG-WARN][479] ([Intel XE#1727]) -> [SKIP][480] ([Intel XE#2423] / [i915#2575])
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_invalid_mode@bad-vsync-start.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_invalid_mode@bad-vsync-start.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][481] ([Intel XE#2136]) -> [SKIP][482] ([Intel XE#346])
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-dg2-set2:     [SKIP][483] ([Intel XE#346]) -> [SKIP][484] ([Intel XE#2136])
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-bmg:          [SKIP][485] ([Intel XE#346]) -> [SKIP][486] ([Intel XE#2136])
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][487] ([Intel XE#2136]) -> [SKIP][488] ([Intel XE#3012])
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-bmg:          [SKIP][489] ([Intel XE#2934]) -> [SKIP][490] ([Intel XE#2136])
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][491] ([Intel XE#2136]) -> [SKIP][492] ([Intel XE#2927])
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html
    - shard-bmg:          [SKIP][493] ([Intel XE#2136]) -> [SKIP][494] ([Intel XE#2927])
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-bmg:          [SKIP][495] ([Intel XE#2501]) -> [SKIP][496] ([Intel XE#2423])
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
    - shard-dg2-set2:     [SKIP][497] ([Intel XE#356]) -> [SKIP][498] ([Intel XE#2423] / [i915#2575])
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_alpha_blend@alpha-basic:
    - shard-bmg:          [DMESG-FAIL][499] ([Intel XE#3468]) -> [SKIP][500] ([Intel XE#2423]) +1 other test skip
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-basic.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-bmg:          [SKIP][501] ([Intel XE#2423]) -> [SKIP][502] ([Intel XE#2393]) +1 other test skip
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][503] ([Intel XE#2423] / [i915#2575]) -> [SKIP][504] ([Intel XE#455]) +5 other tests skip
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          [SKIP][505] ([Intel XE#2493]) -> [SKIP][506] ([Intel XE#2423])
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][507] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][508] ([Intel XE#1727]) +2 other tests dmesg-warn
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     [SKIP][509] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][510] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:
    - shard-bmg:          [SKIP][511] ([Intel XE#2423]) -> [SKIP][512] ([Intel XE#2763]) +2 other tests skip
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][513] ([Intel XE#2763]) -> [SKIP][514] ([Intel XE#2423]) +6 other tests skip
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     [SKIP][515] ([Intel XE#2136]) -> [SKIP][516] ([Intel XE#870])
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-bmg:          [SKIP][517] ([Intel XE#870]) -> [SKIP][518] ([Intel XE#2136])
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-dg2-set2:     [SKIP][519] ([Intel XE#1129]) -> [SKIP][520] ([Intel XE#2136])
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-bmg:          [SKIP][521] ([Intel XE#2136]) -> [SKIP][522] ([Intel XE#2392]) +1 other test skip
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     [SKIP][523] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][524] ([Intel XE#1129])
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-bmg:          [DMESG-WARN][525] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][526] ([Intel XE#2136])
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_pm_dc@dc9-dpms.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-dg2-set2:     [SKIP][527] ([Intel XE#908]) -> [SKIP][528] ([Intel XE#2136])
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html
    - shard-bmg:          [SKIP][529] ([Intel XE#2505]) -> [SKIP][530] ([Intel XE#2136])
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-dg2-set2:     [FAIL][531] ([Intel XE#3527]) -> [SKIP][532] ([Intel XE#2136])
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          [SKIP][533] ([Intel XE#1439] / [Intel XE#3141]) -> [SKIP][534] ([Intel XE#2446]) +1 other test skip
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          [SKIP][535] ([Intel XE#2446]) -> [SKIP][536] ([Intel XE#1439] / [Intel XE#3141])
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][537] -> [SKIP][538] ([Intel XE#2446])
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][539] ([Intel XE#1489]) -> [SKIP][540] ([Intel XE#2136]) +9 other tests skip
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][541] ([Intel XE#2136]) -> [SKIP][542] ([Intel XE#1489]) +7 other tests skip
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     [SKIP][543] ([Intel XE#1489]) -> [SKIP][544] ([Intel XE#2136]) +4 other tests skip
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][545] ([Intel XE#2136]) -> [SKIP][546] ([Intel XE#1489]) +8 other tests skip
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-bmg:          [SKIP][547] ([Intel XE#2136]) -> [SKIP][548] ([Intel XE#2387])
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2-set2:     [SKIP][549] ([Intel XE#1122]) -> [SKIP][550] ([Intel XE#2136])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-bmg:          [SKIP][551] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][552] ([Intel XE#2136]) +17 other tests skip
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-psr-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][553] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][554] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     [SKIP][555] ([Intel XE#2136]) -> [SKIP][556] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-bmg:          [SKIP][557] ([Intel XE#2136]) -> [SKIP][558] ([Intel XE#2234] / [Intel XE#2850]) +14 other tests skip
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-primary-page-flip:
    - shard-dg2-set2:     [SKIP][559] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][560] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-page-flip.html
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][561] -> [SKIP][562] ([Intel XE#2136]) +12 other tests skip
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-dg2-set2:     [SKIP][563] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][564] ([Intel XE#2136]) +6 other tests skip
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][565] ([Intel XE#2351]) -> [SKIP][566] ([Intel XE#2850] / [Intel XE#929])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          [SKIP][567] ([Intel XE#2414]) -> [SKIP][568] ([Intel XE#2136])
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@primary-rotation-90:
    - shard-bmg:          [SKIP][569] ([Intel XE#3414]) -> [SKIP][570] ([Intel XE#2423]) +3 other tests skip
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][571] ([Intel XE#2330]) -> [SKIP][572] ([Intel XE#2423])
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][573] ([Intel XE#2423] / [i915#2575]) -> [SKIP][574] ([Intel XE#3414]) +1 other test skip
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][575] ([Intel XE#2423]) -> [SKIP][576] ([Intel XE#2330])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          [SKIP][577] ([Intel XE#2423]) -> [SKIP][578] ([Intel XE#2413])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@invalid-clone-exclusive-crtc:
    - shard-bmg:          [SKIP][579] ([Intel XE#1435]) -> [SKIP][580] ([Intel XE#2423])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [SKIP][581] ([Intel XE#2423]) -> [SKIP][582] ([Intel XE#1435])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][583] ([Intel XE#2426]) -> [SKIP][584] ([Intel XE#2423])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][585] ([Intel XE#2423] / [i915#2575]) -> [SKIP][586] ([Intel XE#1500])
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@query-busy-hang:
    - shard-bmg:          [INCOMPLETE][587] ([Intel XE#1727]) -> [SKIP][588] ([Intel XE#2423])
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vblank@query-busy-hang.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_vblank@query-busy-hang.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          [SKIP][589] ([Intel XE#2423]) -> [SKIP][590] ([Intel XE#1499])
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_vrr@flip-suspend.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][591] -> [SKIP][592] ([Intel XE#2423] / [i915#2575]) +17 other tests skip
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_vrr@flipline.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          [SKIP][593] ([Intel XE#1499]) -> [SKIP][594] ([Intel XE#2423]) +1 other test skip
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vrr@max-min.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_vrr@max-min.html

  * igt@kms_writeback@writeback-check-output:
    - shard-bmg:          [SKIP][595] ([Intel XE#2423]) -> [SKIP][596] ([Intel XE#756]) +1 other test skip
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_writeback@writeback-check-output.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][597] ([Intel XE#2423] / [i915#2575]) -> [SKIP][598] ([Intel XE#756])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][599] ([Intel XE#2423] / [i915#2575]) -> [SKIP][600] ([Intel XE#1091] / [Intel XE#2849])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
    - shard-bmg:          [SKIP][601] ([Intel XE#2423]) -> [SKIP][602] ([Intel XE#1091] / [Intel XE#2849])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [SKIP][603] ([Intel XE#1130]) -> [INCOMPLETE][604] ([Intel XE#1727] / [Intel XE#2771] / [Intel XE#3468])
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_ccs@suspend-resume.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_ccs@suspend-resume.html
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#1130]) -> [INCOMPLETE][606] ([Intel XE#1727] / [Intel XE#3468])
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_ccs@suspend-resume.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_ccs@suspend-resume.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#1126]) -> [SKIP][608] ([Intel XE#1130]) +1 other test skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-close:
    - shard-dg2-set2:     [SKIP][609] ([Intel XE#1130]) -> [SKIP][610] ([Intel XE#2905]) +11 other tests skip
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_eudebug@basic-close.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_eudebug@basic-close.html

  * igt@xe_eudebug@basic-vm-bind:
    - shard-dg2-set2:     [SKIP][611] ([Intel XE#2905]) -> [SKIP][612] ([Intel XE#1130]) +9 other tests skip
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_eudebug@basic-vm-bind.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          [SKIP][613] ([Intel XE#1130]) -> [SKIP][614] ([Intel XE#2905]) +12 other tests skip
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@vm-bind-clear:
    - shard-bmg:          [SKIP][615] ([Intel XE#2905]) -> [SKIP][616] ([Intel XE#1130]) +12 other tests skip
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_eudebug@vm-bind-clear.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html

  * igt@xe_eudebug_online@pagefault-write:
    - shard-bmg:          [SKIP][617] -> [SKIP][618] ([Intel XE#1130])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][619] ([Intel XE#1130]) -> [INCOMPLETE][620] ([Intel XE#1473])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-bmg:          [SKIP][621] ([Intel XE#1130]) -> [TIMEOUT][622] ([Intel XE#1473])
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          [SKIP][623] ([Intel XE#1130]) -> [SKIP][624] ([Intel XE#2322]) +7 other tests skip
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:
    - shard-bmg:          [SKIP][625] ([Intel XE#2322]) -> [SKIP][626] ([Intel XE#1130]) +10 other tests skip
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@no-exec-userptr-invalidate-race:
    - shard-bmg:          [SKIP][627] ([Intel XE#1130]) -> [DMESG-WARN][628] ([Intel XE#3468]) +7 other tests dmesg-warn
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@once-bindexecqueue:
    - shard-dg2-set2:     [SKIP][629] ([Intel XE#1130]) -> [DMESG-WARN][630] ([Intel XE#1727]) +3 other tests dmesg-warn
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_compute_mode@once-bindexecqueue.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_exec_compute_mode@once-bindexecqueue.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     [SKIP][631] ([Intel XE#1130]) -> [SKIP][632] ([Intel XE#288]) +26 other tests skip
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][633] ([Intel XE#288]) -> [SKIP][634] ([Intel XE#1130]) +26 other tests skip
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][635] ([Intel XE#1130]) -> [SKIP][636] ([Intel XE#2360])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-bmg:          [DMESG-WARN][637] ([Intel XE#3468]) -> [SKIP][638] ([Intel XE#1130]) +5 other tests skip
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_exec_reset@cm-close-fd.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:
    - shard-dg2-set2:     [SKIP][639] ([Intel XE#1130]) -> [DMESG-WARN][640] ([Intel XE#3343])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:
    - shard-dg2-set2:     [DMESG-WARN][641] ([Intel XE#3467]) -> [SKIP][642] ([Intel XE#1130]) +1 other test skip
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-bmg:          [SKIP][643] ([Intel XE#1130]) -> [DMESG-WARN][644] ([Intel XE#3343] / [Intel XE#3468])
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
    - shard-dg2-set2:     [DMESG-WARN][645] ([Intel XE#3343]) -> [SKIP][646] ([Intel XE#1130])
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-bmg:          [DMESG-FAIL][647] ([Intel XE#3467]) -> [FAIL][648] ([Intel XE#3499])
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:
    - shard-bmg:          [DMESG-FAIL][649] ([Intel XE#3467] / [Intel XE#3468]) -> [SKIP][650] ([Intel XE#1130])
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html

  * igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:
    - shard-bmg:          [FAIL][651] ([Intel XE#3499]) -> [SKIP][652] ([Intel XE#1130]) +1 other test skip
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html

  * igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:
    - shard-dg2-set2:     [SKIP][653] ([Intel XE#1130]) -> [DMESG-WARN][654] ([Intel XE#3467]) +2 other tests dmesg-warn
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-bmg:          [SKIP][655] ([Intel XE#1130]) -> [DMESG-WARN][656] ([Intel XE#3467]) +1 other test dmesg-warn
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-bmg:          [DMESG-FAIL][657] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][658] ([Intel XE#1130])
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_intel_bb@lot-of-buffers:
    - shard-bmg:          [SKIP][659] ([Intel XE#1130]) -> [DMESG-WARN][660] ([Intel XE#1727]) +4 other tests dmesg-warn
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_intel_bb@lot-of-buffers.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_intel_bb@lot-of-buffers.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][661] ([Intel XE#1130]) -> [SKIP][662] ([Intel XE#560])
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_media_fill@media-fill.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_media_fill@media-fill.html
    - shard-bmg:          [SKIP][663] ([Intel XE#1130]) -> [SKIP][664] ([Intel XE#2459] / [Intel XE#2596])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_media_fill@media-fill.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-FAIL][665] ([Intel XE#3467]) -> [FAIL][666] ([Intel XE#3546])
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_module_load@reload-no-display.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@non-system-wide-paranoid:
    - shard-dg2-set2:     [SKIP][667] ([Intel XE#1130]) -> [SKIP][668] ([Intel XE#3573]) +5 other tests skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html

  * igt@xe_oa@syncs-ufence-wait:
    - shard-dg2-set2:     [SKIP][669] ([Intel XE#3573]) -> [SKIP][670] ([Intel XE#1130]) +9 other tests skip
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html

  * igt@xe_oa@unprivileged-single-ctx-counters:
    - shard-bmg:          [SKIP][671] ([Intel XE#1130]) -> [SKIP][672] ([Intel XE#2248])
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     [SKIP][673] ([Intel XE#1130]) -> [SKIP][674] ([Intel XE#977])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pat@pat-index-xe2.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     [SKIP][675] ([Intel XE#2838] / [Intel XE#979]) -> [SKIP][676] ([Intel XE#1130])
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-dg2-set2:     [SKIP][677] ([Intel XE#1061]) -> [FAIL][678] ([Intel XE#1173])
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_peer2peer@read.html
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_peer2peer@read.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][679] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][680] ([Intel XE#1130]) +1 other test skip
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     [SKIP][681] ([Intel XE#1130]) -> [SKIP][682] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@d3cold-mocs:
    - shard-bmg:          [SKIP][683] ([Intel XE#1130]) -> [SKIP][684] ([Intel XE#2284]) +1 other test skip
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@d3cold-mocs.html
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          [SKIP][685] ([Intel XE#2284]) -> [SKIP][686] ([Intel XE#1130])
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html
   [686]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@d3hot-mocs:
    - shard-dg2-set2:     [DMESG-WARN][687] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][688] ([Intel XE#1130])
   [687]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_pm@d3hot-mocs.html
   [688]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_pm@d3hot-mocs.html

  * igt@xe_pm@d3hot-multiple-execs:
    - shard-bmg:          [DMESG-WARN][689] ([Intel XE#1727] / [Intel XE#3468]) -> [SKIP][690] ([Intel XE#1130])
   [689]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@d3hot-multiple-execs.html
   [690]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [SKIP][691] ([Intel XE#1130]) -> [DMESG-WARN][692] ([Intel XE#1616] / [Intel XE#1727] / [Intel XE#3468])
   [691]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [692]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-exec-after:
    - shard-bmg:          [SKIP][693] ([Intel XE#1130]) -> [DMESG-WARN][694] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [693]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s3-exec-after.html
   [694]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_pm@s3-exec-after.html
    - shard-dg2-set2:     [SKIP][695] ([Intel XE#1130]) -> [DMESG-WARN][696] ([Intel XE#1727] / [Intel XE#3468] / [Intel XE#569])
   [695]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pm@s3-exec-after.html
   [696]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-basic:
    - shard-dg2-set2:     [SKIP][697] ([Intel XE#1130]) -> [DMESG-WARN][698] ([Intel XE#1727] / [Intel XE#3468]) +1 other test dmesg-warn
   [697]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pm@s4-basic.html
   [698]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [DMESG-WARN][699] ([Intel XE#1727] / [Intel XE#2280] / [Intel XE#3468]) -> [SKIP][700] ([Intel XE#1130])
   [699]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@s4-mocs.html
   [700]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-bmg:          [SKIP][701] ([Intel XE#1130]) -> [SKIP][702] ([Intel XE#579])
   [701]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html
   [702]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][703] ([Intel XE#944]) -> [SKIP][704] ([Intel XE#1130]) +4 other tests skip
   [703]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_query@multigpu-query-engines.html
   [704]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_query@multigpu-query-engines.html
    - shard-bmg:          [SKIP][705] ([Intel XE#1130]) -> [SKIP][706] ([Intel XE#944]) +1 other test skip
   [705]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_query@multigpu-query-engines.html
   [706]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-bmg:          [SKIP][707] ([Intel XE#944]) -> [SKIP][708] ([Intel XE#1130]) +2 other tests skip
   [707]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html
   [708]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     [SKIP][709] ([Intel XE#1130]) -> [SKIP][710] ([Intel XE#944]) +1 other test skip
   [709]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html
   [710]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [SKIP][711] ([Intel XE#3342]) -> [SKIP][712] ([Intel XE#1130])
   [711]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html
   [712]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_vm@large-binds-4194304:
    - shard-dg2-set2:     [DMESG-WARN][713] ([Intel XE#1727]) -> [SKIP][714] ([Intel XE#1130])
   [713]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-binds-4194304.html
   [714]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_vm@large-binds-4194304.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-dg2-set2:     [ABORT][715] ([Intel XE#3075] / [Intel XE#3084]) -> [SKIP][716] ([Intel XE#1130])
   [715]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html
   [716]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2233]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
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
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2505]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771
  [Intel XE#2838]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3052]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#3075]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3487]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3546]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -> xe-pw-141795v2

  IGT_8126: 8126
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198
  xe-pw-141795v2: 141795v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/index.html

--===============0153457874220442357==
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
<tr><td><b>Series:</b></td><td>Make OA buffer size configurable (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141795/">https://patchwork.freedesktop.org/series/141795/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198_full -&gt; xe-pw-141795v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141795v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141795v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141795v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@core_getversion@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_getversion@basic.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_drm_fdinfo@utilization-others-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@xe_drm_fdinfo@utilization-others-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-3/igt@xe_drm_fdinfo@utilization-others-idle.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_module_load@reload.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s3-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_pm@s3-mocs.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141795v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getclient:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_getclient.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_getclient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@core_getversion@all-cards.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_hotunplug@hotreplug.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_hotunplug@hotreplug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug-lateclose:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@core_hotunplug@hotreplug-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_hotunplug@hotreplug-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-root.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_setmaster@master-drop-set-root.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3249">Intel XE#3249</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>)</li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-user:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@core_setmaster@master-drop-set-user.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@core_setmaster@master-drop-set-user.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3339">Intel XE#3339</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@fbdev@read.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@fbdev@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@fbdev@unaligned-write.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@fbdev@unaligned-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-999:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_addfb_basic@bad-pitch-999.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_addfb_basic@bad-pitch-999.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +81 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-5/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-gamma-lut-sizes@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-1/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_color@invalid-gamma-lut-sizes@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_content_protection@atomic@pipe-a-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_crc@cursor-alpha-opaque@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x64:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_crc@cursor-rapid-movement-64x64.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-7/igt@kms_cursor_edge_walk@128x128-top-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-1/igt@kms_cursor_edge_walk@128x128-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3487">Intel XE#3487</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@a-dp2.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip@plain-flip-fb-recreate-interruptible@c-dp2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-4/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@pipe-fbc-rte@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@atomic-implicit-crtc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-4/igt@kms_lease@atomic-implicit-crtc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_lease@atomic-implicit-crtc.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_psr@fbc-psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_sysfs_edid_timing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_sysfs_edid_timing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_vrr@seamless-rr-switch-vrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-system-vram01.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_ccs@suspend-resume@linear-compressed-compfmt0-vram01-vram01.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_create@create-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +214 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-8/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-1/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ct_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-6/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-6/igt@xe_oa@mmio-triggered-reports@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@rcs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_oa@mmio-triggered-reports@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_peer2peer@read@read-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-536870912:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-split-binds-536870912.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_vm@large-split-binds-536870912.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +142 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@core_hotunplug@hotunbind-rebind.html">PASS</a> +1 other test pass</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@core_hotunplug@hotunbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@core_hotunplug@hotunbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-9/igt@core_hotunplug@unbind-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_setmaster@master-drop-set-root:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@core_setmaster@master-drop-set-root.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@core_setmaster@master-drop-set-root.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@fbdev@info.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> +30 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_cursor_edge_walk@64x64-top-bottom.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cursor_edge_walk@64x64-top-bottom.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_display_modes@extended-mode-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2425">Intel XE#2425</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_draw_crc@draw-method-render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-render@rgb565-xtiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_draw_crc@draw-method-render@rgb565-xtiled.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +79 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip@blocking-wf_vblank.html">PASS</a> +78 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-3/igt@kms_flip@plain-flip-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_pipe_crc_basic@nonblocking-crc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sysfs_edid_timing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_sysfs_edid_timing.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_sysfs_edid_timing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_exec_basic@many-bindexecqueue-rebind.html">PASS</a> +170 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@once-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_basic@once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_exec_basic@once-userptr-invalidate-race.html">PASS</a> +143 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-6/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@core_hotunplug@hotrebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2233">Intel XE#2233</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bo-too-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_addfb_basic@bo-too-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_addfb_basic@bo-too-small.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@x-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3052">Intel XE#3052</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_big_fb@yf-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +5 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@bad-rotation-90-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_content_protection@atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_content_protection@legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_content_protection@lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_content_protection@srm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_cursor_crc@cursor-onscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_draw_crc@draw-method-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695">Intel XE#1695</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">Intel XE#776</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_fbcon_fbt@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2372">Intel XE#2372</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_feature_discovery@psr1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@kms_flip@2x-flip-vs-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +4 other tests fail</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-repeated-different-handles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_getfb@getfb-repeated-different-handles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vsync-start:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_invalid_mode@bad-vsync-start.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_invalid_mode@bad-vsync-start.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501">Intel XE#2501</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_alpha_blend@alpha-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_plane_alpha_blend@alpha-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">Intel XE#2392</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_pm_dc@dc9-dpms.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2505">Intel XE#2505</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_dc@deep-pkgc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_pm_lpsp@kms-lpsp.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3527">Intel XE#3527</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-update-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_psr@fbc-psr2-cursor-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_scaling_modes@scaling-mode-full.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_setmode@invalid-clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-busy-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vblank@query-busy-hang.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_vblank@query-busy-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@kms_vrr@flipline.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2771">Intel XE#2771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_ccs@suspend-resume.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_ccs@suspend-resume.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-close:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_eudebug@basic-close.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_eudebug@basic-vm-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_eudebug@vm-bind-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@pagefault-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_eudebug_online@pagefault-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_exec_basic@no-exec-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_compute_mode@once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_exec_compute_mode@once-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_exec_reset@cm-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_relay_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_tile_init_early.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-4/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_execute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_fault_injection@vm-bind-fail-xe_pt_update_ops_prepare.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_fault_injection@vm-create-fail-xe_exec_queue_create_bind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_gt_freq@freq_suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_gt_freq@freq_suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@lot-of-buffers:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_intel_bb@lot-of-buffers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_intel_bb@lot-of-buffers.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459">Intel XE#2459</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_module_load@reload-no-display.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3546">Intel XE#3546</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-system-wide-paranoid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_oa@non-system-wide-paranoid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_oa@syncs-ufence-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@unprivileged-single-ctx-counters:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_oa@unprivileged-single-ctx-counters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248">Intel XE#2248</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2838">Intel XE#2838</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_peer2peer@read.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_pm@d3cold-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-5/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-5/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_pm@d3hot-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_pm@d3hot-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@d3hot-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_pm@d3hot-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1616">Intel XE#1616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pm@s3-exec-after.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-436/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_pm@s4-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_pm@s4-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-6/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-435/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-1/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-7/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-2/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-435/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-bmg-7/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-bmg-1/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-binds-4194304:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_vm@large-binds-4194304.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_vm@large-binds-4194304.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198/shard-dg2-436/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3075">Intel XE#3075</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3084">Intel XE#3084</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141795v2/shard-dg2-434/igt@xe_wedged@wedged-mode-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198 -&gt; xe-pw-141795v2</li>
</ul>
<p>IGT_8126: 8126<br />
  xe-2281-739a2506c44a0be22cc842d2c625a05ed21c1198: 739a2506c44a0be22cc842d2c625a05ed21c1198<br />
  xe-pw-141795v2: 141795v2</p>

</body>
</html>

--===============0153457874220442357==--
