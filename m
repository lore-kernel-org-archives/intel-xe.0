Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA7EC021AA
	for <intel-xe@archiver.kernel.org>; Tue, 18 Feb 2025 14:45:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD93210E6DB;
	Tue, 18 Feb 2025 14:45:41 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C01F10E6DB;
 Tue, 18 Feb 2025 14:45:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4083504565294527925=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Improve_type-safety_on_POW?=
 =?utf-8?q?ER=5FDOMAIN=5F*=28=29_macros_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Feb 2025 14:45:40 -0000
Message-ID: <173988994036.3587813.14663137788084812103@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250217203722.87152-1-gustavo.sousa@intel.com>
In-Reply-To: <20250217203722.87152-1-gustavo.sousa@intel.com>
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

--===============4083504565294527925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Improve type-safety on POWER_DOMAIN_*() macros (rev3)
URL   : https://patchwork.freedesktop.org/series/144727/
State : failure

== Summary ==

CI Bug Log - changes from xe-2677-c282b8face163244076dac30e4c9ffd74dc89044_full -> xe-pw-144727v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-144727v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-144727v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-144727v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html

  * igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate:
    - shard-dg2-set2:     [PASS][3] -> [SKIP][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-bmg:          [PASS][5] -> [SKIP][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][7] ([Intel XE#316]) -> [SKIP][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][9] ([Intel XE#2763] / [Intel XE#455]) -> [INCOMPLETE][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#2763]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-bmg:          [DMESG-WARN][13] ([Intel XE#4172]) -> [DMESG-WARN][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html
    - shard-dg2-set2:     [DMESG-WARN][15] ([Intel XE#1033]) -> [DMESG-WARN][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][17] ([Intel XE#4268]) -> [ABORT][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-144727v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][19] ([Intel XE#1124]) +1 other test skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#367])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#787]) +50 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#2652] / [Intel XE#787]) +7 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][23] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][24] -> [INCOMPLETE][25] ([Intel XE#1033])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#373]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_color@ctm-negative@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][28] ([Intel XE#1033]) +2 other tests dmesg-warn
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_color@ctm-negative@pipe-d-dp-4.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][29] ([Intel XE#1033])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [PASS][30] -> [SKIP][31] ([Intel XE#309]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][32] -> [SKIP][33] ([Intel XE#2291]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-dg2-set2:     [PASS][34] -> [SKIP][35] ([Intel XE#310]) +6 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [PASS][36] -> [DMESG-WARN][37] ([Intel XE#2955])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][38] ([Intel XE#3321])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2316]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [PASS][41] -> [FAIL][42] ([Intel XE#3321]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][43] ([Intel XE#301] / [Intel XE#3321]) +3 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][44] -> [FAIL][45] ([Intel XE#301])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html

  * igt@kms_flip@plain-flip-fb-recreate@a-edp1:
    - shard-lnl:          [PASS][46] -> [FAIL][47] ([Intel XE#886]) +2 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [PASS][48] -> [DMESG-FAIL][49] ([Intel XE#1033]) +1 other test dmesg-fail
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][50] -> [FAIL][51] ([Intel XE#1874])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][52] -> [DMESG-WARN][53] ([Intel XE#1033]) +17 other tests dmesg-warn
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [PASS][54] -> [SKIP][55] ([Intel XE#656]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#651]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_panel_fitting@atomic-fastset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#455])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2-set2:     [PASS][59] -> [SKIP][60] ([i915#2575])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_plane@plane-panning-top-left.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][61] ([Intel XE#4172]) +3 other tests dmesg-warn
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#1489]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1122])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#2939])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1127])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#899])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vrr@negative-basic:
    - shard-dg2-set2:     [PASS][69] -> [SKIP][70] ([Intel XE#455])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_vrr@negative-basic.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_vrr@negative-basic.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2905]) +2 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_exec_fault_mode@twice-basic-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#288]) +5 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-basic-prefetch.html

  * igt@xe_module_load@reload:
    - shard-adlp:         [PASS][73] -> [DMESG-WARN][74] ([Intel XE#4173]) +1 other test dmesg-warn
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@xe_module_load@reload.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-2/igt@xe_module_load@reload.html

  * igt@xe_oa@map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][75] ([Intel XE#2541] / [Intel XE#3573])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-bmg:          [PASS][76] -> [DMESG-WARN][77] ([Intel XE#4172]) +6 other tests dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@xe_oa@syncs-syncobj-cfg.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-1/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [ABORT][78] ([Intel XE#4268])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_vm@large-userptr-misaligned-binds-2097152:
    - shard-dg2-set2:     [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#1727])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@xe_vm@large-userptr-misaligned-binds-2097152.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_vm@large-userptr-misaligned-binds-2097152.html

  
#### Possible fixes ####

  * igt@core_hotunplug@hotrebind:
    - shard-adlp:         [DMESG-WARN][81] ([Intel XE#4173]) -> [PASS][82] +1 other test pass
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@core_hotunplug@hotrebind.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-3/igt@core_hotunplug@hotrebind.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][83] ([Intel XE#1033]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][85] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][87] ([Intel XE#2291]) -> [PASS][88] +7 other tests pass
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-dg2-set2:     [SKIP][89] ([Intel XE#309]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#3009]) -> [PASS][92]
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_dp_aux_dev.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [SKIP][93] ([Intel XE#2316]) -> [PASS][94] +9 other tests pass
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          [DMESG-WARN][95] ([Intel XE#4172]) -> [PASS][96] +41 other tests pass
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [SKIP][97] ([Intel XE#310]) -> [PASS][98] +2 other tests pass
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:
    - shard-bmg:          [FAIL][99] ([Intel XE#2882]) -> [PASS][100] +1 other test pass
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][101] ([Intel XE#301]) -> [PASS][102] +6 other tests pass
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:
    - shard-bmg:          [FAIL][103] ([Intel XE#3321]) -> [PASS][104] +2 other tests pass
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][105] ([Intel XE#301]) -> [PASS][106] +1 other test pass
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:
    - shard-bmg:          [DMESG-WARN][107] ([Intel XE#2955]) -> [PASS][108] +2 other tests pass
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:
    - shard-lnl:          [FAIL][109] ([Intel XE#886]) -> [PASS][110] +1 other test pass
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [INCOMPLETE][111] -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][113] ([Intel XE#656]) -> [PASS][114] +5 other tests pass
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-dg2-set2:     [SKIP][115] ([Intel XE#4328]) -> [PASS][116]
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [SKIP][117] ([Intel XE#2571]) -> [PASS][118]
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [DMESG-WARN][119] -> [PASS][120]
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-3/igt@kms_properties@crtc-properties-atomic.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [FAIL][121] ([Intel XE#2883]) -> [PASS][122] +1 other test pass
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_setmode@basic.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-8/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][123] ([Intel XE#2883]) -> [PASS][124] +2 other tests pass
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [FAIL][125] ([Intel XE#899]) -> [PASS][126]
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [DMESG-WARN][127] ([Intel XE#2953]) -> [PASS][128] +1 other test pass
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-beng-small-external-cm:
    - shard-bmg:          [DMESG-WARN][129] ([Intel XE#1473] / [Intel XE#4172]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@xe_evict@evict-beng-small-external-cm.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@xe_evict@evict-beng-small-external-cm.html

  * igt@xe_evict@evict-beng-small-multi-vm:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#1033] / [Intel XE#1473]) -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_evict@evict-beng-small-multi-vm.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_evict@evict-beng-small-multi-vm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][133] ([Intel XE#1033]) -> [PASS][134] +18 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [DMESG-WARN][135] ([Intel XE#3088] / [Intel XE#4172]) -> [PASS][136] +1 other test pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  
#### Warnings ####

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][137] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][138] ([Intel XE#787]) +9 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][139] ([Intel XE#787]) -> [SKIP][140] ([Intel XE#455] / [Intel XE#787]) +8 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [DMESG-WARN][141] ([Intel XE#1033]) -> [INCOMPLETE][142] ([Intel XE#1033] / [Intel XE#1727])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][143] ([Intel XE#1178]) -> [SKIP][144] ([Intel XE#2341])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_content_protection@atomic.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [FAIL][145] ([Intel XE#1178]) -> [SKIP][146] ([Intel XE#455])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@srm:
    - shard-dg2-set2:     [SKIP][147] ([Intel XE#455]) -> [DMESG-FAIL][148] ([Intel XE#1033])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_content_protection@srm.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_content_protection@srm.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [DMESG-WARN][149] ([Intel XE#4172]) -> [SKIP][150] ([Intel XE#2291])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [DMESG-FAIL][151] ([Intel XE#1033]) -> [FAIL][152] ([Intel XE#4164])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-bmg:          [DMESG-WARN][153] ([Intel XE#2955]) -> [SKIP][154] ([Intel XE#2316])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][155] ([Intel XE#2316]) -> [FAIL][156] ([Intel XE#3321])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
    - shard-dg2-set2:     [FAIL][157] ([Intel XE#301]) -> [SKIP][158] ([Intel XE#310])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-dg2-set2:     [DMESG-WARN][159] ([Intel XE#1033]) -> [SKIP][160] ([Intel XE#310])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-bmg:          [SKIP][161] ([Intel XE#2316]) -> [DMESG-WARN][162] ([Intel XE#4172])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-dg2-set2:     [SKIP][163] ([Intel XE#310]) -> [DMESG-WARN][164] ([Intel XE#1033])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [DMESG-WARN][165] ([Intel XE#1033]) -> [SKIP][166] ([i915#2575])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][167] ([Intel XE#2312]) -> [SKIP][168] ([Intel XE#2311]) +26 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][169] ([Intel XE#2311]) -> [SKIP][170] ([Intel XE#2312]) +10 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][171] ([Intel XE#651]) -> [SKIP][172] ([Intel XE#656]) +14 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][173] ([Intel XE#4141]) -> [SKIP][174] ([Intel XE#2312]) +4 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][175] ([Intel XE#656]) -> [DMESG-WARN][176] ([Intel XE#1033])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][177] ([Intel XE#2312]) -> [SKIP][178] ([Intel XE#4141]) +12 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][179] ([Intel XE#656]) -> [SKIP][180] ([Intel XE#651]) +8 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][181] ([Intel XE#653]) -> [SKIP][182] ([Intel XE#656]) +10 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][183] ([Intel XE#2313]) -> [SKIP][184] ([Intel XE#2312]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][185] ([Intel XE#2312]) -> [SKIP][186] ([Intel XE#2313]) +25 other tests skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#656]) -> [SKIP][188] ([Intel XE#653]) +11 other tests skip
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][189] ([Intel XE#2426]) -> [SKIP][190] ([Intel XE#2509])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#362]) -> [SKIP][192] ([Intel XE#1500])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * Linux: xe-2677-c282b8face163244076dac30e4c9ffd74dc89044 -> xe-pw-144727v3

  IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044
  xe-pw-144727v3: 144727v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/index.html

--===============4083504565294527925==
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
<tr><td><b>Series:</b></td><td>Improve type-safety on POWER_DOMAIN_*() macros (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144727/">https://patchwork.freedesktop.org/series/144727/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2677-c282b8face163244076dac30e4c9ffd74dc89044_full -&gt; xe-pw-144727v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-144727v3_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-144727v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-144727v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_exec_balancer@many-execqueues-cm-virtual-userptr-invalidate.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@xe_live_ktest@xe_mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@xe_live_ktest@xe_mocs.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_pm_rpm@modeset-stress-extra-wait.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-144727v3_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_color@ctm-negative@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_content_protection@srm@pipe-a-dp-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@flip-vs-expired-vblank@b-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +17 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@atomic-fastset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_panel_fitting@atomic-fastset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_plane@plane-panning-top-left.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_plane_lowres@tiling-none@pipe-d-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr@fbc-pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-basic-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_exec_fault_mode@twice-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-2/igt@xe_module_load@reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_oa@map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@xe_oa@syncs-syncobj-cfg.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-1/igt@xe_oa@syncs-syncobj-cfg.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_vm@large-userptr-misaligned-binds-2097152.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@core_hotunplug@hotrebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-3/igt@core_hotunplug@hotrebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html">PASS</a> +41 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_flip@2x-wf_vblank-ts-check-interruptible.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-dp2.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@d-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-7/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check-interruptible@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-render.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4328">Intel XE#4328</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_joiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-8/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-3/igt@kms_properties@crtc-properties-atomic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-4/igt@kms_properties@crtc-properties-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-8/igt@kms_setmode@basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-lnl-5/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-adlp-2/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-adlp-3/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external-cm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@xe_evict@evict-beng-small-external-cm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@xe_evict@evict-beng-small-external-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@xe_evict@evict-beng-small-multi-vm.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@xe_evict@evict-beng-small-multi-vm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> +18 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088">Intel XE#3088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_content_protection@srm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_fbcon_fbt@fbc-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164">Intel XE#4164</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_flip@2x-modeset-vs-vblank-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_flip@2x-plain-flip-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4172">Intel XE#4172</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_flip@2x-wf_vblank-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_flip@2x-wf_vblank-ts-check.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2677-c282b8face163244076dac30e4c9ffd74dc89044/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144727v3/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2677-c282b8face163244076dac30e4c9ffd74dc89044 -&gt; xe-pw-144727v3</li>
</ul>
<p>IGT_8235: e7e14eff66bc42329903ee579f019094cf1fdfce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2677-c282b8face163244076dac30e4c9ffd74dc89044: c282b8face163244076dac30e4c9ffd74dc89044<br />
  xe-pw-144727v3: 144727v3</p>

</body>
</html>

--===============4083504565294527925==--
